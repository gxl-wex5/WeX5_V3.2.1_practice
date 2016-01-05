define(function(require) {
	var $ = require("jquery"), 
	FastClick = require("$UI/system/components/justep/lib/fastclick"),
	WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer");
	justep = require("$UI/system/lib/justep"),
	require("$UI/system/lib/cordova/cordova");
	require('$UI/system/lib/jquery/transition');

	// 为了compose后postMessage到这里终止
	window.isPortalWindow = true;

	// 主要配置
	var mainPage = {
		url : './main.w',
		process : "/portal/process/message/messageProcess",
		activity : "mainActivity"
	}, mainPageId = 'main';

	var Model = function() {
		this.init();
		this.callParent();
	};
	
	
	Model.prototype = {
		// 返回一个.w url
		getURL : function(url, args) {
		if(!url) return;
			if(typeof url !== 'string'){
				args = url;//TODO clone;
				url = args.url;
				delete args.url;
			}
			args = args || {};
			if(url && url.indexOf("http")!==0){
				var params = [];
				for(var key in args){
					if(args.hasOwnProperty(key))
						params.push(key + '=' + (args[key] || ''));
				}
				params = params.join('&');
				url = url + (url.indexOf('?') == -1?'?':'&') + params;
				url = require.toUrl(url);
            }
            return url;
		},
		init : function() {
			// 初始化接受postMessage消息
			var me = this;
			$(window).on('message',function(message){
				var data = message.originalEvent.data;
				try{/*这里是为了兼容IE9*/
					data = JSON.parse(data);
				}catch(e){}	
				if(data.type == "portal" && data.event){
					var name = data.event.name;
					if(typeof me[name] == 'function')
							me[name].apply(me, data.event.args);
				}
			});
		},
		openPage: function(path, options,fn){
			if(typeof options == 'function'){
				fn = options;
				options = {};
			}
			if(typeof path == 'object'){
				path = path.url;
			}
			var me = this;
			options = options || {};
			var pages = this.comp('pages'),
				url = this.getURL(path, options),
				pid = path;
			if(!pages.has(pid)){
				this.loadPage(pid,url,function(err){
					if (err){
						setTimeout(function(){
							//hcr 特殊点, 必须知道错误对话框的btn
							$("#__justepErrorDialog__").find(".x-error-close").one("click", function(){
								setTimeout(function(){
									//以下逻辑应该和closePage类似, maduo支持closePage传pid后, 直接调用即可
									var index = me.openeds.indexOf(pid);
									if (index !== -1){
										me.openeds.splice(index, 1);
									}
									if (pages.getContent(pid))
										pages.getContent(pid).dispose();
								});
							}); 
						});
					}
					
				});
				
				function after() {
					pages.to(pid);
					me.openeds.push(pid);
					me.current = justep.Util.clone(options);
					me.current.path = path;
				}
				setTimeout(after, 200);
			}else{
				fn && fn();
			}	
		},
		loadPage: function(xid,url,fn){
			var pages = this.comp('pages');
			var content = pages.getContent(xid);
			if(!content){
				content = pages.add({xid: xid});
			}
			var parentNode = content.$domNode.get(0);
			var compose = new WindowContainer({
				parentNode: parentNode,
				src: url,
				onLoad: function(){
					fn && fn();
					content.on("onActive", function(){
						if(compose.getInnerModel()){
							compose.getInnerModel().fireEvent('onActive');
						}
					});
				},
				onLoadError: function(err){
					fn && fn(err);
				}
			});
			content.innerContainer = compose; 
		},
		closePage : function() {
			var pages = this.comp('pages');
			if (this.openeds[this.openeds.length - 1] !== mainPageId) {
				var pid = this.openeds.pop();
				var to = this.openeds[this.openeds.length - 1];
				if (to != mainPageId)
					pages.remove(pid, to);
				else
					pages.remove(pid);
			}
		},
	};

	Model.prototype.modelLoad = function(event) {
		var pages = this.comp('pages'), portal = this.comp('portal');
		// 加载主页面
		this.loadPage(mainPageId, this.getURL(mainPage));

		// open stack
		this.openeds = [ mainPageId ];

		// 初始当前页
		var current = getParameter('current');
		if (current) {
			var path = current.path;
			delete current.path;
			this.openPage(path, current);
		}
	};

	return Model;

	function getParameter(name) {
		var search = window.location.search;
		var params = {};
		search = search ? search : "";
		var hash = window.location.hash;
		if (hash && (hash.indexOf("=") != -1)) {
			search += "&" + hash.substring(1);
		}

		if (search.charAt(0) == "?") {
			search = search.substring(1);
		}

		var items = search.split("&");
		for ( var i = 0; i < items.length; i++) {
			var item = items[i];
			var index = item.indexOf("=");
			if (item && (index != -1)) {
				var key = item.substring(0, index), value = decodeURIComponent(item.substring(index + 1));
				if (key.indexOf('.') == '-1')
					params[key] = value;
				else {
					key = key.split('.');
					var obj = params[key[0]] = params[key[0]] || {};
					for ( var j = 1; j < key.length - 1; j++) {
						obj = obj[key[j]] || {};
					}
					obj[key.pop()] = value;
				}
			}
		}
		return params[name];
	}
});
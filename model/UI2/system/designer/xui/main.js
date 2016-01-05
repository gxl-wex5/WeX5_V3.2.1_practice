function getRequestParameter(paramName) {
	var url = decodeURI(window.location.href);
	var idx = url.indexOf("?");
	var params = url.substring(idx + 1);
	if (params) {
		params = params.split("&");
		for ( var i = 0; i < params.length; i += 1) {
			var param = params[i].split("=");
			if (param[0] == paramName) {
				var targetValue = param[1];
				var idx2 = targetValue.indexOf("#");
				if (idx2 != -1) {
					targetValue = targetValue.substring(0, idx2);
				}
				return decodeURIComponent(targetValue);;
			}
		}
	}
}
window.__justep = {};
var href = window.location.href;
//var __version = "$abc" ;
//var idx1 = href.indexOf("/$v");
//if(idx1>0){
//	var idx2 = href.indexOf("/",idx1+2);
//	__version = href.substring(idx1+1,idx2);
//}

var uiPath = getRequestParameter("uiPath");
var device = getRequestParameter("device");
if(!device || device == 'pc'){
	device = "v_l_s_desktopd_pc";
}else{
	device = "v_l_s_d_m";
}
var contextPathName = getRequestParameter("contextPathName");
var hasMin = getRequestParameter("hasMin");
 
var _$UI = uiPath.substring(uiPath.lastIndexOf("/") + 1);
var _$model = uiPath.substring(0, uiPath.lastIndexOf("/"));
var _systemPath = '/' + contextPathName +'/' + _$UI + '/system';
var paths = { 
		'$model' : "/" + contextPathName ,// _$model,
		'bind' : '../../lib/bind/bind',
		'modernizr': '../../lib/base/modernizr-2.8.3.min',
		'xuiService' : '../../components/designerCommon/js/xuiService',
		'jquery' : '../../lib/jquery/jquery-1.11.1',
		'jqueryEx' : './jqueryEx',
		'designer' : hasMin=="true"?'./designer.min':'designer'
	};
paths["$model/"+_$UI] = "/" + contextPathName+ '/'+_$UI+'/'+device;

requirejs.config({
	baseUrl : '/' + contextPathName +'/' + _$UI + '/system/designer/xui',
	paths : paths,
	shim : {
        'modernizr': {
            exports: 'Modernizr'
           }
	},
	map : {
		  '*' : {
		   cordova : _systemPath + '/lib/require/cordova.js',
		   res : _systemPath + '/lib/require/res.js',
		   w : _systemPath + '/lib/require/w.js',
		   css : _systemPath + '/lib/require/css.js'
		  }
	},
	deps: ['modernizr'],
	waitSeconds : 30
});

var initData;
function executeMethod(params) {
	if (params) {
		var oParams = typeof params == 'string' ? eval("(" + params + ")") : params;
		var methodName = oParams.methodName;
		if (methodName == 'initData') {
			initData = oParams;
		}
		if (window.designer) {
			initData = null;
			return window.designer.executeMethod(methodName, oParams);
		}
	}
}

function executeCompMethod(params) {
	
	var oParams = typeof params == 'string' ? eval("(" + params + ")") : params;
	var dId = params["d_id"];
	var target = $("*[d_id='" + dId + "']:first")[0];
	if (!target) {
		return;
	}
 
	var com = window.designer.getComponent(target);
	if (!com) {
		com = window.designer.getOwnerComponent(target);
	}
	params.target = target;
	var methodName = oParams.methodName;
	if (window.designer[methodName]) {
		window.designer[methodName](params);
	}

	if (com && com[methodName]) {
		com[methodName](params);
	}

	delete params.target;
	var str = JSON.stringify(params);
	return str;
}

function regComponents(componentMap) {
	for ( var p in componentMap) {
		var cfg = window.componentConfig[p];
		if (cfg) {
			cfg["js-class"] = componentMap[p];
		}
	}
}
var __requireHistoryList = [];//已经加载的组件列表
function __loadDepends(compList,callback){
	var newCompList = [];
	if(__requireHistoryList.length>0){
		//判断组件是否已经加载，已经加载过的不再加载
		for(var i = 0;i<compList.length;i+=1){
			if($.inArray(compList[i],__requireHistoryList) ==-1){
				newCompList.push(compList[i]);
			}else{
				__requireHistoryList.push(compList[i]);
			}
		}
		
		if(newCompList.length == 0){
			callback();
			return;
		}
	}else{
		//第一次加载
		__requireHistoryList = compList;
		newCompList = compList;
	}
	var depends = {}; 
	var url = "http://localhost:"+this.getRequestParameter("UIServerPort")+"/"+contextPathName+"/"+_$UI+"/system/designer/xui/DesignerService.j";
 
	$.ajax({
		async : false,
		data : {
			componentUrls :newCompList.join(",")
		},
		dataType : 'json',
		type : 'POST',
		url : url,
		success : function(result) { 
			depends = result;
		},
		error : function(xhr, status, err) {
			var erroeMsg = "ajax请求出错：" + [ status, xhr.readyState, err ];
			console.log(erroeMsg);
		}
	});
	debugger;
	//加载css
	require(depends.cssDependList,function(){
		for(var i = 0;i<arguments.length;i+=1){
			arguments[i].load();
		}
	});
	//加载依赖的min文件
	require(depends.jsDependList,callback);
}

 

var __callInitFlag = false;
function __init(initData) {
	window.componentConfig = initData.componentConfig;
	__callInitFlag = true;
 
	initData = typeof initData == 'string' ? eval("(" + initData + ")") : initData;
 
	var requireList = initData.requireList;
	
	for ( var i = 0; i < requireList.length; i += 1) {
		requireList[i] = requireList[i].replace(_$model, "$model");
	}

	__loadDepends( requireList,function(){
		requireList.push("designer");
		require(requireList, function() {
			for ( var i = 0; i < arguments.length - 1; i += 1) {
				regComponents(arguments[i]);
			}
			window.designer = arguments[arguments.length - 1];
			if (initData) {
				window.designer.initData(initData);
			}
			document.onkeydown = function() {
				if (event.keyCode == 116) {
					event.keyCode = 0;
					event.cancelBubble = true;
					return false;
				}
			};
			document.oncontextmenu = function() {
				return false;
			};
		});
	});
}

require([ "../../components/designerCommon/js/webSocketMng" ], function(websocket) {
	websocket.callJava({
		filePath : websocket.getRequestParameter("filePath"),
		methodName : 'getInitData',
		callback : "__init"
	});
	var timer1 = setInterval(function() {// 第一次打开studio时websocket初始化不成功时会重新初始化
		if (!websocket.isOpened()) {
			websocket.clean();
			websocket.callJava({
				filePath : websocket.getRequestParameter("filePath"),
				methodName : 'getInitData',
				callback : "__init"
			});
		} else {
			clearInterval(timer1);
		}
	}, 3000);
});

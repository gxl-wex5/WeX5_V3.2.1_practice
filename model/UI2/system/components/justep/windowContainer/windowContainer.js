/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
/**
 * 1. 声明形使用 <div
 * component="$UI/system/components/justep/windowContainer/windowContainer"
 * src="" process="" activity=""/> 2. js动态创建 var WindowContainerClass =
 * require("$UI/system/components/justep/windowContainer/windowContainer"); var
 * windowContainer = new WindowContainerClass({parentNode: e,
 * src:"",process:"",activity:""});
 */
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var composition = require("$UI/system/lib/base/composition");
	var url = require.normalizeName("./windowContainer");
	var ComponentConfig = require("./windowContainer.config");

	var INNER_MODEL = "__inner-model__";

	var WindowContainer = justep.ViewComponent.extend({
		// 构造函数
		constructor : function(config) {
			this.__windowContainerInited = false;
			this.callParent(config);
			this.src = "";
			this.process = "";
			this.activity = "";
		},

		controlsDescendantBindings : function() {
			return true;
		},

		dispose : function() {
			this.callParent();
		},

		getConfig : function() {
			return ComponentConfig;
		},

		// 动态创建组件
		buildTemplate : function(config) {
			var e = $("<div component='" + url + "' __component-context__='block' />");
			if (config) {
				this.src = config.src;
				this.process = config.process;
				this.activity = config.activity;

				if (config.xid) {
					e.attr("xid", config.xid);
				}
			}
			return e;
		},

		// 组件初始化
		init : function(value, bindingContext) {
			this.__windowContainerInited = true;
			this.callParent(value, bindingContext);
			this.refresh();
		},

		setSrc : function(v) {
			this.set({
				src : v
			});
		},

		setProcess : function(v) {
			this.set({
				process : v
			});
		},

		setActivity : function(v) {
			this.set({
				activity : v
			});
		},

		refresh : function() {
			if (this.__windowContainerInited) {
				var src = this.get("src");
				for ( var i = this.domNode.childNodes.length - 1; i >= 0; i--) {
					justep.Bind.removeNode(this.domNode.childNodes[i]);
				}
				if (src) {
					src = this._prepareSrc(src);
					var settings = {
						activate : true
					};
					settings.model = src;
					settings.preserveContext = true;
					var self = this;
					settings.loadError = function(err) {
						var evt = {
							source : self,
							err : err,
							cancel : false
						};
						self.fireEvent(WindowContainer.LOAD_ERROR_EVENT, evt);
						return evt.cancel;
					};
					
					settings.viewLoad = function(){
						var dtd = $.Deferred();
						var evt = {
								source : self,
								cancel : false,
								dtd:dtd,
								async:false
						};
						self.fireEvent(WindowContainer.VIEW_LOAD_EVENT, evt);
						if(!evt.async){
							dtd.resolve();
						}
						return dtd.promise();
					};
					composition.compose(this.domNode, settings);
				}
			}
		},
		_prepareSrc : function(src) {
			if (src) {
				var ctx = this.getModel().getContext();
				if ((src.indexOf("process=") == -1) && (src.indexOf("activity=") == -1)) {
					var process = this.get("process");
					var activity = this.get("activity");
					if ((!process || !activity) && ctx.getProcess && ctx.getActivity) {
						process = ctx.getProcess();
						activity = ctx.getActivity();
					}
					if (process && activity) {
						src += (src.indexOf("?") == -1) ? "?" : "&";
						src += "process=" + process + "&activity=" + activity;
					}
				}
				if (ctx.getExecutor && (src.indexOf("executor=")==-1)) {
					var executor = ctx.getExecutor();
					if (executor) {
						src += (src.indexOf("?") == -1) ? "?" : "&";
						src += "executor=" + executor;
					}
				}
				if (ctx.getExecuteContext && (src.indexOf("executeContext=")==-1)){
					var executeContext = ctx.getExecuteContext();
					if (executeContext){
						src += (src.indexOf("?") == -1) ? "?" : "&";
						src += "executeContext=" + executeContext;
					}
				}
			}

			return src;
		},

		getInnerModel : function() {
			try{
				return justep.Bind.utils.domData.get(this.domNode, INNER_MODEL);	
			}catch(err){
				var msg = new justep.Message(justep.Message.JUSTEP230112);
				throw justep.Error.create(msg);
			}
		},

		beforeLoaded : function() {
			this.fireEvent(WindowContainer.BEFORE_LOAD_EVENT, {
				source : this
			});
		},

		loaded : function() {
			this.fireEvent(WindowContainer.LOAD_EVENT, {
				source : this
			});
			this._prepareRouteStateChannel();
		},

		_prepareRouteStateChannel : function() {
			var self = this;
			this.getInnerModel().off('onRouteStatePublish');

			/**
			 * 第一次根据url进来时候 onRouteStatePublish的时机比起loaded先后顺序不确定
			 */
			var fireRouteStateChange = function(event) {
				self.fireEvent("onRouteStatePublish", event);
				self._prepareRouteStateChannel._lastHashbang = event.hashbang;
			};
			this.getInnerModel().on("onRouteStatePublish", function(event) {
				fireRouteStateChange(event);
			}, this);

			fireRouteStateChange({
				isReplace : true,
				hashbang : this.getInnerModel().$routeState.toHashbang()
			});

		}
	});

	WindowContainer.BEFORE_LOAD_EVENT = "onBeforeLoad";
	WindowContainer.LOAD_EVENT = "onLoad";
	WindowContainer.LOAD_ERROR_EVENT = "onLoadError";
	WindowContainer.VIEW_LOAD_EVENT = "onViewLoad";

	justep.Component.register(url, WindowContainer);
	return WindowContainer;
});
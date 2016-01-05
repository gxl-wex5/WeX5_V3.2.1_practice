/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/resources/system.res");
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = justep.ModelBase;
	var Dialog = require("../dialog/dialog");
	var WindowContainer = require("../windowContainer/windowContainer");
	var RouteUtil = require("$UI/system/lib/route/routeUtil");
	var Mapping = require("./js/receiveMapping");
	var url = require.normalizeName("./windowDialog");
	var ComponentConfig = require("./windowDialog.config");
	
	var WindowDialog = Dialog.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.src = '';
			this.process = '';
			this.activity = '';
			this.forceRefreshOnOpen = false;
			this._compose = null;
			this._composeOK = $.Deferred();
			this.callParent(options);
		},
		dispose : function() {
			this.getModel().off(Model.MESSAGE_EVENT, this.doReceiver, this);
			this.callParent();
		},
		doInit : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			// 产生组件通讯的唯一标识,使用xid
			var xid = this.$domNode.attr('xid');
			if (!xid) {
				xid = justep.UUID.createUUID();
				this.$domNode.attr('xid', xid);
			}
			// 这里new
			// compose后因为父组件还没有完成，导致bind没有执行，所以在WindowContainer.LOAD_EVENT事件进行this._compose
			// = compose;
			var composeCfg = {
				src : this.src,
				process : this.process,
				activity : this.activity
			};
			composeCfg['xid'] = '_compose_' + xid + '_';
			this._compose = new WindowContainer(composeCfg);// , parentNode:
															// this._getBodyNode()[0]
			
			this._compose.on(WindowContainer.BEFORE_LOAD_EVENT, function() {
				this._composeOK.resolve();
			}, this);
			this._compose.on(WindowContainer.LOAD_EVENT, function() {
				this._loaded = true;
				this.fireEvent(WindowContainer.LOAD_EVENT, {
					source : this
				});
				this.initRouter();
			}, this);
			this._compose.on(WindowContainer.LOAD_ERROR_EVENT, function(evt){
				var event = {source: this, cancel: false};
				this.fireEvent(WindowContainer.LOAD_ERROR_EVENT, event);
				if (!event.cancel){
					var me = this;
					var msg = null;
					if (evt.err && (evt.err.toString().indexOf("JUSTEP230109")!=-1)){
						msg = new justep.Message(justep.Message.JUSTEP230109).getMessage();	
					}else{
						msg = new justep.Message(justep.Message.JUSTEP230111).getMessage();
					}
					justep.Util.confirm(msg, function(){
						me.close();
					}, function(){
						me.close();
					}, "ok");
					evt.cancel = true;
				}
			}, this);
			this.getModel().on(Model.MESSAGE_EVENT, this.doReceive, this);// bind数据接收处理
		},
		
		initRouter : function(){
			if(!this.routable){
				return;
			}
			this._compose.off('onRouteStatePublish');
			this._compose.on('onRouteStatePublish',function(event){
				this.addRouteInnerItem('', event.hashbang,event.isReplace);
			},this);
		},
		
		doRoute : function(name,param,routeState){
			if(!this.routable){
				return;
			}
			if(name === ""){
				var jsonParam,innerStateValue;
				var self = this;
				if(routeState == "enter"){
					if(RouteUtil.containeInnerState(param)){
						var paramValue = RouteUtil.getParamValue(param);
						innerStateValue = RouteUtil.getInnerStateValue(param);
						try{
							jsonParam = JSON.parse(paramValue);
						}catch(e){
						}
						this.open(jsonParam);
						if(this._composeOK){
							this._composeOK.done(function(){
								var innerModel = self._compose.getInnerModel();
								innerModel.postMessage({
									type:"routeState",
									newUrl:innerStateValue
								});
							});
						}
					}else{
						try{
							jsonParam = JSON.parse(param);
						}catch(e){
							
						}
						this.open(jsonParam);
					}
				}else if(routeState == "leave"){
					this.close();
				}else if(routeState == "update"){
					//update 情况只有innerModel的状态发生变化
					innerStateValue = RouteUtil.getInnerStateValue(param);
					if(this._composeOK){
						this._composeOK.done(function(){
							var innerModel = self._compose.getInnerModel();
							innerModel.postMessage({
								type:"routeState",
								newUrl:innerStateValue
							});
						});
					}
				}
			}
		},
		
		addRouteItem : function(type,param){
			if(!this.routable){
				return;
			}
			var $routeState = this.getModel().$routeState;
			var xid = this.$domNode.attr('xid');
			if(type == 'open'){
				try{
					$routeState.addState(xid,'',JSON.stringify(param));
					$routeState.publishState();
				}catch(e){
					//JSON.stringify(param) error 
				}
			}else if(type == 'close'){
				$routeState.removeState(xid,'','');
				$routeState.publishState();
			}
		},
		
		addRouteInnerItem : function(type,hashbang,isReplace){
			if(!this.routable){
				return;
			}
			var $routeState = this.getModel().$routeState;
			var xid = this.$domNode.attr('xid');
			if(this.opened){
				$routeState.addInnerState(xid,'',hashbang);
				$routeState.publishState();
			}
			
		},
		
		
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
			case "src":
			case "process":
			case "activity":
				if (oldVal != value && this._inited){
					this._refresh();
				}
				break;
			default:
				this.callParent(key, oldVal, value);
			}
		},
		doReceive : function(event) {
			var data = event.message;
			if (data && data.target == this) {//判断投递给自己的消息才处理
				data.sender = data.source;
				data.source = this;
				delete data.target;
				this.fireEvent('onReceive', data);
				//增加mapping处理
				Mapping.receiveByMapping(this,data.data);
			}
		},
		render : function() {
			this.callParent();
		},
		_refresh : function(){
			if(this._compose){
				this._composeOK = $.Deferred();
				this._compose.setSrc(this.src);
				this._compose.setProcess(this.process);
				this._compose.setActivity(this.activity);
				this._compose.refresh();
			}
		},
		_setDialogParam : function(option) {
		},
		
		_open: function(option){
			//先显示对话框，后面逻辑有可能依赖对话框的大小
			if (option)
				this.set(option);
			if (!justep.Bind.isBound(this._compose.domNode)) {
				var parentNode = this._getBodyNode()[0];
				this._compose.setCSS({height: '100%',position: 'relative'});
				justep.Component.addComponent(parentNode, this._compose);
			}else{
				if(this.forceRefreshOnOpen || !this._loaded){
					this._refresh();
				}
			}
			if(this._composeOK){
				var self = this;
				this._composeOK.done(function() {// 使用promise机制等待页面刷新成功后
					self._setDialogParam(option);
					var innerModel = self._compose.getInnerModel();
					innerModel.postMessage({
						source : self,
						type : 'WindowDialog',
						data : option ? option.data : undefined
					});
					//投递变化信息给子窗口
					innerModel.fireEvent('onResize',{source:self._compose});
				});
			}
		},
		
		open : function(option) {
			if (this._viewLoaded){
				this.callParent(option);
			}else{
				var me = this;
				var method = arguments.callee;
				var parentClass = method.$owner.superclass, methodName = method.$name;
				var parentFn = parentClass[methodName];
				var args = arguments;
				var fn = function(){
					parentFn.apply(me, args);
					me._viewLoaded = true;
					me._compose.off(WindowContainer.VIEW_LOAD_EVENT, fn);
				};
				this._compose.on(WindowContainer.VIEW_LOAD_EVENT, fn);
			}
			this._open(option);
		}
	});

	justep.Component.addOperations(WindowDialog, {
		open : {
			label : "",
			argsDef: [{name:'option',displayName:justep.Message.getMessage(justep.Message.JUSTEP231098)}],
			method : function(args) {
				return this.owner.open(args.option);
			}
		},
		close : {
			label : "",
			method : function(args) {
				return this.owner.close();
			}
		}
	});
	
	justep.Component.register(url, WindowDialog);
	return WindowDialog;
});
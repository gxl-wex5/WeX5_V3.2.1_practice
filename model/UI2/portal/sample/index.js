define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	require('./mockPortalApi');
	require(['./appVersionChecker']);

	var Model = function() {
		this.callParent();
		/**
			xid 都为默认的可以不传
			this.shellImpl = new ShellImpl(this,{contentsXid:'pages',wingXid:"wing"});
			this.shellImpl = new ShellImpl(this,{contentsXid:'pages'});
		 **/
		this.shellImpl = new ShellImpl(this, {
			contentsXid : 'pages',
			errorHandler : function(event) {
				justep.Util.hint("您的网络好像不太顺畅，请稍后再试!");
				event.cancel = true;
			},
			pageMappings:{
				"left":{
					url : '$UI/portal/sample/menu/left2.w'
				},
				"sampleData":{
					url:"$model/UI2/demo/baas/simpleData/index.w"
				},
				"takeout":{
					url:"$model/UI2/takeout/index.w"
				},
				"list":{
					url:"$model/UI2/system/components/justep/list/demo/news.w"
				},
				"geolocation":{
					url:"$model/UI2/demo/device/geolocation/mainActivity.w"
				},
				"main":{
					url : '$model/UI2/portal/sample/main/main.w'
				},
				"tuniu":{
					url : '$UI/demo/tuniu/index_main.w'
				},
				"searchList":{
					url : '$UI/demo/tuniu/searchList.w'
				},
				"detail":{
					url : '$UI/demo/tuniu/detail.w'
				}
			}
		});
	};
	
	Model.prototype.modelLoad = function(event) {
		this.shellImpl.showPage("main");
		this.shellImpl.loadPage("left");
	};
	return Model;
});
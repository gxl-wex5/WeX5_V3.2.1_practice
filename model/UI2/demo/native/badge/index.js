define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	
	require("$UI/system/lib/cordova/cordova");
	require("cordova!de.appplant.cordova.plugin.badge");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.onModelLoad = function(event){
		var self = this;
		self.initBrowser();
	};
	
	
	Model.prototype.initBrowser = function(){
		var self = this;
		if (justep.Browser.isX5App){
			$(self.getElementByXid("borwserContent")).hide();
			$(self.getElementByXid("appContent")).show();
			self.initEadgeApp();
		}else{
			$(self.getElementByXid("appContent")).hide();
			$(self.getElementByXid("borwserContent")).show();
		}
	};
	
	Model.prototype.initEadgeApp = function(){
		cordova.plugins.notification.badge.set(10);
	};

	Model.prototype.sendMsgButtonClick = function(event){
		var self = this;
		var inputValue = $(self.getElementByXid("msgInput")).val();
		
		cordova.plugins.notification.badge.setTitle(inputValue);
		cordova.plugins.notification.badge.set(11);
	};

	Model.prototype.clearBadgeButtonClick = function(event){
		
		cordova.plugins.notification.badge.clear();
	};

	Model.prototype.autoClearButtonClick = function(event){
		cordova.plugins.notification.badge.setClearOnTap(true);
	};

	return Model;
});
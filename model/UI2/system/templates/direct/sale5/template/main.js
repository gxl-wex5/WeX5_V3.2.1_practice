define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtnClick = function() {
		justep.Portal.closeWindow();
	};

	Model.prototype.open = function(event) {
		var url = require.toUrl($(event.currentTarget).attr("url"));
		justep.Portal.openWindow(url);
	};

	return Model;
});
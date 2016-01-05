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
		var url = $(event.currentTarget).attr("url");
		if (!url) {
			url = event.bindingContext.$object.val("imgUrl");
		}
		justep.Portal.openWindow(require.toUrl(url));
	};

	return Model;
});
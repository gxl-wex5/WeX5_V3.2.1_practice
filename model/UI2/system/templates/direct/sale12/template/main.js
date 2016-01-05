define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.toUrl = function(param) {
		return require.toUrl(param);
	};
	Model.prototype.backBtnClick = function(event) {
		justep.Portal.closeWindow();
	};

	Model.prototype.open = function(event) {
		var row = event.bindingContext.$object;
		var url = row.val('imgUrl');
		comUtil.openPage({
			url : require.toUrl(url),
			parent : this.getElementByXid('parent'),
		});
	};

	return Model;
});
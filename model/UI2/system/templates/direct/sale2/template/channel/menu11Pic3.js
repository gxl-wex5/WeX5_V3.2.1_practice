define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(){
		justep.Portal.closeWindow();
	};
	
	Model.prototype.getImageUrl = function(row) {
		return require.toUrl(row.val('imgSrc'));
	};
	
	Model.prototype.open = function(event) {
		var row = event.bindingContext.$object;
		var url = "../2/template.w";
		comUtil.openPage({url : require.toUrl(url),parent : this.getElementByXid("parent"),value : row.val('id')});
	};
	
	return Model;
});
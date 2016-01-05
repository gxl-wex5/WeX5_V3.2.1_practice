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
		return require.toUrl(row.val('imgUrl'));
	};
	
	Model.prototype.open = function(event) {
		var urlJson = {"latestNews" : "../4/latestNews.w","professionNews" : "../4/professionNews.w","news" : "../4/news.w"};
		var row = event.bindingContext.$object;
		var contents = this.comp("dataContents");
		var key = contents.getActiveXid();
		var url = urlJson[key];
		comUtil.openPage({url : require.toUrl(url),parent : this.getElementByXid("parent"),value : row.val('id')});
	};
	
	return Model;
});
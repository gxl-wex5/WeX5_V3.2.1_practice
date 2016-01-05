define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	
	//返回按钮
	Model.prototype.backBtnClick = function(event) {
		justep.Portal.closeWindow();
	};
	
	//获取商品列表
	Model.prototype.listDataCustomRefresh = function(event){
		var listData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./oneColList/json/listData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            listData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });	
	};
		
	//商品点击事件
	Model.prototype.listClick = function(event){
		/*
		 1、获取当前商品ID
		 2、传入弹出窗口，弹出窗口中显示商品详细信息
		 3、在弹出窗口的接收事件中，从服务端过滤数据
		 */
	};
	
	//显示排序菜单
	Model.prototype.sortingBtnClick = function(event){
		this.comp("sorting").show();
	};
	//显示筛选菜单
	Model.prototype.screeningBtnClick = function(event){
		this.comp("screening").show();
	};

	return Model;
});
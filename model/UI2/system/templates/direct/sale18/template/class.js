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
	
	//获取一级分类信息
	Model.prototype.rootClassDataCustomRefresh = function(event){
		var rootClassData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./class/json/rootClassData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            rootClassData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
	};
	//获取二级分类信息	
	Model.prototype.secondClassDataCustomRefresh = function(event){
		var secondClassData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./class/json/secondClassData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            secondClassData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
	};
	//获取三级分类信息
	Model.prototype.threeClassDataCustomRefresh = function(event){
		var threeClassData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./class/json/threeClassData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            threeClassData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
	};
	
	//页面初始化
	Model.prototype.modelLoad = function(event){
		$(".root ul li:first-child").addClass("current");
		
		var contentHeight=$(".x-panel-content").height();		
		$(".left").css({"height":contentHeight});
		$(".right").css({"height":contentHeight});
		
		$(".seach .form-control").val("寻找你喜欢的宝贝");
	};
	
	//搜索按钮
	Model.prototype.seachBtnClick = function(event){
		/*
		 1、获取搜索关键字
		 2、进入搜索页面
		 */
	};

	return Model;
});

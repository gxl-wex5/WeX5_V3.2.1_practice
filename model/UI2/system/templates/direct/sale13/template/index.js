define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};

	//获取轮换图片
	Model.prototype.imgDataCustomRefresh = function(event){
		var imgData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./index/json/imgData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            imgData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
        var url=new Array();
			imgData.each(function(obj){				
				url.push(require.toUrl(obj.row.val("fImgUrl")));
			});
			$("#image1").attr({"src":url[0]});
			$("#image2").attr({"src":url[1]});		
	};
	Model.prototype.menuDataCustomRefresh = function(event){
		var menuData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./index/json/menuData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            menuData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });		
	};
	Model.prototype.dataCustomRefresh = function(event){
		var navData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./index/json/data.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            navData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });		
	};
	
	//搜索按钮
	Model.prototype.seachBtnClick = function(event){
		/*
		 1、获取搜索框中的值
		 2、传入弹出窗口，弹出窗口中显示列表页
		 3、在弹出窗口的接收事件中，从服务端过滤数据
		 */
	};
	
	//
	Model.prototype.menuColClick = function(event){
		/*
		 加入链接，打开相应页面
		 */
	};
	
	//微淘按钮
	Model.prototype.microBtnClick = function(event){
		/*
		 1、可用打开窗口方式打开微淘页面
		 2、也可使用contents进行页面切换
		 */
	};
	
	//发现按钮
	Model.prototype.foundBtnClick = function(event){
		/*
		 1、可用打开窗口方式打开发现页面
		 2、也可使用contents进行页面切换
		 */
	};
	
	//购物车
	Model.prototype.shoppingCartBtnClick = function(event){
		/*
		 1、可用打开窗口方式打开购物车页面
		 2、也可使用contents进行页面切换
		 */
	};
	
	//我的商城按钮
	Model.prototype.userBtnClick = function(event){
		/*
		 1、可用打开窗口方式打开我的商城页面
		 2、也可使用contents进行页面切换
		 */
	};



	return Model;
});
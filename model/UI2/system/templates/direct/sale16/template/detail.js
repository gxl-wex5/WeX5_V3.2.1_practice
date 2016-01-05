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

	//获取轮换图片
	Model.prototype.imgDataCustomRefresh = function(event){
		var imgData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./detail/json/imgData.json'),
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
	
	//获取商品信息
	Model.prototype.goodsDataCustomRefresh = function(event){		
		var goodsData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./detail/json/goodsData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            goodsData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });	
	};
	//获取店铺信息
	Model.prototype.shopDataCustomRefresh = function(event){
		var shopData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./detail/json/shopData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            shopData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });	
	};
	
	//获取评论信息
	Model.prototype.commentsDataCustomRefresh = function(event){
		var commentsData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./detail/json/commentsData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            commentsData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });	
	};
	//更多评论按钮
	Model.prototype.moreBtnClick = function(event){
		/*
		1、获取当前商品ID
		2、传入新窗口，打开的窗口中显示评论列表
		3、在打开的窗口中接收数据，并从服务端过滤数据		
		*/
	};
	
	//购物车按钮
	Model.prototype.shoppingCartBtnClick = function(event){
		/*
		1、弹出商品尺码颜色选择框
		2、确定后加入购物车
		*/
	};
	
	//购买按钮
	Model.prototype.buyBtnClick = function(event){
		/*
		1、获取当前商品ID
		2、传入新窗口，打开的窗口中显示购买确认页面
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
	};
	
	//查看宝贝分类按钮
	Model.prototype.classBtnClick = function(event){
		/*
		1、获取当前商铺ID
		2、传入新窗口，打开的窗口中显示商铺分类
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
	};
	
	//进店逛逛按钮
	Model.prototype.storeBtnClick = function(event){
		/*
		1、获取当前商铺ID
		2、传入新窗口，打开的窗口中显示店铺主页面
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
	};
	
	//全部宝贝按钮
	Model.prototype.goodsBtnClick = function(event){
		/*
		1、获取当前店铺ID
		2、传入新窗口，打开的窗口中显示商品列表
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
	};
	
	//分享按钮
	Model.prototype.shareBtnClick = function(event){
		/*
		1、获取商品ID
		2、打开分享页面
		*/
	};	

	return Model;
});
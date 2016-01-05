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
	Model.prototype.goodsDataCustomRefresh = function(event){
		var goods = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./cart/json/goodsData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            goods.loadData(data);//将返回的数据加载到data组件
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
            url: require.toUrl('./cart/json/shopData.json'),
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
	//全选
	Model.prototype.allChooseChange = function(event){
		var goodsData = this.comp("goodsData");
		var choose=this.comp("allChoose").val();
		goodsData.each(function(obj){
			if(choose){				
				goodsData.setValue("fChoose","1",obj.row);
			} else {
				goodsData.setValue("fChoose","",obj.row);
			}	
		});
		this.sumFunction();
	};
	
	//单个选择商品
	Model.prototype.oneChooseChange = function(event){
		var goodsData = this.comp("goodsData");
		var obj=event.row;
		if(goodsData.getValue("fChoose",obj)){
			goodsData.setValue("fChoose","",obj);
			this.sumFunction();
		} else {
			goodsData.setValue("fChoose","1",obj);
			this.sumFunction();
		}		
	};
	
	//减数量
	Model.prototype.reductionBtnClick = function(event){		
		var goodsData = this.comp("goodsData");
		var id=goodsData.getRowID(event.bindingContext.$object);
		goodsData.to(id);
		var n=goodsData.getValue("fNumber");
		if(n>1){
			goodsData.setValue("fNumber",n-1);
		}
		this.sumFunction();
	};
	
	//加数量
	Model.prototype.addBtnClick = function(event){
		var goodsData = this.comp("goodsData");
		var id=goodsData.getRowID(event.bindingContext.$object);
		goodsData.to(id);
		var n=goodsData.getValue("fNumber");
		goodsData.setValue("fNumber",n+1);
		this.sumFunction();
	};
	
	//删除
	Model.prototype.delBtnClick = function(event){
		var goodsData = this.comp("goodsData");
		var shopData = this.comp("shopData");
		var rows = new Array();
		var shopID = new Array();
		goodsData.each(function(obj){
			if(goodsData.getValue("fChoose",obj.row)==1){	
				rows.push(obj.row);
				shopID.push(goodsData.getValue("fShopID",obj.row));
			}
		});

		for( var i=0; i<shopID.length; i++){
			var n=0;
			goodsData.each(function(obj){				
				if(goodsData.getValue("fShopID",obj.row)==shopID[i]){
					n+=1;
				}				
			});
			if(n==1){
				shopData.to(shopID[i]);
				shopData.deleteData();
			}
		}
		goodsData.deleteData(rows);
		this.sumFunction();
	};
	
	//商品统计
	Model.prototype.sumFunction = function(event){
		var goodsData = this.comp("goodsData");
		var allSum=0, allNumber=0;
		var goodsData = this.comp("goodsData");
		goodsData.each(function(obj){
			if(goodsData.getValue("fChoose",obj.row)==1){
				allSum+=goodsData.getValue("fSum",obj.row);
				allNumber+=1;
			}
		});
		$(".allSum").text(allSum);
		$(".allNumber").text(allNumber);
	};
	
	//结算事件	
	Model.prototype.settlementClick = function(event){
		/*		 
		 1、转到订单确认页面
		 */
	};



	return Model;
});
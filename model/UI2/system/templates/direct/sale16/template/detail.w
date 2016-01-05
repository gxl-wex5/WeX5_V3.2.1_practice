<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:332px;top:181px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id" onCustomRefresh="imgDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid2"/>  
      <column label="图片" name="fImgUrl" type="String" xid="xid1"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="commentsData" idColumn="id" onCustomRefresh="commentsDataCustomRefresh">
      <column label="id" name="id" type="String" xid="xid3"></column>
  <column label="用户名" name="fUserName" type="String" xid="xid4"></column>
  <column label="用户头像" name="fUserImg" type="String" xid="xid7"></column>
  <column label="评分" name="fScore" type="Float" xid="xid5"></column>
  <column label="评论内容" name="fContent" type="String" xid="xid6"></column>
  <column label="评论日期" name="fDate" type="Date" xid="xid8"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="goodsData" idColumn="id" onCustomRefresh="goodsDataCustomRefresh">         
      <column label="id" name="id" type="String" xid="column1"></column>
  <column label="标题" name="fTitle" type="String" xid="column2"></column>
  <column label="图片" name="fImg" type="String" xid="column3"></column>
  <column label="价格" name="fPrice" type="Float" xid="column4"></column>
  <column label="原价格" name="fOldPrice" type="Float" xid="column5"></column>
  <column label="邮费" name="fPostage" type="String" xid="column6"></column>
  <column label="买出数量" name="fRecord" type="Integer" xid="column7"></column>
  <column label="所在地区" name="fAddress" type="String" xid="column8"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="shopData" idColumn="id" onCustomRefresh="shopDataCustomRefresh">
      <column name="id" type="String" xid="xid9"></column>
  <column label="店名" name="fShopName" type="String" xid="xid10"></column>
  <column label="等级" name="fLevel" type="Integer" xid="xid11"></column>
  <column label="店标" name="fShopImg" type="String" xid="xid16"></column>
  <column label="描述相符" name="fConsistent" type="Float" xid="xid12"></column>
  <column label="服务态度" name="fService" type="Float" xid="xid13"></column>
  <column label="商品数量" name="fGoodsNumber" type="Integer" xid="xid14"></column>
  <column label="关注人数" name="fFocusNumber" type="Integer" xid="xid15"></column></div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="商品详情"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="button6" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">搜索</span>
          </a>
        </div>  
        <div class="x-titlebar-title">商品详情</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents1" style="height:240px;"> 
          <div class="x-contents-content" xid="content1">
            <img alt="" xid="image1" id="image1" class="image-wall" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content2">
            <img alt="" xid="image2" id="image2" class="image-wall" height="240px"/>
          </div>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card panel-body">
   <div component="$UI/system/components/bootstrap/row/row" class="row x-nopadding"> 
        <div class="col col-xs-10" xid="col8">
          <h4 xid="h41" class=" text-black" bind-text="goodsData.ref('fTitle')"><![CDATA[]]></h4><div xid="div4">
            <span xid="span17" class="text-danger h3"><![CDATA[￥]]></span>
            <span xid="span29" bind-text="goodsData.ref('fPrice')" class="text-danger h3" /> 
          </div>  
          <div xid="div5" class="text-muted"> 
            <span xid="span19"><![CDATA[价格：]]></span>
            <span xid="span18" class="text-del">￥</span>
            <span xid="span13" bind-text="goodsData.ref('fOldPrice')" class="text-del" /> 
          </div> 
        </div>  
        <div class="col col-xs-2" xid="col9">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-right" label="分享" xid="shareBtn" icon="icon-ios7-redo" onClick="shareBtnClick"> 
            <i xid="i10" class="icon-ios7-redo" />  
            <span xid="span10">分享</span>
          </a>
        </div>  
        
      </div>
  <div component="$UI/system/components/bootstrap/row/row" class="row text-muted h5 x-nopadding">
   <div class="col col-xs-4" xid="col11">
    <span xid="span14">快递</span>
    <span xid="span15" bind-text="goodsData.ref('fPostage')"></span></div> 
   <div class="col col-xs-4 text-center" xid="col12">
    <span xid="span24">月销</span>
    <span xid="span26" bind-text="goodsData.ref('fRecord')"></span>
    <span xid="span27">笔</span></div> 
   <div class="col col-xs-4 text-center" xid="col13">
    <span xid="span16" bind-text="goodsData.ref('fAddress')"></span></div> </div></div><div component="$UI/system/components/justep/panel/panel" class="panel panel-heading x-card"><i xid="i4" class="text-muted icon-chevron-right pull-right btn-sm"></i><span xid="span20">选择颜色分类</span>
  </div><div component="$UI/system/components/justep/panel/panel" class="panel panel-heading x-card">
  <i xid="i29" class="text-muted icon-chevron-right pull-right btn-sm"></i><span xid="span4">宝贝详情</span>
  </div><div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card">
  <div class="panel-body"><span xid="span22">宝贝评价（</span>
  <span xid="span25" bind-text="commentsData.count()"></span>
  <span xid="span28">）</span></div><div class="panel-body"><img src="" alt="" xid="image3" class="img-circle" bind-attr-src="commentsData.ref('fUserImg')" height="40px" style="width:40px;"></img><span xid="span30" bind-text="commentsData.ref('fUserName')" class="font-weight padding-lr"></span>
  <div>
   <span xid="span32" bind-text="commentsData.ref('fContent')"></span></div>
  <div class="text-muted">
   <span xid="span36" bind-text="commentsData.ref('fDate')"></span></div>
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup3"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label text-black" label="查看更多评论" xid="button4">
   <i xid="i11"></i>
   <span xid="span5">查看更多评论</span></a></div></div>
  
  </div><div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card"><div xid="div9" class="panel-body x-nopadding"><div component="$UI/system/components/bootstrap/row/row" class="row">
   <div class="col col-xs-2" xid="col14">
    <img src="" alt="" xid="image4" class="img-rounded" bind-attr-src="shopData.ref('fShopImg')" height="50px" style="width:50px;"></img></div> 
   <div class="col col-xs-10" xid="col15">
    <span xid="span46" bind-text="shopData.ref('fShopName')" class="show"></span>
    <span xid="span48" bind-text="shopData.ref('fLevel')">关注人数</span></div> </div><div component="$UI/system/components/bootstrap/row/row" class="row">
   <div class="col col-xs-4" xid="col17"><span class="text-muted" xid="span9">描述相符</span>
  <span bind-text="shopData.ref('fConsistent')" class="text-danger" xid="span11"></span></div>
   <div class="col col-xs-8" xid="col18"><span class="text-muted" xid="span12">服务态度</span>
  <span bind-text="shopData.ref('fService')" class="text-success" xid="span21"></span></div>
   </div></div>
  
  <div component="$UI/system/components/bootstrap/row/row" class="row">
   <div class="col col-xs-6 x-line" xid="col1">
    <span xid="span41" bind-text="shopData.ref('fGoodsNumber')" class="show text-center"></span>
    <span xid="goodsBtn" class="show text-center text-muted" bind-click="goodsBtnClick">全部宝贝</span></div> 
   <div class="col col-xs-6" xid="col2">
    <span xid="span44" bind-text="shopData.ref('fFocusNumber')" class="show text-center"></span>
    <span xid="span43" class="show text-center text-muted">关注人数</span></div> 
   
   </div>
  <div component="$UI/system/components/bootstrap/row/row" class="row panel-body">
   <div class="col col-xs-6" xid="col4">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left thumbnail btn-group-justified text-black" label="查看宝贝分类" xid="classBtn" icon="icon-navicon" onClick="classBtnClick">
    <i xid="i9" class="icon-navicon"></i>
    <span xid="span40">查看宝贝分类</span></a> </div>
  <div class="col col-xs-6" xid="col5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left thumbnail btn-group-justified text-black" label="进店逛逛" xid="storeBtn" icon="icon-bag" onClick="storeBtnClick">
    <i xid="i5" class="icon-bag"></i>
    <span xid="span39">进店逛逛</span></a> </div></div></div>
      </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row x-nopadding"> 
        <div class="col col-xs-5" xid="col3">
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1">
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
              label="客服" xid="button1" icon="icon-ios7-chatboxes-outline"> 
              <i xid="i1" class="icon icon-ios7-chatboxes-outline"/>  
              <span xid="span1">客服</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
              label="店铺" xid="button2" icon="icon-bag"> 
              <i xid="i2" class="icon icon-bag"/>  
              <span xid="span2">店铺</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
              label="收藏" xid="button3" icon="icon-ios7-star-outline"> 
              <i xid="i3" class="icon icon-ios7-star-outline"/>  
              <span xid="span3">收藏</span>
            </a> 
          </div>
        </div>  
        <div class="col col-xs-7" xid="col6">
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified shopping" tabbed="true" xid="buttonGroup2"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
              label="加入购物车" xid="shoppingCartBtn" icon="icon-radio-waves" onClick="shoppingCartBtnClick"> 
              <i xid="i8" class="icon-radio-waves icon"/>  
              <span xid="span7">加入购物车</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
              label="立即购买" xid="buyBtn" icon="icon-android-display" onClick="buyBtnClick"> 
              <i xid="i7" class="icon-android-display icon"/>  
              <span xid="span8">立即购买</span>
            </a> 
          </div>
        </div> 
      </div>
    </div>
  </div> 
</div>

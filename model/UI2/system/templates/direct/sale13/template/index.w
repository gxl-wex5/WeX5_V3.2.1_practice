<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="fImg1" onCustomRefresh="dataCustomRefresh">       
      <column label="图片地址1" name="fImg1" type="String" xid="default6"></column>
  <column label="图片地址2" name="fImg2" type="String" xid="xid6"></column>
  <column label="图片地址3" name="fImg3" type="String" xid="xid7"></column>
  <column label="图片地址4" name="fImg4" type="String" xid="xid8"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id" onCustomRefresh="imgDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid2"/>  
      <column label="图片" name="fImgUrl" type="String" xid="xid1"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="menuData" idColumn="id" onCustomRefresh="menuDataCustomRefresh">
      <column name="id" type="String" xid="xid3"/>  
      <column name="fTitle" type="String" xid="xid4"/>  
      <column name="fImg" type="String" xid="xid5"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar x-index"> 
        <div class="x-titlebar-left" xid="div6">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="分类" xid="button6" icon="icon-navicon-round">
    <i xid="i6" class="icon-navicon-round"></i>
    <span xid="span6">分类</span></a> </div><div class="x-titlebar-title"><div class="form-group has-feedback">
   <input component="$UI/system/components/justep/input/input" class="form-control input-sm text-muted" bind-click="seachBtnClick" xid="input1"></input>
   <i class="icon-ios7-search-strong form-control-feedback" xid="col3"></i></div></div>  
        <div class="x-titlebar-right reverse" xid="div5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="消息" xid="button8" icon="icon-ios7-chatbubble">
    <i xid="i8" class="icon-ios7-chatbubble"></i>
    <span xid="span8">消息</span></a> </div></div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card">
   <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel" xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1" />  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents" active="0" slidable="true" wrap="true" swipe="true" xid="contents1" style="height:240px;"> 
          <div class="x-contents-content" xid="content1">
            <img alt="" xid="image1" id="image1" class="image-wall" height="240px" /> 
          </div>  
          <div class="x-contents-content" xid="content2">
            <img alt="" xid="image2" id="image2" class="image-wall" height="240px" />
          </div>
        </div> 
      </div></div>  
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card">
   <div component="$UI/system/components/justep/list/list" class="x-list" xid="menuList" data="menuData" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row x-list-template"> 
          <div class="x-type pull-left" xid="col4" bind-click="menuColClick" style="width:20%;"> 
            <div class="card text-center"> 
              
              <img src="" alt="" xid="image3" bind-attr-src="val(&quot;fImg&quot;)" style="width:70%;" class="img-responsive center-block" /><span class="title" bind-text="ref('fTitle')" /> 
            </div> 
          </div> 
        </div> 
      </div></div>  
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1" style="width:100%;"> 
        <div class="col cell col-xs-5 x-nopadding" xid="col1">
          <img src="" alt="" xid="image4" style="width:100%;" bind-attr-src="$model.comp('data').val(&quot;fImg1&quot;)" class=" img-responsive center-block"/>
        </div>  
        <div class="col cell col-xs-7 x-nopadding" xid="col2">
          <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3"> 
            <div class="col cell col-xs-12 x-nopadding" xid="col5">
              <img src="" alt="" xid="image5" style="width:100%;" bind-attr-src="$model.comp('data').val(&quot;fImg2&quot;)" class=" img-responsive center-block"/>
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row4"> 
            <div class="col cell col-xs-6 x-nopadding" xid="col8">
              <img src="" alt="" xid="image6" style="width:100%;" bind-attr-src="$model.comp('data').val(&quot;fImg3&quot;)" class=" img-responsive center-block"/>
            </div>  
            <div class="col cell col-xs-6 x-nopadding" xid="col9">
              <img src="" alt="" xid="image7" style="width:100%;" bind-attr-src="$model.comp('data').val(&quot;fImg4&quot;)" class=" img-responsive center-block"/>
            </div> 
          </div>
        </div> 
      </div></div>  
      </div>  
    <div class="x-panel-bottom" xid="bottom1">
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-card x-index"
        tabbed="true" xid="buttonGroup1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top active"
          label="首页" xid="homeBtn" icon="icon-home"> 
          <i xid="i1" class="icon-home icon"/>  
          <span xid="span1">首页</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="微淘" xid="microBtn" icon="icon-radio-waves" onClick="microBtnClick"> 
          <i xid="i2" class="icon-radio-waves icon"/>  
          <span xid="span2">微淘</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="发现" xid="foundBtn" icon="icon-android-display" onClick="foundBtnClick"> 
          <i xid="i3" class="icon-android-display icon"/>  
          <span xid="span3">发现</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="购物车" xid="shoppingCartBtn" icon="icon-ios7-cart" onClick="shoppingCartBtnClick"> 
          <i xid="i4" class="icon-ios7-cart icon"/>  
          <span xid="span4">购物车</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="我的商城" xid="userBtn" icon="icon-social-github" onClick="userBtnClick"> 
          <i xid="i5" class="icon-social-github icon"/>  
          <span xid="span5">我的商城</span>
        </a>
      </div>
    </div>
  </div> 
</div>

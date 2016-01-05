<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main12" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default3"/>  
      <column label="title" name="title" type="String" xid="default4"/>  
      <column label="content" name="content" type="String" xid="default5"/>  
      <data xid="default5">[{"id":"1","imgSrc":"./img/menu12Pic1.jpg","imgUrl":"./channel/menu1.w","title":"关于我们","content":"北京起步科技有限公司（Justep）成立于2006年7月，..."},{"id":"2","imgSrc":"./img/menu13Pic2.jpg","imgUrl":"./channel/menu6.w","title":"联系我们","content":"北京起步科技有限公司地址：北京市朝阳..."}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="navData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="icon" name="icon" type="String" xid="default7"/>  
      <column label="title" name="title" type="String" xid="default8"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default9"/>  
      <data xid="default11">[{"id":"1","icon":"icon-android-contacts","title":"关于我们","imgUrl":"./channel/menu1.w"},{"id":"2","icon":"icon-filing","title":"产品中心","imgUrl":"./channel/menu2.w"},{"id":"3","icon":"icon-card","title":"成功案例","imgUrl":"./channel/menu3.w"},{"id":"4","icon":"icon-compose","title":"促销活动","imgUrl":"./channel/menu4.w"},{"id":"5","icon":"icon-ios7-telephone","title":"最新动态","imgUrl":"./channel/menu5.w"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="标题"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">标题</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents1" style="height:240px;"> 
          <div class="x-contents-content" xid="content1" style="background: #fff repeat-x"> 
            <img bind-attr-src="$model.toUrl('./img/carouselimg.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img bind-attr-src="$model.toUrl('./img/carouselimg.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img bind-attr-src="$model.toUrl('./img/carouselimg.jpg')" height="240px"/> 
          </div> 
        </div>  
        <a class="left carousel-control" role="button"
          xid="a1"> 
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
            xid="span1"/>  
          <span class="sr-only" xid="span2">Previous</span> 
        </a>  
        <a class="right carousel-control" role="button"
          xid="a2"> 
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
            xid="span3"/>  
          <span class="sr-only" xid="span4">Next</span> 
        </a> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row grid1"
        xid="row1"> 
        <div class="col col-xs-6 text-right" xid="col1"> 
          <img src="./img/logoSloganPic1.jpg"/> 
        </div>  
        <div class="col col-xs-6 text-left" xid="col2"> 
          <img src="./img/logoSloganPic2.jpg"/> 
        </div> 
      </div>  
      <h3 class="text-center">test</h3>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list2" data="navData" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row x-list-template grid x-flex"
          xid="row2"> 
          <div class="col col-xs-4" xid="col4"> 
            <div class="card" bind-click="open"> 
              <i bind-css="val(&quot;icon&quot;)"/>  
              <span class="title" bind-text="ref('title')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        data="data" xid="list1"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="x-flex list-row" bind-click="open"> 
            <div xid="col21" class="head-pic-data"> 
              <div> 
                <img style="width:66px;height:66px" class="img-rounded" bind-attr-src="$model.toUrl($object.val('imgSrc'))"/> 
              </div> 
            </div>  
            <div class="x-flex1" xid="col23" style="padding-left:10px;"> 
              <div _component="$UI/system/components/justep/row/row" class="x-flex"
                xid="row8"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output x-title-data" xid="output6" bind-ref="ref('title')"/> 
              </div>  
              <div _component="$UI/system/components/justep/row/row" class="x-flex"
                xid="row9"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-flex1 x-output content-data x-intro" xid="output7" bind-ref="ref('content')"/>  
                <i class="icon-chevron-right"/> 
              </div> 
            </div> 
          </li> 
        </ul> 
      </div>  
      <div xid="parent"/> 
    </div> 
  </div> 
</div>

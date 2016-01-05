<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main11" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="navData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="icon" name="icon" type="String" xid="default7"/>  
      <column label="title" name="title" type="String" xid="default8"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default9"/>  
      <data xid="default11">[{"id":"1","icon":"icon-android-contacts","title":"关于我们","imgUrl":"./channel/menu1.w"},{"id":"2","icon":"icon-filing","title":"产品中心","imgUrl":"./channel/menu2.w"},{"id":"3","icon":"icon-card","title":"成功案例","imgUrl":"./channel/menu3.w"},{"id":"4","icon":"icon-compose","title":"促销活动","imgUrl":"./channel/menu4.w"},{"id":"5","icon":"icon-compass","title":"最新动态","imgUrl":"./channel/menu5.w"},{"id":"6","icon":"icon-ios7-telephone","title":"联系我们","imgUrl":"./channel/menu6.w"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default10"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default11"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default12"/>  
      <column label="title" name="title" type="String" xid="default13"/>  
      <data xid="default14">[{"id":"1","imgSrc":"./img/menu362Pic1.jpg","imgUrl":"./contents/1.w","title":"推荐"},{"id":"2","imgSrc":"./img/menu362Pic6.jpg","imgUrl":"./contents/1.w","title":"推荐"},{"id":"3","imgSrc":"./img/menu362Pic3.jpg","imgUrl":"./contents/1.w","title":"推荐"},{"id":"4","imgSrc":"./img/menu362Pic4.jpg","imgUrl":"./contents/1.w","title":"推荐"},{"id":"5","imgSrc":"./img/menu362Pic5.jpg","imgUrl":"./contents/1.w","title":"推荐"},{"id":"6","imgSrc":"./img/menu362Pic2.jpg","imgUrl":"./contents/1.w","title":"推荐"}]</data> 
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
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"/> 
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
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list2" data="navData" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row x-list-template grid x-flex"
          xid="row2"> 
          <div class="col cell col-xs-4" xid="col4"> 
            <div class="card" bind-click="open"> 
              <i bind-css="val(&quot;icon&quot;)"/>  
              <span class="title" bind-text="ref('title')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list3" data="imgData" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row grid1 x-list-template"
          xid="row1"> 
          <div class="col cell col-xs-6" xid="col1"> 
            <div class="card" bind-click="open"> 
              <img bind-attr-src="$model.toUrl($object.val('imgSrc'))"/>  
              <span class="title" bind-text="ref('title')"/> 
            </div> 
          </div> 
        </div>
      </div>  
      <div xid="parent"/> 
    </div> 
  </div> 
</div>

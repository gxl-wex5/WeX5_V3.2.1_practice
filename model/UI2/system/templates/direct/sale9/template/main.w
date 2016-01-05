<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="menuData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default10"/>  
      <column label="title" name="title" type="String" xid="default11"/>  
      <column label="menuUrl" name="menuUrl" type="String" xid="default12"/>  
      <data xid="default13">[{"id":"1","title":"关于我们","menuUrl":"./channel/menu1Pic1.w"},{"id":"2","title":"产品中心","menuUrl":"./channel/menu1Pic2.w"},{"id":"3","title":"热卖单品","menuUrl":"./channel/menu1Pic3.w"},{"id":"4","title":"促销活动","menuUrl":"./channel/menu14Pic2.w"},{"id":"5","title":"最新动态","menuUrl":"./channel/menu1Pic4.w"},{"id":"6","title":"联系我们","menuUrl":"./channel/menu1Pic5.w"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default14"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default15"/>  
      <column label="menuUrl" name="menuUrl" type="String" xid="default16"/>  
      <data xid="default17">[{"id":"1","imgSrc":"./img/menu182Pic1.jpg","menuUrl":"./contents/content1.w"},{"id":"2","imgSrc":"./img/menu12Pic1.jpg","menuUrl":"./channel/menu1Pic1.w"},{"id":"3","imgSrc":"./img/menu13Pic2.jpg","menuUrl":"./channel/menu1Pic5.w"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="首页"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">首页</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bg-img"> 
      <div id="container9"> 
        <div component="$UI/system/components/bootstrap/carousel/carousel"
          class="x-carousel carousel" xid="carousel1"> 
          <ol class="carousel-indicators" xid="ol1"/>  
          <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
            active="0" slidable="true" wrap="true" swipe="true" xid="contents1" style="height:400px;"> 
            <div class="x-contents-content" xid="content1"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open"
                url="./contents/content1.w" style="height:400px;"/> 
            </div>  
            <div class="x-contents-content" xid="content2"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open"
                url="./contents/content2.w" style="height:400px;"/> 
            </div>  
            <div class="x-contents-content" xid="content3"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open"
                url="./contents/content3.w" style="height:400px;"/> 
            </div>  
            <div class="x-contents-content" xid="content4"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open"
                url="./contents/content4.w" style="height:400px;"/> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"> 
          <div class="col-xs-6"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list1" data="menuData"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row x-list-template x-grid-menu9-left"
                style="width:100%;"> 
                <div class="col cell"> 
                  <div class="card" bind-click="open"> 
                    <span bind-text="val('title')"/>  
                    <i class="icon-chevron-right"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col-xs-6"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list2" data="imgData"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row x-list-template x-grid-menu9-right"
                style="width:100%;"> 
                <div class="col cell"> 
                  <div class="card" bind-click="open"> 
                    <img bind-attr-src="$model.toUrl($object)"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>

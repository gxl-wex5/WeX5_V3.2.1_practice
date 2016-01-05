<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id">
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default3"/>  
      <column label="title" name="title" type="String" xid="default4"/>  
      <data xid="default5">[{"id":"1","imgSrc":"./img/menu1Pic1.png","imgUrl":"./channel/menu1Pic1.w","title":"关于我们"},{"id":"2","imgSrc":"./img/menu1Pic2.png","imgUrl":"./channel/menu1Pic2.w","title":"产品中心"},{"id":"3","imgSrc":"./img/menu1Pic3.png","imgUrl":"./channel/menu1Pic3.w","title":"成功案例"},{"id":"4","imgSrc":"./img/menu1Pic4.png","imgUrl":"./channel/menu1Pic6.w","title":"促销活动"},{"id":"5","imgSrc":"./img/menu1Pic5.png","imgUrl":"./channel/menu1Pic4.w","title":"最新动态"},{"id":"6","imgSrc":"./img/menu1Pic6.png","imgUrl":"./channel/menu1Pic5.w","title":"联系我们"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="餐饮首页"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">餐饮首页</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bg-ig"> 
      <div id="conter"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="conter" data="data" disablePullToRefresh="true" disableInfiniteLoad="true"> 
          <ul class="x-list-template x-oh x-mu" xid="listTemplateUl1"> 
            <li xid="li1"> 
              <div bind-click="open"> 
                <img bind-attr-src="$model.getImageUrl($object)"/>  
                <span bind-text="ref('title')"/> 
              </div> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>

<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"></column>
  <column label="imgSrc" name="imgSrc" type="String" xid="default2"></column>
  <data xid="default3">[{&quot;id&quot;:&quot;1&quot;,&quot;imgSrc&quot;:&quot;./img/3227595611.jpg&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;imgSrc&quot;:&quot;./img/3948512187.jpg&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;imgSrc&quot;:&quot;./img/2060481804.jpg&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;imgSrc&quot;:&quot;./img/892068505.jpg&quot;},{&quot;id&quot;:&quot;5&quot;,&quot;imgSrc&quot;:&quot;./img/3227595611.jpg&quot;},{&quot;id&quot;:&quot;6&quot;,&quot;imgSrc&quot;:&quot;./img/3948512187.jpg&quot;},{&quot;id&quot;:&quot;7&quot;,&quot;imgSrc&quot;:&quot;./img/2060481804.jpg&quot;},{&quot;id&quot;:&quot;8&quot;,&quot;imgSrc&quot;:&quot;./img/892068505.jpg&quot;},{&quot;id&quot;:&quot;9&quot;,&quot;imgSrc&quot;:&quot;./img/330033807.jpg&quot;}]</data></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="产品中心"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">产品中心</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bg-im2"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <ul class="x-list-template oh x-list-menu" xid="listTemplateUl1"> 
          <li xid="li1"> 
              <img bind-attr-src="$model.getImageUrl($object)" class="x-img"
                bind-click="open"/> 
          </li>
        </ul> 
      </div> 
    </div>
    <div xid="parent"/>
  </div> 
</div>

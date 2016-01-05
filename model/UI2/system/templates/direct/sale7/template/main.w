<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String"/>  
      <column label="img1Src" name="img1Src" type="String"/>  
      <column label="img1Url" name="img1Url" type="String"/>  
      <column label="img1Title" name="img1Title" type="String"/>  
      <column label="img2Src" name="img2Src" type="String"/>  
      <column label="img2Url" name="img2Url" type="String"/>  
      <column label="img2Title" name="img2Title" type="String"/>  
      <column label="img3Src" name="img3Src" type="String"/>  
      <column label="img3Url" name="img3Url" type="String"/>  
      <column label="img3Title" name="img3Title" type="String"/>  
      <column label="cellCss" name="cellCss" type="String"/>  
      <data xid="default19">[{"id":"1","img1Src":"./img/menu221Pic1.png","img1Url":"./channel/menu1Pic1.w","img1Title":"4S店查询","img2Src":"./img/menu221Pic2.png","img2Url":"./channel/menu1Pic2.w","img2Title":"产品中心","img3Src":"./img/menu221Pic3.png","img3Url":"./channel/menu14Pic1.w","img3Title":"售后服务","cellCss":"x-grid-menu7-1"},{"id":"2","img1Src":"./img/menu222Pic1.png","img1Url":"./channel/menu14Pic2.w","img1Title":"促销活动","img2Src":"./img/menu222Pic2.png","img2Url":"./channel/menu1Pic4.w","img2Title":"最新动态","img3Src":"./img/menu222Pic3.png","img3Url":"./channel/menu1Pic5.w","img3Title":"联系我们","cellCss":"x-grid-menu7-2"},{"id":"3","img1Src":"./img/menu242Pic1.png","img1Url":"./channel/menu11Pic3.w","img1Title":"成功案例","img2Src":"./img/menu242Pic2.png","img2Url":"./channel/menu11Pic4.w","img2Title":"服务项目","img3Src":"./img/menu242Pic3.png","img3Url":"./channel/menu2Pic9.w","img3Title":"企业文化","cellCss":"x-grid-menu7-3"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="汽修首页"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">汽修首页</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bg-img"> 
      <div id="container"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu7-4"> 
          <span>通知公告：</span> 
          <div class="col cell">
            <div class="card" > 
              <a bind-click="open('./channel/menu1Pic1.w')">
              	<span>关于我们</span>
              	</a>
            </div> 
            <div class="card">
              <a bind-click="open('./contents/content1.w')">
              	<span>1</span>
              	</a>
            </div>
            <div class="card">
              <a bind-click="open('./contents/content2.w')">
              	<span>2</span>
              	</a>
            </div> 
          </div>  
        </div>  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="data" disablePullToRefresh="true" disableInfiniteLoad="true"> 
          <ul class="x-list-template"> 
            <div component="$UI/system/components/bootstrap/row/row" class="row"
              bind-css="ref('cellCss')"> 
              <div class="col cell"> 
                <div class="card" bind-click="$model.open(val('img1Url'))"> 
                  <img bind-attr-src="$model.toUrl(val('img1Src'))"/>  
                  <span bind-text="ref('img1Title')"/> 
                </div> 
              </div>  
              <div class="col cell"> 
                <div class="card" bind-click="$model.open(val('img2Url'))"> 
                  <img bind-attr-src="$model.toUrl(val('img2Src'))"/>  
                  <span bind-text="ref('img2Title')"/> 
                </div> 
              </div>  
              <div class="col cell"> 
                <div class="card" bind-click="$model.open(val('img3Url'))"> 
                  <img bind-attr-src="$model.toUrl(val('img3Src'))"/>  
                  <span bind-text="ref('img3Title')"/> 
                </div> 
              </div> 
            </div> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>

<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"/>  
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
    <div class="x-panel-content x-bg-img"> 
      <div id="container"> 
        <div component="$UI/system/components/bootstrap/carousel/carousel"
          class="x-carousel carousel" xid="carousel1"> 
          <ol class="carousel-indicators" xid="ol1"/>  
          <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
            active="0" slidable="true" wrap="true" swipe="true" xid="contents1" style="height:240px;"> 
            <div class="x-contents-content" xid="content1"> 
              <img class="image-wall" src="./img/carouselBox31.jpg" bind-click="open"
                url="./contents/content1.w" style="height:240px;"/> 
            </div>  
            <div class="x-contents-content" xid="content2"> 
              <img class="image-wall" src="./img/carouselBox32.jpg" bind-click="open"
                url="./contents/content2.w" style="height:240px;"/> 
            </div>  
            <div class="x-contents-content" xid="content3"> 
              <img class="image-wall" src="./img/carouselBox33.jpg" bind-click="open"
                url="./contents/content3.w" style="height:240px;"/> 
            </div>  
            <div class="x-contents-content" xid="content4"> 
              <img class="image-wall" src="./img/carouselBox34.jpg" bind-click="open"
                url="./contents/content4.w" style="height:240px;"/> 
            </div>
            <div class="x-contents-content" xid="content5"> 
              <img class="image-wall" src="./img/carouselBox35.jpg" bind-click="open"
                url="./contents/content5.w" style="height:240px;"/> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu5"
          xid="row1"> 
          <div class="col cell" xid="col1"> 
            <div class="card" url="./channel/menu1Pic1.w" bind-click="open"> 
              <img src="./img/menu21Pic1.jpg"/>  
              <span><![CDATA[关于我们]]></span> 
            </div> 
          </div>  
          <div class="col cell" xid="col2"> 
            <div class="card" url="./channel/menu1Pic2.w" bind-click="open"> 
              <img src="./img/menu21Pic2.jpg"/>  
              <span><![CDATA[产品中心]]></span> 
            </div> 
          </div>  
          <div class="col cell" xid="col3"> 
            <div class="card" url="./channel/menu1Pic3.w" bind-click="open"> 
              <img src="./img/menu21Pic3.jpg"/>  
              <span><![CDATA[成功案例]]></span> 
            </div> 
          </div>  
        </div>
        <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu5-1"
          xid="row2"> 
          <div class="col cell" xid="col4"> 
            <div class="card" url="./channel/menu14Pic2.w" bind-click="open"> 
              <img src="./img/menu1Pic2.png"/>  
              <span><![CDATA[VIP会员]]></span> 
            </div> 
          </div>  
          <div class="col cell" xid="col5"> 
            <div class="card" url="./channel/menu14Pic2.w" bind-click="open"> 
              <img src="./img/menu22LiBg.jpg" class="x-pst"/>  
              <span><![CDATA[免费成为会员，开卡即送216元大礼包，还有更多会员专享]]></span> 
            </div> 
          </div>  
        </div>
        <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu5"
          xid="row3"> 
          <div class="col cell" xid="col6"> 
            <div class="card" url="./channel/menu14Pic2.w" bind-click="open"> 
              <img src="./img/menu21Pic4.jpg"/>  
              <span><![CDATA[促销活动]]></span> 
            </div> 
          </div>  
          <div class="col cell" xid="col7"> 
            <div class="card" url="./channel/menu1Pic4.w" bind-click="open"> 
              <img src="./img/menu21Pic5.jpg"/>  
              <span><![CDATA[最新动态]]></span> 
            </div> 
          </div>
          <div class="col cell" xid="col8"> 
            <div class="card" url="./channel/menu1Pic5.w" bind-click="open"> 
              <img src="./img/menu21Pic6.jpg"/>  
              <span><![CDATA[联系我们]]></span> 
            </div> 
          </div>  
        </div>
      </div> 
    </div> 
  </div> 
</div>

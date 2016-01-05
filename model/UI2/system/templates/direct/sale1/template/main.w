<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:57px;top:201px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="IT首页"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">IT首页</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bg-c"> 
      <div id="container"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row x-menu-grid1"
          xid="row1"> 
          <div class="col cell" xid="col1"> 
            <div class="card"  url="./channel/menu11Pic1.w" bind-click="open"> 
              <img src="img/menu11Pic1.png"/>  
              <span>关于我们</span> 
            </div> 
          </div>  
          <div class="col cell" xid="col2"> 
            <div class="card"  url="./channel/menu11Pic2.w" bind-click="open"> 
              <img src="img/menu11Pic2.png"/>  
              <span>产品中心</span> 
            </div> 
          </div>  
          <div class="col cell" xid="col3"> 
            <div class="card"  url="./channel/menu11Pic3.w" bind-click="open"> 
              <img src="img/menu11Pic3.png"/>  
              <span>成功案例</span> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row x-menu-grid2"
          xid="row2"> 
          <div class="col cell" xid="col4"> 
            <div class="card" url="./channel/menu11Pic1.w" bind-click="open"> 
              <img src="img/menu12Pic1.jpg"/> 
            </div> 
          </div>  
          <div class="col cell" xid="col5"> 
            <div class="card" url="./channel/image5.w" bind-click="open"> 
              <img src="img/menu12Pic2.png"/>  
              <span>促销活动</span> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row x-menu-grid3"
          xid="row3"> 
          <div class="col cell" xid="col6"> 
            <div class="card" url="./channel/menu13Pic1.w" bind-click="open"> 
              <img src="img/menu13Pic1.png"/>  
              <span>最新动态</span> 
            </div> 
          </div>  
          <div class="col cell" xid="col7"> 
            <div class="card" url="./channel/menu13Pic3.w" bind-click="open"> 
              <img src="img/menu13Pic2.jpg"/> 
            </div> 
          </div>  
          <div class="col cell" xid="col8"> 
            <div class="card"  url="./channel/menu14Pic1.w" bind-click="open"> 
              <img src="img/menu13Pic3.png"/>  
              <span>售后服务</span> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row x-menu-grid4"
          xid="row4"> 
          <div class="col cell" xid="col9"> 
            <div class="card"  url="./channel/menu13Pic3.w" bind-click="open"> 
              <img src="img/menu14Pic1.png"/>  
              <span>联系我们</span> 
            </div> 
          </div>  
          <div class="col cell" xid="col10"> 
            <div class="card"  url="./channel/menu14Pic2.w" bind-click="open"> 
              <img src="img/menu14Pic2.png"/>  
              <span>服务项目</span> 
            </div> 
          </div> 
        </div>
      </div> 
    </div> 
  </div> 
</div>

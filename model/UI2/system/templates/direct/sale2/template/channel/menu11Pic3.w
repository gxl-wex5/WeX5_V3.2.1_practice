<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default3"/>  
      <column label="title" name="title" type="String" xid="default4"/>  
      <data xid="default5">[{"id":"1","imgSrc":"./img/2648769934.jpg","imgUrl":"../menu11Pic3/menu11Pic3-1.w","title":"新旗舰即将发..."},{"id":"2","imgSrc":"./img/3061967874.jpg","imgUrl":"../menu11Pic3/menu11Pic3-2.w","title":"顶配版Galaxy..."},{"id":"3","imgSrc":"./img/1906520719.jpg","imgUrl":"../menu11Pic3/menu11Pic3-3.w","title":"WP8系统最强..."},{"id":"4","imgSrc":"./img/2147446779.jpg","imgUrl":"../menu11Pic3/menu11Pic3-4.w","title":"3G一样很快捷..."},{"id":"5","imgSrc":"./img/3612300741.jpg","imgUrl":"../menu11Pic3/menu11Pic3-5.w","title":"2014款HTC..."},{"id":"6","imgSrc":"./img/1152061419.jpg","imgUrl":"../menu11Pic3/menu11Pic3-6.w","title":"高性能防水..."},{"id":"7","imgSrc":"./img/3648705261.jpg","imgUrl":"../menu11Pic3/menu11Pic3-7.w","title":"双卡双待入门..."},{"id":"8","imgSrc":"./img/313083353.jpg","imgUrl":"../menu11Pic3/menu11Pic3-8.w","title":"iOS 7.1新增..."},{"id":"9","imgSrc":"./img/2798712298.jpg","imgUrl":"../menu11Pic3/menu11Pic3-9.w","title":"1299之争 小..."}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="成功案例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">成功案例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bg-img3"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row x-list-template x-grid-caseMenu"
          xid="row1"> 
          <div class="col cell" xid="col1" bind-click="open"> 
            <img bind-attr-src="$model.getImageUrl($object)" height="71" width="93"/>  
            <span bind-text="ref('title')"/> 
          </div> 
        </div> 
      </div>
      <div xid="parent"/>
    </div> 
  </div> 
</div>

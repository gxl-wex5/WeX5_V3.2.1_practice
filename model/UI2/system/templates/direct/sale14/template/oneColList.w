<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:11px;top:3px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="listData" idColumn="id" onCustomRefresh="listDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="标题" name="fTitle" type="String" xid="xid6"/>  
      <column label="图片" name="fImg" type="String" xid="xid7"/>  
      <column label="价格" name="fPrice" type="Float" xid="xid8"/>  
      <column label="邮费" name="fPostage" type="String" xid="xid9"/>  
      <column label="销售数量" name="fRecord" type="Integer" xid="xid10"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="sorting" anchor="sortingBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="div8"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu3">
      <li class="x-menu-item" xid="item6"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="综合排序" xid="button11"> 
          <i xid="i14"/>  
          <span xid="span13">综合排序</span>
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"></li><li class="x-menu-item" xid="item7"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="价格从高到低" xid="button12"> 
          <i xid="i15"/>  
          <span xid="span14">价格从高到低</span>
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider2"></li><li class="x-menu-item" xid="item8"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="价格从低到高" xid="button13"> 
          <i xid="i16"/>  
          <span xid="span17">价格从低到高</span>
        </a> 
      </li>
    </ul>
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="screening" anchor="screeningBtn"> 
    <div class="x-popMenu-overlay" xid="div9"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1">
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="免运费" xid="button2"> 
          <i xid="i2"/>  
          <span xid="span2">免运费</span>
        </a> 
      </li>  
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="消费保障" xid="button3"> 
          <i xid="i3"/>  
          <span xid="span3">消费保障</span>
        </a> 
      </li>
    </ul>
  </div>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top" height="90"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar x-index"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="button6" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">搜索</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2"> 
          <div class="form-group has-feedback" xid="formGroup1"> 
            <input component="$UI/system/components/justep/input/input" class="form-control input-sm text-muted"
              bind-click="seachBtnClick" xid="input1"/>  
            <i class="icon-ios7-search-strong form-control-feedback" xid="col3"/> 
          </div> 
        </div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon more"
            label="button" xid="button10" icon="icon-android-more"> 
            <i xid="i11" class="icon-android-more"/>  
            <span xid="span10"/> 
          </a> 
        </div> 
      </div>  
      <div> 
        <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
          tabbed="true" xid="buttonGroup1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="综合排序" xid="sortingBtn" icon="icon-arrow-down-b" onClick="sortingBtnClick"> 
            <i xid="i13" class="icon-arrow-down-b text-muted"/>  
            <span xid="span12" class=" text-muted">综合排序</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="销量优先" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1" class=" text-muted">销量优先</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="筛选" icon="icon-arrow-down-b" xid="screeningBtn" onClick="screeningBtnClick"> 
            <i xid="i8" class="icon-arrow-down-b text-muted"/>  
            <span xid="span7" class="text-muted">筛选</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div xid="content" class="x-panel-content  x-scroll-view" style="bottom: 0px; top: 96px;"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1"> 
        <div class="x-content-center x-pull-down container" xid="div5"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i7"/>  
          <span class="x-pull-down-label" xid="span15">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div6"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="listData" limit="5" bind-click="listClick"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="li1" class="media"> 
                <div xid="div10" class="media-left">
   <img alt="" xid="image1" class="img-rounded media-object" bind-attr-src='val("fImg")' style="width:75px;" height="80px"></img></div>
  <div class="media-body" xid="div14">
   <h5 class="media-heading lead text-block" bind-text="ref('fTitle')" xid="h51"></h5>
   <div class="text-muted" xid="div15">
    <span xid="span11" class="text-danger">￥</span>
    <span xid="span9" bind-text="ref('fPrice')" class="text-danger"></span>
    </div> 
   <div class="text-muted" xid="div16">
    
    
    <span xid="span30">月销</span>
  <span xid="span21" bind-text="ref('fRecord')"></span>
  <span xid="span22"><![CDATA[笔 ]]></span>
  <span xid="span20" bind-text=" ref('fPostage')"></span></div> </div></li> 
            </ul> 
          </div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div7"> 
          <span class="x-pull-up-label" xid="span16">加载更多...</span> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>

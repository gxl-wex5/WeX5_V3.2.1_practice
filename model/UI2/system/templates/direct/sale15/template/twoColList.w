<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="listData" idColumn="id" onCustomRefresh="listDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="标题" name="fTitle" type="String" xid="xid6"/>  
      <column label="图片" name="fImg" type="String" xid="xid7"/>  
      <column label="价格" name="fPrice" type="Float" xid="xid8"/>  
      <column label="邮费" name="fPostage" type="String" xid="xid9"/>  
      <column label="买出数量" name="fRecord" type="Integer" xid="xid10"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="sorting" anchor="sortingBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="div2"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1">
      <li class="x-menu-item" xid="item6"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="综合排序" xid="button11"> 
          <i xid="i14"/>  
          <span xid="span13">综合排序</span>
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item7"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="价格从高到低" xid="button12"> 
          <i xid="i15"/>  
          <span xid="span14">价格从高到低</span>
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider2"/>  
      <li class="x-menu-item" xid="item8"> 
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
    <div class="x-popMenu-overlay" xid="div3"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu2">
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
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="button6" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">搜索</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title"> 
          <div class="form-group has-feedback" xid="formGroup1"> 
            <input component="$UI/system/components/justep/input/input" class="form-control input-sm text-muted"
              bind-click="seachBtnClick" xid="input1"/>  
            <i class="icon-ios7-search-strong form-control-feedback" xid="col3"/>
          </div>
        </div>  
        <div class="x-titlebar-right reverse"> 
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
            <i xid="i1" class="icon-arrow-down-b text-muted"/>  
            <span xid="span1" class="text-muted">筛选</span>
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
            xid="list1" data="listData" limit="6" bind-click="listClick"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="li1" class="col col-xs-6 x-twoColList"> 
                <div xid="div15"> 
                  <img src="" alt="" bind-attr-src="val(&quot;fImg&quot;)"
                    height="100px" class="img-rounded media-object" style="width:100%;"/>  
                  <div xid="div11" class="caption"> 
                    <h5 bind-text="ref('fTitle')" class="text-block"><![CDATA[]]></h5>
                    <div xid="div12"> 
                      <span class="text-danger"><![CDATA[￥]]></span> 
                    <span bind-text="ref('fPrice')" class="text-danger"></span></div>
                    <div xid="div13" class="text-muted"> 
                      <span xid="span24">月销</span>  
                      <span xid="span26" bind-text="ref('fRecord')"/>  
                      <span xid="span27"><![CDATA[笔  ]]></span>  
                      <span xid="span28" bind-text="ref('fPostage')" class="pull-right"/> 
                    </div> 
                  </div> 
                </div> 
              </li> 
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
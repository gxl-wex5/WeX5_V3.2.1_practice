<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:32px;top:226px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="rootClassData" idColumn="fID" onCustomRefresh="rootClassDataCustomRefresh"> 
      <column label="id" name="fID" type="String" xid="default6"/>  
      <column label="标题" name="fClassName" type="String" xid="xid6"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="secondClassData" idColumn="fID" onCustomRefresh="secondClassDataCustomRefresh">
      <column label="id" name="fID" type="String" xid="xid1"/>  
      <column label="一级分类ID" name="fRootID" type="String" xid="xid2"/>  
      <column label="分类名称" name="fClassName" type="String" xid="xid3"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="threeClassData" onCustomRefresh="threeClassDataCustomRefresh" idColumn="fID">
      <column label="id" name="fID" type="String" xid="xid4"/>  
      <column label="二级分类ID" name="fSecondID" type="String" xid="xid5"/>  
      <column label="分类名称" name="fClassName" type="String" xid="xid7"/>  
      <column label="分类图片" name="fClassImg" type="String" xid="xid8"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top" height="106"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar text-black" title="宝贝分类"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="分类" xid="button6" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">分类</span> 
          </a>  
          </div>  
        <div class="x-titlebar-title">宝贝分类</div>  
        <div class="x-titlebar-right reverse"></div> 
      </div> 
    <div xid="div1" class="panel-body"><div class="form-group has-feedback text-muted" xid="formGroup1">
   <input component="$UI/system/components/justep/input/input" class="form-control input-sm" bind-click="seachBtnClick" xid="input1"></input>
   <i class="icon-ios7-search-strong form-control-feedback" xid="col1"></i></div></div>
  </div>  
    <div xid="content" class="x-panel-content" style="bottom: 0px; top: 96px;"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"> 
        <div class="col col-xs-4 left" xid="col10"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="rootClassData"> 
            <ul class="x-list-template media" xid="listTemplateUl1"> 
              <li xid="li1" bind-css="{'current':val('fID')==data.val('fID')}" class="list-group-item">
                <h5 xid="h52" bind-text="ref('fClassName')" class="text-black"><![CDATA[]]></h5>
              </li>
            </ul>  
            
          </div>
        </div>  
        <div class="col col-xs-8 left" xid="col11"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list2" data="secondClassData" filter="$row.val(&quot;fRootID&quot;)==$model.comp('rootClassData').val(&quot;fID&quot;)"> 
            <ul class="x-list-template" xid="listTemplateUl2"> 
              <li xid="li2">
                <h5 xid="h51" bind-text="ref('fClassName')" class="text-black bg-info"><![CDATA[]]></h5>
                <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
                  xid="list3" data="threeClassData" filter="$row.val('fSecondID')==$object.val('fID')"> 
                  <ul class="x-list-template" xid="listTemplateUl3"> 
                    <li xid="li3" class="col col-xs-4">
                      <img src="" alt="" xid="image1" bind-attr-src="val(&quot;fClassImg&quot;)"
                        class="img-rounded img3"/>  
                      <p xid="p2" bind-text="val(&quot;fClassName&quot;)"/>
                    </li>
                  </ul> 
                </div> 
              </li>
            </ul> 
          </div>
        </div> 
      </div>
    </div> 
  </div> 
</div>

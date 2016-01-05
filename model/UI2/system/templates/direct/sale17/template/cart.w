<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:135px;top:10px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="goodsData" idColumn="id" limit="20" confirmRefresh="false" confirmDelete="false" onCustomRefresh="goodsDataCustomRefresh">
   <column label="id" name="id" type="String" xid="column1"></column>
  <column label="店铺ID" name="fShopID" type="String" xid="xid1"></column>
  <column label="标题" name="fTitle" type="String" xid="column2"></column>
  <column label="图片" name="fImg" type="String" xid="column3"></column>
  <column label="价格" name="fPrice" type="Float" xid="column4"></column>
  <column label="原价格" name="fOldPrice" type="Float" xid="column5"></column>
  <column label="邮费" name="fPostage" type="String" xid="column6"></column>
  <column label="买出数量" name="fRecord" type="Integer" xid="column7"></column>
  <column label="所在地区" name="fAddress" type="String" xid="column8"></column>
  <column label="颜色" name="fColor" type="String" xid="xid2"></column>
  <column label="尺寸" name="fSize" type="String" xid="xid3"></column>
  <column label="选择" name="fChoose" type="String" xid="xid4"></column>
  <column label="数量" name="fNumber" type="Integer" xid="xid5"></column>
  <column label="总价" name="fSum" type="Float" xid="xid6"></column>
  <rule xid="rule1">
   <col name="fColor" xid="ruleCol1">
    <constraint xid="constraint1">
     <expr xid="default1"></expr></constraint> 
    <calculate xid="calculate1">
     <expr xid="default2">$row.val('fColor')?'颜色分类:'+$row.val('fColor')+'; ':''</expr></calculate> </col> 
   <col name="fSize" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default3">$row.val('fSize')?'尺码:'+$row.val('fSize'):''</expr></calculate> </col> 
   <col name="fSum" xid="ruleCol3">
    <calculate xid="calculate3">
     <expr xid="default4">$row.val('fPrice')*$row.val('fNumber')</expr></calculate> </col> 
   <col name="fNumber" xid="ruleCol4">
    <calculate xid="calculate4">
     <expr xid="default5"></expr></calculate> </col> </rule></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="shopData" idColumn="id" confirmDelete="false" confirmRefresh="false" onCustomRefresh="shopDataCustomRefresh">
   <column label="id" name="id" type="String" xid="xid9"></column>
  <column label="店名" name="fShopName" type="String" xid="xid10"></column>
  <column label="等级" name="fLevel" type="Integer" xid="xid11"></column>
  <column label="店标" name="fShopImg" type="String" xid="xid16"></column>
  <column label="描述相符" name="fConsistent" type="Float" xid="xid12"></column>
  <column label="服务态度" name="fService" type="Float" xid="xid13"></column>
  <column label="商品数量" name="fGoodsNumber" type="Integer" xid="xid14"></column>
  <column label="关注人数" name="fFocusNumber" type="Integer" xid="xid15"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top" height="48"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="button6" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">搜索</span>
          </a>
        </div>  
        <div class="x-titlebar-title">
  
  <span xid="span1"><![CDATA[购物车（]]></span><span xid="span11" bind-text="goodsData.count()"></span>
  <span xid="span2"><![CDATA[）]]></span></div>  
        <div class="x-titlebar-right reverse"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="delBtn" icon="icon-ios7-trash-outline" onClick="delBtnClick">
   <i xid="i4" class="icon-ios7-trash-outline"></i>
   <span xid="span20"></span></a></div> 
      </div> 
    </div>  
    <div xid="content" class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/list/list" class="x-list shopList" xid="list2" data="shopData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2" class="panel panel-default x-card x-box"><div component="$UI/system/components/bootstrap/row/row" class="row panel-heading">
   <div class="col col-xs-1" xid="col1"><i xid="i1" class="icon-chevron-right"></i></div>
   <div class="col col-xs-1" xid="col4"><img src="" alt="" xid="image1" bind-attr-src='val("fShopImg")' class="img-circle img-shop"></img></div><div class="col col-xs-10" xid="col2"><span xid="span3" bind-text="ref('fShopName')"><![CDATA[]]></span></div>
   </div>
  <div component="$UI/system/components/justep/list/list" class="x-list bg-white" xid="list3" data='goodsData' filter="$row.val('fShopID')==$object.val('id')">
   <ul class="x-list-template" xid="listTemplateUl3">
    <li xid="li3" class="x-goodList"><div component="$UI/system/components/bootstrap/row/row" class="row x-list-template" xid="row2" style="width:100%;">
   <div class="col col-xs-1 text-center" xid="col3">
  <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox x-radio choose" xid="oneChoose" bind-ref="ref('fChoose')" onChange="oneChooseChange"></span></div><div class="col col-xs-4" xid="col8">
    <img src="" alt="" xid="image2" bind-attr-src='val("fImg")' style="width:90%;" class="img-good"></img></div> 
   <div class="col col-xs-7" xid="col9">
    <span bind-text="ref('fTitle')" class="text-black"><![CDATA[]]></span><div class="text-muted">
     <span xid="span26" bind-text="ref('fColor')"></span>
     <span xid="span28" bind-text="ref('fSize')"></span></div><div class="text-muted">
     <span xid="span5" class="text-danger"><![CDATA[￥]]></span><span xid="span29" bind-text="ref('fPrice')" class="h4 text-danger"></span>
  <span xid="span18" class="del-line"><![CDATA[ ￥]]></span>
  <span xid="span13" bind-text="ref('fOldPrice')" class="del-line"></span></div> 
     <div class="numberOperation">
   <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon" label="button" xid="reductionBtn" icon="icon-android-remove" onClick="reductionBtnClick">
   <i xid="i2" class="icon-android-remove"></i>
   <span xid="span8"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon" label="button" xid="addBtn" icon="icon-android-add" onClick="addBtnClick">
   <i xid="i3" class="icon-android-add"></i>
   <span xid="span9"></span></a>
  <span xid="span12" class="pull-right" bind-text="ref('fNumber')"></span>
  <span xid="span19" class="pull-right"><![CDATA[x]]></span></div></div> 
  </div></li></ul> </div></li></ul> </div>
  </div>  
    <div class="x-panel-bottom" xid="bottom1">
   <div component="$UI/system/components/bootstrap/row/row" class="row">
    <div class="col col-xs-4" xid="col5">
     <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="allChoose" label="全选" checked="false" onChange="allChooseChange"></span></div> 
    <div class="col col-xs-4" xid="col7"><div class="h4 text-right"><span xid="span15" class="text-muted"><![CDATA[合计：]]></span>
  <span xid="span17" class="text-danger"><![CDATA[￥]]></span>
  <span xid="sum" class="text-danger allSum"><![CDATA[0]]></span></div>
  <div class="text-right">
   <span xid="span16"><![CDATA[不含运费]]></span></div></div><div class="col col-xs-4 h4 panel-body text-center x-settlement" xid="col6" bind-click="settlementClick">
     <span xid="span10"><![CDATA[结算（]]>
  </span><span xid="number" class="allNumber"><![CDATA[0]]></span>
  <span xid="span14"><![CDATA[）]]></span></div> 
  </div> </div></div> 
</div>

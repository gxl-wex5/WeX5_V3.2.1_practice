<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="onModelLoad"/> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="badgeTitleBar" title="数字图标实例">
   <div class="x-titlebar-left" xid="div1"></div>
   <div class="x-titlebar-title" xid="div2">数字图标实例</div>
   <div class="x-titlebar-right reverse" xid="div3"></div></div></div>
   <div class="x-panel-content" xid="content2"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents2">
   <div class="x-contents-content" xid="borwserContent">
  </div>
  <div class="x-contents-content" xid="appContent"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput1">
   <label class="x-label" xid="label1"><![CDATA[消息：]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="msgInput"></input></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col1"></div>
   <div class="x-col" xid="col2"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="发送" xid="sendMsgButton" style="width:224px;" onClick="sendMsgButtonClick">
   <i xid="i2"></i>
   <span xid="span2">发送</span></a></div>
   <div class="x-col" xid="col3"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col4"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="清除图标" xid="clearBadgeButton" style="width:160px;" onClick="clearBadgeButtonClick">
   <i xid="i1"></i>
   <span xid="span1">清除图标</span></a></div>
   <div class="x-col" xid="col5"></div>
   <div class="x-col" xid="col6"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col" xid="col7"><a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="autoClearButton" style="width:195px;" label="自动清除" onClick="autoClearButtonClick">
   <i xid="i3"></i>
   <span xid="span3">自动清除</span></a></div>
   <div class="x-col" xid="col8"></div>
   <div class="x-col" xid="col9"></div></div></div></div></div>
   </div></div>
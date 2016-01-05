<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:195px;top:46px;"
    onLoad="modelLoad"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="modeData" idColumn="ID"><column label="ID" name="ID" type="String" xid="xid1"></column>
  <column label="Value" name="Value" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;ID&quot;:&quot;1&quot;,&quot;Value&quot;:&quot;模式1：本地应用包含UI资源。本地应用包含使用到的UI资源，可以作为不访问网络的纯本地应用。如果有AJAX请求，需设置AJAX服务地址，如果请求的地址有多个，需使用HttpRequest本地插件或者基于服务端设置跨域&quot;},{&quot;ID&quot;:&quot;2&quot;,&quot;Value&quot;:&quot;模式2：UI资源放置到Web服务器。使用到的UI资源编译为标准的Web资源（HTML、CSS、JS等），并部署到Web服务器上。本模式和模式1最大区别在于UI资源放置的位置，本模式资源如有修改可通过服务端更新，而模式1如果资源有修改需更新App&quot;},{&quot;ID&quot;:&quot;3&quot;,&quot;Value&quot;:&quot;模式3：UI资源通过UIServer访问。BeX5推荐使用本模式，而WeX5由于服务端更为灵活，推荐使用模式2&quot;},{&quot;ID&quot;:&quot;4&quot;,&quot;Value&quot;:&quot;模式4：打开一个非WeX5开发的网站。本模式的App类似一个没有地址栏并打开一个默认网址的浏览器&quot;}]</data></div></div>  
  
  
  
  
  <div xid="div1" style="padding-top:16px;"><span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group x-radio-group-vertical" xid="modeRadioGroup" bind-itemset="modeData" bind-itemsetValue="ref('ID')" bind-itemsetLabel="ref('Value')"></span></div></div>

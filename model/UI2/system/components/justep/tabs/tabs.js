/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");
	var justep = require("$UI/system/lib/justep");
	var url = require.normalizeName("./tabs");
	var $ = require("jquery");
	var ViewComponent = require("$UI/system/lib/base/viewComponent");
	require('css!./css/tabs').load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
 
 
	var Tabs = justep.ViewComponent.extend({
		init: function(value, bindingContext){
			var self = this;
			self.callParent(value, bindingContext);
			var $domNode = $(this.domNode);
			this.$node = $domNode;
			this.$panel = $(">.x-panel", $domNode);
			this.$contents = $(">.x-panel-content>.x-contents", this.$panel);
	 
			$domNode.on("click", ">.x-panel>.x-panel-top>.nav>li", function() {
				var $this = $(this);
		       	var selectEvent = {source: self, tab:$this, cancel: false};
	        	self.fireEvent(Tabs.BEFRESELECT_EVENT, selectEvent);
	        	if(selectEvent.cancel == true){
	        		return;
	        	}
				self.setActiveTab($this);
			});
        	var me = this,
	    		panel = this.getModel().componentPromise(this.$panel[0]);
    			contents = this.getModel().componentPromise(this.$contents[0]);
	    	$.when(panel, contents).then(
	    		function(panel, contents){
	    			me.panel = panel;
	    			me.contents = contents;
	    			me.contents.on("onActiveChanged", function(event){
	    				var index = event.to;
	    				if(me.index != index){
		    				var li = $(">.x-panel>.x-panel-top>.nav>li", me.domNode).eq(index);
		    				me.setActiveTab(li);
	    				}
	    			});
	    			me.inited();
	    		},
	    		function(err){
	    			alert(err);
	    		}
	    	);
	    	return {dependence: true};
		},
		
		setActiveTab : function(tab){
			if(typeof tab == 'string'){
				tab = $(">.x-panel>.x-panel-top>.nav>li[xid='"+tab+"']",this.domNode);
			}
			$(">li", tab.parent()).removeClass("active");
			tab.addClass("active");
			
			this.index = tab.index();
			this.contents.to(this.index);
			
			//通知变化，主要刺激grid重画
			this.getModel().fireEvent("onResize",{source:this});
			
			var selectEvent = {source: self, tab:tab};
        	this.fireEvent(Tabs.SELECT_EVENT, selectEvent);
		}
	});
	
	Tabs.BEFRESELECT_EVENT = "onBeforeSelect";
	Tabs.SELECT_EVENT = "onSelect";
	
	justep.Component.addOperations(Tabs, {
		setActiveTab: {
			label : justep.Message.getMessage(justep.Message.JUSTEP233010),
			//icon : '',
			argsDef: [{name:'xid',displayName:'切换的tab(li) xid'}],
			method : function(args) {
				return this.owner.setActiveTab(args.xid);
			}
		},
	});
	
	justep.Component.register(url, Tabs);
	return Tabs;
});
/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	require('$UI/system/lib/jquery/transition');
	require("$UI/system/components/justep/common/res");
	
	var Component = require("$UI/system/lib/base/component"),
		Object = require("$UI/system/lib/base/object"),
		justep = require('$UI/system/lib/justep'),
		Str = require("$UI/system/lib/base/string"),
		ViewComponent = require("$UI/system/lib/base/viewComponent"),
		$ = require("jquery"),
		url = require.normalizeName("./widgets"),
		ComponentConfig = require("./widgets.config"),
		WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer"),
		Widget = require("./widget");

	require("./js/jquery-ui-1.10.4.min");
	
	require('css!./css/widgets').load();
	
	var Widgets = ViewComponent.extend({
		constructor: function(options){
			//设置默认属性
			this.baseCls = 'x-widgets';
			this.columns = 3;
			this.draggable = true;
			
			this.callParent(options);
		},
		getConfig: function(){
			return ComponentConfig;
		},
		buildTemplate: function(config){
			//TODO:
			return "<div></div>";
		},
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			this.$el = $(this.domNode);
			this.$column = $('>.x-column', this.$el);
			this.$widget = $('>.x-column>.x-widget', this.$el); 
			
			var m = this.getModel(),
				xids = [],
				promises = []; 
			this.$widget.each(function(){
				xids.push($(this).attr('xid'));
			});
			justep.Array.each(xids, function(xid){
				promises.push(m.componentPromise(xid));
			});
			$.when.apply($, promises).done(function(){
			});
			this._draggable();
			return;
		},
		load: function(config){
			var xid, column;
			for(var i=1;i<=6;i++){
				xid = 'column' + i;
				$column = $('>[xid=' + xid + ']', this.domNode);
				if(config && config[xid]){
					var cc = config[xid];
					$column.attr('class', cc.cls).attr('classData', cc.cls);
					if(cc.widgets){
						//create widget;
						for(var j=0; j<cc.widgets.length; j++){
							var wcfg = cc.widgets[j];
							wcfg.owner = this;
							wcfg.parentNode = $column.get(0);
							new Widget(wcfg);
						}
					}
				}else{
					$column.attr('class', 'x-column hidden');//hidden column
					$column.attr('classData', 'x-column hidden');
				}
			}
			this._draggable();
		},
		getWidgetConfig: function(){
			var cfg = {};
			$('>.x-column', this.$el).each(function(index){
				var xid = $(this).attr('xid');
				var widgets = [];
				$('>.x-widget', this).each(function(){
					var wid = $(this).attr('widgetID');
					if(wid) widgets.push(wid);
				})
				cfg[xid] = {
					cls: $(this).attr('classData'),
					widgets: widgets  
				}
			});
			return cfg;
		},
		propertyChangedHandler: function(key, oldVal, value){
			switch(key){
			default:
				this.callParent(key, oldVal, value);
			}
		},
		activeAll: function(){
			var me = this;
			$("[component='$model/UI2/system/components/justep/windowContainer/windowContainer']", this.domNode).each(function(){
				var c = justep.Component.getComponent(this);
				c && c.getInnerModel().fireEvent('onActive');
			});
		},
		openWidget: function(wcfg){
			var $column = $('>[xid="column1"]', this.domNode);
			wcfg.owner = this;
			wcfg.parentNode = $column.get(0);
			new Widget(wcfg);
			this.fireEvent('change', {source: this});
			this._draggable();
		},
		removeWidget: function(widget){
			if(typeof widget == 'string')
				var node = $('.x-widget[widgetid="' + widget + '"]', this.domNode).get(0);
				if(node){
					Component.removeNode(node);
					this.fireEvent('change', {source: this});
				} 
			else{
				Component.removeComponent(widget);
				this.fireEvent('change', {source: this});
			}
		},
		hasWidget: function(id){
			return $('.x-widget[widgetid="' + id + '"]', this.domNode).length > 0;
		},
		setLayout: function(config){
			var $column, $preColumn;
			for(var i=1; i<=6; i++){
				var xid = 'column' + i;
				$column = $('>[xid=' + xid + ']', this.domNode);
				if(config && config[xid]){
					var cc = config[xid];
					$column.attr('class', cc.cls).attr('classData', cc.cls);
					if($column && $column.length > 0)
						$preColumn = $column; 
				}else{
					$column.attr('class', 'x-column hidden');//hidden column
					$column.attr('classData', 'x-column hidden');
					if($preColumn)
						$('>.x-widget', $column).appendTo($preColumn);
				}
			}	
		},
		_draggable: function(){
			if(this.draggable){
				var $sortableItems = $('>.x-column >.x-widget', this.domNode);
				var $el = $(this.domNode);
				var me = this;
				//TODO:
				if(this._inited)
					$('>.x-column', this.domNode).sortable('destroy');
				this._inited = true;
				$('>.x-column', this.domNode).sortable({  
				  
				        // Specify those items which will be sortable:  
				        items: $sortableItems,  
				  
				        // Connect each column with every other column:  
				        connectWith: $('>.x-column',  this.domNode),  
				  
				        // Set the handle to the top bar:  
				        handle: '.ibox-title',  
				  
				        // Define class of placeholder (styled in inettuts.js.css)  
				        placeholder: 'widget-placeholder',  
				  
				        // Make sure placeholder size is retained:  
				        forcePlaceholderSize: true,  
				  
				        // Animated revent lasts how long?  
				        revert: 300,  
				  
				        // Delay before action:  
				        delay: 100,  
				  
				        // Opacity of 'helper' (the thing that's dragged):  
				        opacity: 0.8,  
				  
				        // Set constraint of dragging to the document's edge:  
				        //containment: this.el,  
				  
				        // Function to be called when dragging starts:  
				        start: function (e,ui) {  
				        	$el.addClass('dragging');  
				        },  
				  
				        // Function to be called when dragging stops:  
				        stop: function (e,ui) {  
				            $el.removeClass('dragging');
				            me.fireEvent('move', {source: me, item: ui.item.get(0)});
				            me.fireEvent('change', {source: me});
			        }
				        
				    });
			}
		}
	});	

	
	justep.Component.addOperations(Widgets, {
		//add operations
	});
	
	Component.register(url, Widgets);

	return Widgets;
});
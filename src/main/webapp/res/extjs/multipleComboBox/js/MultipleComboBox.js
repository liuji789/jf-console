Ext.define('Ext.componentsW.MultipleComboBox',{
	extend: 'Ext.form.field.ComboBox',
	alias: 'widget.checkcombo',
	multiSelect: true,
	allSelector: false,
	addAllSelector: false,
	allText: 'All',
	separator:',',
	createPicker: function() {
	   var me = this,
	       picker,
	       menuCls = Ext.baseCSSPrefix + 'menu',
	       opts = Ext.apply({
	           pickerField: me,
	           selModel: {
	               mode: me.multiSelect ? 'SIMPLE' : 'SINGLE'
	           },
	           floating: true,
	           hidden: true,
	           ownerCt: me.ownerCt,
	           cls: me.el.up('.' + menuCls) ? menuCls : '',
	           store: me.store,
	           displayField: me.displayField,
	           focusOnToFront: false,
	           pageSize: me.pageSize,
	           tpl: 
			[
				'<ul><tpl for=".">',
					'<li role="option" class="' + Ext.baseCSSPrefix + 'boundlist-item"><span class="x-combo-checker">&nbsp;</span> {' + me.displayField + '}</li>',
				'</tpl></ul>'
			]
	       }, me.listConfig, me.defaultListConfig);

	   picker = me.picker = Ext.create('Ext.view.BoundList', opts);
	   if (me.pageSize) {
	       picker.pagingToolbar.on('beforechange', me.onPageChange, me);
	   }		

	   me.mon(picker, {
	       itemclick: me.onItemClick,
	       refresh: me.onListRefresh,
	       scope: me
	   });

	   me.mon(picker.getSelectionModel(), {
	       'beforeselect': me.onBeforeSelect,
	       'beforedeselect': me.onBeforeDeselect,
	       'selectionchange': me.onListSelectionChange,
	       scope: me
	   });

	   return picker;
    },
    getValue: function()
    {
    		return this.value.join(this.separator);
    },
    getSubmitValue: function()
	{
		return this.getValue();
	},
    expand: function()
    {
	   var me = this,
	       bodyEl, picker, collapseIf;

	   if (me.rendered && !me.isExpanded && !me.isDestroyed) {
	       bodyEl = me.bodyEl;
	       picker = me.getPicker();
	       collapseIf = me.collapseIf;

	       //显示
	       picker.show();
	       me.isExpanded = true;
	       me.alignPicker();
	       bodyEl.addCls(me.openCls);

			if(me.addAllSelector == true && me.allSelector == false)
			{
				me.allSelector = picker.getEl().insertHtml('afterBegin', '<div class="x-boundlist-item" role="option"><span class="x-combo-checker">&nbsp;</span> '+me.allText+'</div>', true);
				me.allSelector.on('click', function(e)
				{
					if(me.allSelector.hasCls('x-boundlist-selected'))
					{
						me.allSelector.removeCls('x-boundlist-selected');
						me.setValue('');
						me.fireEvent('select', me, []);
					}
					else
					{
						var records = [];
						me.store.each(function(record)
						{
							records.push(record);
						});
						me.allSelector.addCls('x-boundlist-selected');
						me.select(records);
						me.fireEvent('select', me, records); 
					}
				});
			}
	       // 监听
	       me.mon(Ext.getDoc(), {
	           mousewheel: collapseIf,
	           mousedown: collapseIf,
	           scope: me
	       });
	       Ext.EventManager.onWindowResize(me.alignPicker, me);
	       me.fireEvent('expand', me);
	       me.onExpand();
	   }
    },
    onListSelectionChange: function(list, selectedRecords) 
    {
	   var me = this,
	       isMulti = me.multiSelect,
	       hasRecords = selectedRecords.length > 0;
	   
	   if (me.isExpanded) {
	       if (!isMulti) {
	           Ext.defer(me.collapse, 1, me);
	       }
	      
	
	       if (isMulti || hasRecords) {
	           me.setValue(selectedRecords, false);
	       }
	       if (hasRecords) {
	           me.fireEvent('select', me, selectedRecords);
	       }
	       me.inputEl.focus();
	   }
	   
		if(me.addAllSelector == true && me.allSelector != false)
		{
			if(selectedRecords.length == me.store.getTotalCount()) me.allSelector.addCls('x-boundlist-selected');
			else me.allSelector.removeCls('x-boundlist-selected'); 
		}    
    }
});

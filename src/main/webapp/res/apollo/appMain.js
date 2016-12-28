Ext.onReady(function(){
	
	Ext.get('navOne').select('li', true).hover(function () {
		if(Ext.get(this).child('ul')) {
			Ext.get(this).child('ul').show();
		}
	}, function () {
		if(Ext.get(this).child('ul')) {
			Ext.get(this).child('ul').hide();
		}
	});

	var widthSrean=Ext.dom.AbstractElement.getViewportWidth()-64;

	Ext.create('Ext.form.Panel', {
		renderTo: 'appLook',
		title: '按条件查找',
		width: widthSrean,
		height: 300,
		bodyPadding: 10,
		
		defaultType: 'textfield',
		items: [
			{
				fieldLabel: 'First Name',
				name: 'firstName'
			},
			{
				fieldLabel: 'Last Name',
				name: 'lastName'
			},
			{
				xtype: 'datefield',
				fieldLabel: 'Date of Birth',
				name: 'birthDate'
			}
		],
		buttons: [{
            text: 'Save',
			scale: 'medium',
            handler: function() {
                this.up('form').getForm().isValid();
            }
        },{
            text: 'Cancel',
			scale: 'medium',
            handler: function() {
                this.up('form').getForm().reset();
            }
        }]
	});

	Ext.define('User', {
		extend: 'Ext.data.Model',
		fields: [ 'name', 'email', 'phone', 'birthDate']
	});

	var userStore = Ext.create('Ext.data.Store', {
		model: 'User',
		data: [
			{ name: 'Lisa', email: 'lisa@simpsons.com', phone: '555-111-1224' },
			{ name: 'Bart', email: 'bart@simpsons.com', phone: '555-222-1234' },
			{ name: 'Homer', email: 'home@simpsons.com', phone: '555-222-1244' },
			{ name: 'Marge', email: 'marge@simpsons.com', phone: '555-222-1254' }
		]
	});

	Ext.create('Ext.grid.Panel', {
		renderTo: 'appList',
		selType: 'cellmodel',
		store: userStore,
		width: widthSrean,
		height: 300,
		title: 'Application Users',
		columns: [
			{
				text: 'Name',
				width: 100,
				sortable: false,
				hideable: false,
				dataIndex: 'name'
			},
			{
				text: 'Email Address',
				width: 150,
				dataIndex: 'email',
				renderer: function(value) {
					return Ext.String.format('<a href="mailto:{0}">{1}</a>', value, value);
				},
				hidden: true
			},
			{
				text: 'Phone Number',
				flex: 1,
				dataIndex: 'phone'
			},
			{
				text: 'Birth Date',
				dataIndex: 'birthDate',
				// format the date using a renderer from the Ext.util.Format class
				renderer: Ext.util.Format.dateRenderer('m/d/Y')
			}
		],
		dockedItems: [{
			xtype: 'pagingtoolbar',
			store: userStore,   // same store GridPanel is using
			dock: 'bottom',
			displayInfo: true
		}]

	});

});
  
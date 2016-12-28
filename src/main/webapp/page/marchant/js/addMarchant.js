Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', rootPath+'/res/extjs/ux/');
Ext.require([
    'Ext.data.*',
    'Ext.grid.*',
    'Ext.util.*',
    'Ext.form.field.ComboBox',
    'Ext.form.FieldSet',
    'Ext.tip.QuickTipManager',
    'Ext.ux.data.PagingMemoryProxy'
    
]);

var data, store, columns, queryGrid,pager;

Ext.onReady(function(){
   // initGrid();
    onfocus();
    initDateTime();
    
    //结算周期  日结  周结   月结   季节 
    initCombo("simpleCombo");
   /* initCombo("simpleCombo2");*/
    
    //结算方式      上线 方式   下线方式 
    initCombo03("simpleCombo3");
    
    
    //省份  Id 动态的   
    initCombo4();
    //城市  Id 动态 
//    initCombo5(-1);
    
    //区域 Id 动态
    //积分logon 
    uploadImage();
    
    //企业执照 
    uploadImage02();
    
    //合同扫描 
    uploadImage03();
    
    //点击保持按钮  执行 保存或修改操作
    initBtnFun() ;
    
});

$(function(){
	var provId = $("#provId").val();
	if ($("#provId").val() != null && $("#provId").val() != '') {
		initCombo5($("#provId").val())
	}
	if ($("#cityId").val() != null && $("#cityId").val() != '') {
		initCombo6($("#cityId").val())
	}
});

// 省级联动

function initCombo03(obj){
	/*var states03 = [
                  {"abbr":"AL","name":"线上方式","slogan":"The Heart of Dixie"},
                  {"abbr":"AK","name":"线下方式","slogan":"The Land of the Midnight Sun"}
                 ];*/
    var store = Ext.create('Ext.data.Store', {
        autoDestroy: true,
        fields: [
            {type: 'string', name: 'areaId'},
            {type: 'string', name: 'name'}
         
        ],
        data: states03
    });
    var simpleCombo03 = Ext.create('Ext.form.field.ComboBox', {
        renderTo: obj,
        displayField: 'name',
        width: 280,
        labelWidth: 130,
        store: store,
        queryMode: 'local',
        typeAhead: true,
        listeners:{  
	    	// *定义选择事件  balanceType
	    	select : function(combo, records, eOpts){
	    		/*alert(this.getValue());*/
	    		//每次点击下拉框，给隐藏域赋值     问题所在之处
	    		/*alert("结算方式 ===>:"+this.getValue());*/
	    		 /*"".equals(anObject)*/
	    		alert("结算方式===>:"+this.getValue())
	    		if('线上方式'==this.getValue()){
	    			$("#balanceType").val("1");
		    		alert("线上方式==>:1");
	    		}
	    		if('线下方式'==this.getValue()){
	    			$("#balanceType").val("2");
		    		alert(" 线下方式balanceType==>:2");
	    		}
	    		
	    		
	    	}
        }
    });
}



//保存用户对象  

function  initBtnFun() {

	$(".submit-btn").click(function() {

		var url = "";
		if (type == "add") {
			url = rootPath + "/pcProverider/savePcProvider";
		} else {
			url = rootPath + "/pcProverider/modifyPcProvider";
		}
		// 通过ajax方式提交表单，将fbean这个表单序列化，使用$("#fbean").serialize()
		$.ajax({
			url : url,
			data : $("#fbean").serialize(),
			dataType : 'json',
			type : 'POST',
			success : function(data) {
				if(data.result == "success"){
					
				}else{
					// 当失败的时候进行一些业务处理
				}
				alert(data.msg);
				window.location.href = rootPath+"/page/marchant/marchantMgnt.jsp";
				
			},
			error : function(data) {
				alert("保存失败！")
			}
		});
	});	
}

var regionComboBox =  null;
var cityComboBox = null;
function initCombo4(){
	
	// store的准备
	var states = Ext.create('Ext.data.Store', {
	    fields: ['areaId', 'areaName'],
	    autoDestroy: true,
	    //非静态的数据的准备
	    proxy: {
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/pcProverider/getAreaProvince',
	         //额外的请求的地址的数据追加
	         extraParams :{
	        	
	         },
	         reader: {
	             type: 'json'
	         }
	     },
	     // 自动加载数据
	     autoLoad: true
	});
	//下拉列表的展示
	Ext.create('Ext.form.ComboBox', {
	    store: states,
	    //下拉的名字显示
	    displayField: 'areaName',
	    //下拉选中的传值
	    valueField: 'areaId',
	    // 要渲染的html的Id，userMgnt.jsp中
	    renderTo: "simpleCombo4",
	    //自己编辑的状态不可用
	    editable:false, 
	    //下拉被选中事件
	    listeners:{
	    	//监听选中，选中的回调函数
	    	select : function(combo, records, eOpts){
	    		//选中时执行的代码
	    		var value = this.getValue();
	    		//根据ID获取opKind，设置他的值为被选中的值
	    		$("#provId").val(value);
	    		initCombo5(value);
	    		
	    	},
	    	//监听渲染，渲染下拉时的函数
	    	render: function(){
	    		//必须加载后再获取，如果没有自动加载要手动加载一次再获取数据
	    		this.setValue($("#provId").val());
	        }
	    }
	});
}
function initCombo5(provId){
	
	// store的准备
	var states = Ext.create('Ext.data.Store', {
		fields: ['areaId', 'areaName'],
		autoDestroy: true,
		//非静态的数据的准备
		proxy: {
			type: 'ajax',
			// 请求地址
			url: rootPath + '/pcProverider/getAreaCity',
			//额外的请求的地址的数据追加
			extraParams :{
				provId:provId
			},
			reader: {
				type: 'json'
			}
		},
		// 自动加载数据
		autoLoad: true
	});
	//下拉列表的展示
	cityComboBox = null;
	cityComboBox = Ext.create('Ext.form.ComboBox', {
		store: states,
		//下拉的名字显示
		displayField: 'areaName',
		//下拉选中的传值
		valueField: 'areaId',
		// 要渲染的html的Id，userMgnt.jsp中
		renderTo: "simpleCombo5",
		//自己编辑的状态不可用
		editable:false, 
		//下拉被选中事件
		listeners:{
			//监听选中，选中的回调函数
			select : function(combo, records, eOpts){
				//选中时执行的代码
				var value = this.getValue();
				//根据ID获取opKind，设置他的值为被选中的值
				$("#cityId").val(value);
				initCombo6(value);
			},
			//监听渲染，渲染下拉时的函数
			render: function(){
				//必须加载后再获取，如果没有自动加载要手动加载一次再获取数据
				this.setValue($("#cityId").val());
			}
		}
	});
//	states.removeAll();
}
function initCombo6(cityId){
	
	// store的准备
	var states = Ext.create('Ext.data.Store', {
		fields: ['areaId', 'areaName'],
		autoDestroy: true,
		//非静态的数据的准备
		proxy: {
			type: 'ajax',
			// 请求地址
			url: rootPath + '/pcProverider/getAreaRegion',
			//额外的请求的地址的数据追加
			extraParams :{
				cityId:cityId
			},
			reader: {
				type: 'json'
			}
		},
		// 自动加载数据
		autoLoad: true
	});
	//下拉列表的展示
	regionComboBox = null;
	regionComboBox =  Ext.create('Ext.form.ComboBox', {
		store: states,
		//下拉的名字显示
		displayField: 'areaName',
		//下拉选中的传值
		valueField: 'areaId',
		// 要渲染的html的Id，userMgnt.jsp中
		renderTo: "simpleCombo6",
		//自己编辑的状态不可用
		editable:false, 
		//下拉被选中事件
		listeners:{
			//监听选中，选中的回调函数
			select : function(combo, records, eOpts){
				//选中时执行的代码
				var value = this.getValue();
				//根据ID获取opKind，设置他的值为被选中的值
				$("#regionId").val(value);
				
			},
			//监听渲染，渲染下拉时的函数
			render: function(){
				//必须加载后再获取，如果没有自动加载要手动加载一次再获取数据
				this.setValue($("#regionId").val());
			}
		}
	});
}



function initDateTime() {
	// 开始时间
	$("#startDateBox").live("click", function() {
		WdatePicker({
					el : "startDate",
					dateFmt : "yyyy-MM-dd HH:mm:ss"
				});
	});
	// 结束时间
	$("#endDateBox").live("click", function() {
		WdatePicker({
					el : "endDate",
					dateFmt : "yyyy-MM-dd HH:mm:ss"
				});
	});
}
/*init combo */   //借宿周期  日结
function initCombo(obj){
	var states = [
                  {"abbr":"AL","name":"日结","slogan":"The Heart of Dixie"},
                  {"abbr":"AK","name":"周结","slogan":"The Land of the Midnight Sun"},
                  {"abbr":"AZ","name":"月结","slogan":"The Grand Canyon State"},
                  {"abbr":"AZ","name":"季结","slogan":"The Grand Canyon State"}
                  ];
    var store = Ext.create('Ext.data.Store', {
        autoDestroy: true,
        fields: [
            {type: 'string', name: 'abbr'},
            {type: 'string', name: 'name'},
            {type: 'string', name: 'slogan'}
        ],
        data: states
    });
    var simpleCombo = Ext.create('Ext.form.field.ComboBox', {
        renderTo: obj,
        displayField: 'name',
        width: 280,
        labelWidth: 130,
        store: store,
        queryMode: 'local',
        typeAhead : true,
        listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
	    		
	    		if('日结'==this.getValue()){
	    			$("#balanceTerm").val("1");
	    		}
	    		if('周结'==this.getValue()){
	    			$("#balanceTerm").val("2");
	    		}
	    		if('月结'==this.getValue()){
	    			$("#balanceTerm").val("3");
	    		}
	    		if('季结'==this.getValue()){
	    			$("#balanceTerm").val("4");
	    		}
	    		
	    	},
	    	//监听渲染事件
	    	render: function(){
	    		var i = $("#balanceTerm").val()
	    		if (i == 2) {
	    			this.setValue("周结");
				}
	    		if (i == 1) {
	    			this.setValue("日结");
	    		}
	    		if (i == 3) {
	    			this.setValue("月结");
	    		}
	    		if (i == 4) {
	    			this.setValue("季结");
	    		}
	        }
        }
        
    });
}

function initCombo03(obj){
	var states03 = [
                  {"abbr":"AL","name":"线上方式","slogan":"The Heart of Dixie"},
                  {"abbr":"AK","name":"线下方式","slogan":"The Land of the Midnight Sun"}
                 ];
    var store = Ext.create('Ext.data.Store', {
        autoDestroy: true,
        fields: [
            {type: 'string', name: 'abbr'},
            {type: 'string', name: 'name'}
         
        ],
        data: states03
    });
    var simpleCombo03 = Ext.create('Ext.form.field.ComboBox', {
        renderTo: obj,
        displayField: 'name',
        width: 280,
        labelWidth: 130,
        store: store,
        queryMode: 'local',
        typeAhead : true,
        listeners:{  
	    	select : function(combo, records, eOpts){
	    		if('线上方式'==this.getValue()){
	    			$("#balanceType").val("1");
	    		}
	    		if('线下方式'==this.getValue()){
	    			$("#balanceType").val("2");
	    		}
	    	},
	    	render:function(){
	    		var i = $("#balanceType").val();
	    		if (i == 1) {
					this.setValue("线上方式");
				}
	    		if (i == 2) {
	    			this.setValue("线下方式");
	    		}
	    	}
        }
    });
}

/*
* 提示文字
*/
function qtips(value, cellmeta, record, rowIndex, colIndex, store){
    return '<span  title="'+ value +'">' + value + '</span>';    
}
/* upload */
//图片路径赋值 
function uploadPath(){
	
	 var path = $("#uploadFile").val();
	/* alert("logn  的拿到的值 uploadFile=====>"+path);*/
     $("#path").val(path);
     $("#img").attr('src',path);
     $("#img").next().css('display','none'); 
}

function uploadPath02(){
	 var path02 = $("#uploadFile02").val();
	/* alert("企业执照的  拿到的值 uploadFile02  =====>："+path02);*/
     $("#path02").val(path02);
     $("#img").attr('src',path02);
     $("#img").next().css('display','none');
}

//合同 
function uploadPath03(){
	 var path03 = $("#uploadFile03").val();
	/* alert("企业执照的  拿到的值 uploadFile02  =====>："+path03);*/
    $("#path03").val(path03);
    $("#img").attr('src',path03);
    $("#img").next().css('display','none');
}

// 图片上传 及数据保存  积分 logon
function uploadImage() {
	$("#uploadImg01").click(function() {
//		alert("======> uploadImg01   Loghon 执行的方法");
		var ext = '.jpg.jpeg.gif.bmp.png.';
		var f = $("#uploadFile").val();
		if (f == "") {// 先判断是否已选择了文件
			alert("请选择文件！");
			return false;
		}
		
		f = f.substr(f.lastIndexOf('.') + 1).toLowerCase();
		if (ext.indexOf('.' + f + '.') == -1) {
			alert("图片格式不正确！");
			return false;
		}
	
		$.ajaxFileUpload({
			url :  rootPath+"/pcProverider/uploadFileProverider",
			secureuri : false,
			fileElementId : 'uploadFile',
			dataType : 'json',
			success : function(data) {
				alert("======"+data.result);
				if(data.result =="success"){
					
					alert(data.msg);
					if (data.msg !=""){
						/*fileName = data.fileName;*/
						$("#providerPicUrl").val(data.msg);
						alert("上传图片成功");
					} else {
						alert(data.message);
					}
				}
			},
			error : function(data, status, e) {
				alert("文件上传失败，请联系系统管理员");
			}
		});
	});
}

//图片上传 企业营业执照
function uploadImage02() {
	$("#uploadImg02").click(function() {
		/*alert("======>企业执照  执行的方法  ");*/
		var ext = '.jpg.jpeg.gif.bmp.png.';
		var f = $("#uploadFile02").val();
	/*	alert("企业执照  ====》："+f);*/
		if (f == "") {// 先判断是否已选择了文件
			alert("请选择文件！");
			return false;
		}
		
		f = f.substr(f.lastIndexOf('.') + 1).toLowerCase();
		if (ext.indexOf('.' + f + '.') == -1) {
			alert("图片格式不正确！");
			return false;
		}
	
		$.ajaxFileUpload({
			url :  rootPath+"/pcProverider/uploadFileProverider",
			secureuri : false,
			fileElementId : 'uploadFile02',   //注意细节问题
			dataType : 'json',
			success : function(data) {
				alert("======"+data.result);
				if(data.result =="success"){
					
					alert(data.msg);
					if (data.msg !=""){
						/*fileName = data.fileName;*/
						$("#bproviderLicense").val(data.msg);
						alert("上传图片成功");
					} else {
						alert(data.message);
					}
				}
			},
			error : function(data, status, e) {
				alert("文件上传失败，请联系系统管理员");
			}
		});
	});
}

//合同扫描
function uploadImage03() {
	$("#uploadImg03").click(function() {
		/*alert("======>合同  执行的方法  ");*/
		var ext = '.jpg.jpeg.gif.bmp.png.';
		var f = $("#uploadFile03").val();
		/*alert("企业执照  ====》："+f);*/
		if (f == "") {// 先判断是否已选择了文件
			alert("请选择文件！");
			return false;
		}
		
		f = f.substr(f.lastIndexOf('.') + 1).toLowerCase();
		if (ext.indexOf('.' + f + '.') == -1) {
			alert("图片格式不正确！");
			return false;
		}
	
		$.ajaxFileUpload({
			url :  rootPath+"/pcProverider/uploadFileProverider",
			secureuri : false,
			fileElementId : 'uploadFile03',   //注意细节问题
			dataType : 'json',
			success : function(data) {
				alert("======"+data.result);
				if(data.result =="success"){
					
					alert(data.msg);
					if (data.msg !=""){
						/*fileName = data.fileName;*/
						$("#bproviderContract").val(data.msg);
						alert("上传图片成功");
					} else {
						alert(data.message);
					}
				}
			},
			error : function(data, status, e) {
				alert("文件上传失败，请联系系统管理员");
			}
		});
	});
}

/*=======================*/
function onfocus(){
    $("input[type='text']").focus(function(){
        $(this).addClass("blur");
    })
     $("input[type='text']").blur(function(){
        $(this).removeClass("blur");
    })
}
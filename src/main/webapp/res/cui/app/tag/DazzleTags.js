//tag定义区
////////////////////////////////下拉列表///////////////////////////////
var ListBox = function(listBoxId){
	this.listBoxId = listBoxId;
}
ListBox.prototype = {
	listBoxProperties:['nullid','nulltext','defaultvalue','parameters','serviceclass','method','valuefield','displayfield','attrs'],
	
	loadListBoxData:function(boxId){
		if(boxId==null){
			boxId = this.listBoxId;
		}
		var box = Ext.getDom(boxId);
		var refreshURL = rootPath+"/dazzle/util/tags/TagAction/getListBoxXml?";
		/*for(var p in box){
			if(this.listBoxProperties.indexOf(p)!=-1 && box[p]!=null && box[p]!="undefined"){
				refreshURL+=p+"="+encodeURI(encodeURIComponent(box[p]))+"&";
			}
		}*/
		Ext.each(this.listBoxProperties,function(e,i){
			if(box.getAttribute(e)){
				refreshURL+=e+"="+encodeURI(encodeURIComponent(box.getAttribute(e)))+"&";
			}
		});
		refreshURL = refreshURL.substring(0,refreshURL.length-1);
		// 对url进行encodeURI编码
		Ext.Ajax.request({
			url : refreshURL,
			async:false,
			method : 'GET',
			success : function(response) {
				var html = box.outerHTML;
				var index = html.indexOf(">");
				var leftHtml = html.substring(0,index+1);
				var xmlData = response.responseText;
				box.outerHTML=leftHtml+xmlData+"</SELECT>";
				var refreshFunc = box.getAttribute("onrefresh");
				if(refreshFunc){
					eval(refreshFunc);
					//alert(refreshFunc);
					//refreshFunc();
				}
			},
			failure : function() {
				Ext.emptyFn();
			}
		});
	},
	refreshListBox:function(boxId,parameters,refreshCallBack){
		if(boxId==null){
			boxId = this.listBoxId;
		}
		var box =Ext.getDom(boxId);
		box.setAttribute('parameters',parameters);
		this.loadListBoxData(boxId);
		if(refreshCallBack){
			refreshCallBack();
		}
	},
	changeLink:function(srcId,destId,paramIndex){
		if(paramIndex<=0){
			return false;
		}
		var value = Ext.getDom(srcId).value;
		var params = Ext.getDom(destId).getAttribute('parameters');
		if(params==null){
			return false;
		}
		var paraArray = params.split("|");
		paraArray[paramIndex-1]=value;
		var str = "";
		for(var i=0;i<paraArray.length;i++){
			str+=paraArray[i]+"|";
		}
		str = str.substring(0,str.length-1);
		Ext.getDom(destId).setAttribute("parameters",str);
		this.loadListBoxData(destId);
		if(Ext.isIE){
			Ext.getDom(destId).fireEvent("onchange");
		}else{
			$("#"+destId).change();
		}
		
	}
};
///////////////////////////////checkbox复选列表//////////////////////////////
var ListCheckBox = function(listCheckBoxId){
	this.listCheckBoxId = listCheckBoxId;
}
ListCheckBox.prototype = {
	/**
	 * 选中所有项
	 * @param {} listCheckBoxId
	 */
	selectAllItems:function(){
		var items = document.getElementsByName(this.listCheckBoxId);
		for(var i = 0;items!=null&&i<items.length;i++){
			items[i].checked = "checked";
		}
	},
	/**
	 * 清空所有选中项
	 * @param {} listCheckBoxId
	 */
	clearAllItems:function(){
		var items = document.getElementsByName(this.listCheckBoxId);
		for(var i = 0;items!=null&&i<items.length;i++){
			items[i].checked = "";
		}
	},
	/**
	 * 反选
	 * @param {} listCheckBoxId
	 */
	deSelectAllItems:function(){
		var items = document.getElementsByName(this.listCheckBoxId);
		for(var i = 0;items!=null&&i<items.length;i++){
			if(items[i].checked == ""||items[i].checked==false){
				items[i].checked = "checked";
			}else{
				items[i].checked = "";
			}
		}
	},
	/**
	 * 选中某几项
	 * @param {} listCheckBoxId
	 * @param {} itemIds
	 */
	selectItem:function(itemIds){
		if(typeof itemIds == "string"){
			itemIds = itemIds.split(",");
		}
		if(typeof itemIds == "object"){
			for(var i=0;i<itemIds.length;i++){
				var item = document.getElementById(this.listCheckBoxId+"_"+itemIds[i]);
				item.checked = "checked";
			}
		}
	},
	/**
	 * 清空某几项
	 * @param {} listCheckBoxId
	 * @param {} itemIds
	 */
	clearItem:function(itemIds){
		if(typeof itemIds == "string"){
			itemIds = itemIds.split(",");
		}
		if(typeof itemIds == "object"){
			for(var i=0;i<itemIds.length;i++){
				var item = document.getElementById(this.listCheckBoxId+"_"+itemIds[i]);
				item.checked = "";
			}
		}
	},
	/**
	 * 获得选中的dom对象数组
	 */
	getSelectedItems:function(){
		var selected = [];
		var items = document.getElementsByName(this.listCheckBoxId);
		for(var i = 0;items!=null&&i<items.length;i++){
			if(items[i].checked == "checked"||items[i].checked==true){
				selected.push(items[i]);
			}
		}
		return selected;
	},
	/**
	 * 获得选中的对象的某个属性值
	 * @param {} attrName
	 */
	getSelectedItemAttrValues:function(attrName){
		var selectedAttrValues = [];
		var items = document.getElementsByName(this.listCheckBoxId);
		for(var i = 0;items!=null&&i<items.length;i++){
			if(items[i].checked == "checked"||items[i].checked==true){
				var items = items[i];
				var attrValue = items.getAttribute(attrName);
				if(attrValue!=null&&attrValue!=undefined){
					selectedAttrValues.push(items[i]);
				}
			}
		}
		return selectedAttrValues;
	},
	/**
	 * 获得选中的值列表
	 * @param {} listCheckBoxId
	 */
	getSelectedValues:function(){
		var selectedValues = "";
		var items = document.getElementsByName(this.listCheckBoxId);
		for(var i = 0;items!=null&&i<items.length;i++){
			if(items[i].checked == "checked"||items[i].checked==true){
				selectedValues+=items[i].value+",";
			}
		}
		//截取最后的逗号
		selectedValues = selectedValues.charAt(selectedValues.length-1)==','?selectedValues.substring(0,selectedValues.length-1):selectedValues;
		return selectedValues;
	}	
};
////////////////////////////////radio列表/////////////////////////////////
var ListRadio= function(listRadioId){
	this.listRadioId = listRadioId;
}
ListRadio.prototype = {
	/**
	 * 选中某一项
	 * @param {} listCheckBoxId
	 * @param {} itemId
	 */
	selectItem:function(itemId){
		var items = document.getElementsByName(this.listRadioId);
		for(var i = 0;items!=null&&i<items.length;i++){
			items[i].checked = "";
		}
		var item = document.getElementById(this.listRadioId+"_"+itemId);
		item.checked = "checked";
	},
	/**
	 * 清空某一项
	 * @param {} listCheckBoxId
	 * @param {} itemId
	 */
	clearItem:function(itemId){
		var item = document.getElementById(this.listRadioId+"_"+itemId);
		item.checked = "";
	},
	/**
	 * 获得选中的dom对象数组
	 * @param {} listCheckBoxId
	 */
	getSelectedItem:function(){
		var items = document.getElementsByName(this.listRadioId);
		for(var i = 0;items!=null&&i<items.length;i++){
			if(items[i].checked == "checked"||items[i].checked==true){
				return items[i];
			}
		}
		return null;
	},
	/**
	 * 获得选中的对象的某个属性值
	 * @param {} attrName
	 */
	getSelectedItemAttrValue:function(attrName){
		var item = this.getSelectedItem(this.listRadioId);
		if(item!=null){
			return item.getAttribute(attrName);
		}else{
			return null;
		}
	},
	/**
	 * 获得选中的值
	 * @param {} listCheckBoxId
	 */
	getSelectedValue:function(){
		var item = this.getSelectedItem(this.listRadioId);
		if(item!=null){
			return item.value;
		}else{
			return "";
		}
	}
}
//Tag对象缓存
var tagCache = new Array();

//Tag对象生成
var dazzleTag = {
	//private
	_findTagFromCache:function(tagType,tagId){
		return tagCache[tagType+"_"+tagId];
	},
	//private
	_putTagToCache:function(tagType,tagId,tagInstance){
		return tagCache[tagType+"_"+tagId] = tagInstance;
	},
	//生成listbox对象
	listBox:function(listBoxId){
		var cache = this._findTagFromCache("listBox",listBoxId);
		if(cache!=null){
			return cache;
		}
		return this._putTagToCache("listBox",listBoxId,new ListBox(listBoxId));
	},
	//生成listcheckbox对象
	listCheckBox:function(listCheckBoxId){
		var cache = this._findTagFromCache("listCheckBox",listCheckBoxId);
		if(cache!=null){
			return cache;
		}
		return this._putTagToCache("listCheckBox",listCheckBoxId,new ListCheckBox(listCheckBoxId));
	},
	//生成listradio对象
	listRadio:function(listRadioId){
		var cache = this._findTagFromCache("listRadio",listRadioId);
		if(cache!=null){
			return cache;
		}
		return this._putTagToCache("listRadio",listRadioId,new ListRadio(listRadioId));
	}
}

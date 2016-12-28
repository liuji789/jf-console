
//EXT百分比页面转换，将数值乘以100
//依赖mathUtil.js
function PercentRender(value, meta, record, rowIndex, colIndex, store) {
	var returnValue = "";
	if (value==null) {
		return returnValue;
	}
	returnValue = accMul(value,100);
	return returnValue;
}

//EXT时间页面展示变换
function DTRender(value, meta, record, rowIndex, colIndex, store) {
	var returnValue = "";
	if (value=="" || value==null || value==0) {
		return returnValue;
	}
	if (typeof value == "object") {
		returnValue = Ext.util.Format.date(new Date(value.time), 'Y-m-d H:i:s');
	} else if (typeof value == "number"){
		returnValue = Ext.util.Format.date(new Date(value), 'Y-m-d H:i:s');
	} else {
		returnValue = value.substr(0,19);
	}
	return returnValue;
}

//EXT日期页面展示变换
function DateRender(value, meta, record, rowIndex, colIndex, store) {
	var returnValue = "";
	if (value=="" || value==null || value==0) {
		return returnValue;
	}
	if (typeof value == "object") {
		returnValue = Ext.util.Format.date(new Date(value.time), 'Y-m-d');
	} else {
		returnValue = value.substr(0,19);
	}
	return returnValue;
}

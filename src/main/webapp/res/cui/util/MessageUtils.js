//dazzle消息提示工具
Dazzle.util.MessageUtils = {
	// 提示框展示
	showMsg : function(msg) {
		alert(msg);
	},
	// 确认框展示
	showConfirm : function(msg) {
		return confirm(msg);
	}
};
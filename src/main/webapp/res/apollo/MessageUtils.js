//知识库消息提示工具类
AthenaMsg = {
	show : function(type,obj,obj1,obj2,obj3){
		var msg = this.msgMap[type];
		msg = String.format(msg,obj,obj1,obj2,obj3);
		Dazzle.util.MessageUtils.showMsg(msg);
	},
	showConfirm: function(type,obj,obj1,obj2,obj3){
		var confirmMsg =this.msgMap[type];
		confirmMsg = String.format(confirmMsg,obj,obj1,obj2,obj3);
		return Dazzle.util.MessageUtils.showConfirm(confirmMsg);
	},
	/**
	 * 提示信息
	 */
	msgMap : {
		//名称重复	
		"name_duplicate" :"{0}已被使用，请重新输入！",
		//输入信息为空提示
		"field_empty" :	"{0}不能为空，请输入！",
		//输入内容超长提示
		"over_length" : "{0}输入超长，不能超过{1}个字符（一个汉字为两个字符）,请重新输入！",
		//输入内容不足提示	
		"under_length": "{0}输入不足，不能少于{1}个字符（一个汉字为两个字符）,请重新输入！",
		//输入内容格式不正确	
		"format_error" :"{0}应为{1}格式，请重新输入！",
		//非法字符提示	
		"illegal_char":"包含非法字符{0}，请重新输入！",
		//范围提示
		"scope_error": "{0}{1}不能大于{2}，请检查后重新输入！",
		//增加成功
		"add_success":"添加{0}成功！",
		//修改成功
		"modify_success":"修改{0}成功！",
		//删除成功
		"remove_success":"删除{0}成功！",
		//推荐成功
		"recommend_success":"推荐{0}至内部首页成功！",
		//取消推荐
		"cancel_reco_success" : "从内部首页取消{0}推荐成功！",
		//审批通过
		"approval_success":"通过{0}审批成功！",
		//驳回成功	
		"reject_success" : "驳回{0}审批成功！",
		//增加失败
		"add_failure":"保存{0}失败，请联系系统管理员！",
		//修改失败
		"modify_failure":"修改{0}失败，请联系系统管理员！",
		//删除失败
		"remove_failure":"删除{0}失败，请联系系统管理员！",
		//推荐失败
		"recommend_failure":"推荐{0}至内部首页失败，请联系系统管理员！",
		//取消推荐
		"cancel_reco_failure" : "从内部首页取消{0}推荐失败，请联系系统管理员！",
		//审批通过
		"approval_failure":"通过{0}审批失败，请联系系统管理员！",
		//驳回失败	
		"reject_failure" : "驳回{0}审批失败，请联系系统管理员！",
		//删除确认
		"remove_confirm":"确定要删除该{0}吗？",
		//推荐确认
		"recommend_confirm":"确定要将该{0}推荐至内部首页吗？",
		//取消推荐
		"cancel_reco_confirm" : "确定要从内部首页取消该{0}推荐吗？",
		//审批通过
		"approval_confirm":"确定提交该{0}审批吗？",
		//驳回确认	
		"reject_confirm" : "确定要驳回该{0}的审批吗？",
		//注销	
		"logout_confirm" : "确定注销登录吗？",
		//系统异常提示信息
		"sys_error" : "系统故障，请联系管理员！"
	}
};



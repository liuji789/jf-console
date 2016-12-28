// 定义demoPager全局变量
var demoPager = null;
var data = null;
var count = "50";
$(function(){
	// 实例化demoPager
	demoPager= new pagerPanel({
		// 总数
		totalCount:count,
		// 渲染divId
		renderTo:"pager",
		// 回调函数
		callBack:function(currentPage,startIndex, endIndex){
			//$.ajax{url:..., params:..., success:function(response){...}}
			$("#startIndexNum").html(startIndex);
			$("#endIndexNum").html(endIndex);
		},
		// 当前页,默认为1
		currentPage:1,
		// 每页显示几条数据,默认10
		pageSize:10,
		// 分页栏中页码的数量,默认10
		pageNum:11,
		// 是否同步,默认为同步
		sync:false
	});
	// 实例化结束
	$("#startIndexNum").html("1");
	$("#endIndexNum").html(demoPager.pageSize);
});

function query(){
	var totalCount = 50;
	var pageSize = 10;
	if($("#totalCountText").val()!=""){
		totalCount = parseInt($("#totalCountText").val());
	}
	if($("#pageSizeText").val()!=""){
		pageSize = parseInt($("#pageSizeText").val());
	}
	demoPager.reRender(totalCount,null,pageSize);
	$("#startIndexNum").html("1");
	$("#endIndexNum").html(demoPager.pageSize);
}

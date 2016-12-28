/**
 * 分页条组件，实现分页效果
 * @Author:huxy 2012-09-20
 */
function pagerPanel(pager) {
	// 记录总数
	this.totalCount = parseInt(pager.totalCount);
	// 每页容量
	this.pageSize = parseInt(pager.pageSize) || 10;
	// 页面容器
	this.pageContainer = $("#" + pager.renderTo);
	// 回调函数
	this.callBack = pager.callBack;
	// 当前页,默认为1
	this.currentPage = parseInt(pager.currentPage) || 1;
	// 总页数
	this.pageCount = this.getPageCount();
	// 分页栏显示页数
	this.pageNum = Math.max(pager.pageNum || 10, 10);
	// 组件样式,默认为1
	this.themeStyle = parseInt(pager.themeStyle) || 1; 
	// 同步或异步
	pager.sync === false ? this.sync = false : this.sync = true;

	// 页码的容器div
	this.htmlNumContainer = null;
	// 首页
	this.htmlFirstPage = null; 
	// 上一页
	this.htmlPrvPage = null; 
	// 下一页
	this.htmlNextPage = null;
	// 尾页
	this.htmlLastPage = null; 
	// 页码集合的容器div
	this.htmlPageNumContainer = null; 
	// 所有页码的集合
	this.htmlPageNum = null; 
	this.htmlTotalRecord = null;
	this.htmlPageSize = null;
	this.htmlTotalPage = null;
	//
	this.htmlInputPage = null;
	this.htmlGoPage = null;

	this.render();
}

pagerPanel.prototype = {
	render : function() {
		/*
		 * 页码的显示形式为： <div id="pager"> 共<span>300</span>条 每页<span>20</span>条
		 * 共<span>15</span>页 <div class="a"> <span class="unUse">首页</span>
		 * <span class="unUse">上一页</span> <div class="b"> <span class="cur">1</span>
		 * <span class="use">2</span> <span class="use">3</span> </div> <span
		 * class="use">下一页</span> <span class="use">尾页</span> </div> </div>
		 */
		var panel = this;
		var pageHtml = '<p class="page">'
				+ "<span class='numContainer' name='xxx'>"
				+ "<a id='firstPage' class='pagePrev'>首页</a>" + "<a id='prevPage' class='pagePrev'>上一页</a>"
				+ "<span class='pageNumContainer'>"
				+ this.setPageNum()
				+ "</span>"
				+ "<a id='nextPage' class='pageNext'>下一页</a>" + "<a id='lastPage' class='pageNext'>尾页</a>"
				+ "</span>"
				+ '<span id="totalCount" class="pl10 pr t1">共' + this.totalCount + '条</span>' 
				+ '<span id="pageSize" class="pl10 pr t1">每页' + this.pageSize + '条</span>' 
				+ '<span id="pageCount" class="pl10 pr t1">共' + this.pageCount + '页 到第</span>' 
				+ '<input id="inputPageNum" type="text" class="w30" />'
				+ '<span class="pl5 pr10 pr t1">页</span>'
				+ '<a id=\'goPage\' href="####" class="btn1">确定<s class="sl"></s><s class="sr"></s></a>'
				+"</p>";
		this.pageContainer.append(pageHtml);
		this.htmlTotalRecord = $("#totalCount", this.pageContainer);
		this.htmlPageSize = $("#pageSize", this.pageContainer);
		this.htmlTotalPage = $("#pageCount", this.pageContainer);
		this.htmlNumContainer = $(".numContainer", this.pageContainer);
		this.htmlFirstPage = $("#firstPage", this.pageContainer);
		this.htmlPrvPage = $("#prevPage", this.pageContainer);
		this.htmlNextPage = $("#nextPage", this.pageContainer);
		this.htmlLastPage = $("#lastPage", this.pageContainer);
		//htmlInputPage
		this.htmlInputPage = $("#inputPageNum",this.pageContainer);
		this.htmlGoPage = $("#goPage",this.pageContainer);
		this.htmlPageNumContainer = $(".pageNumContainer", this.htmlNumContainer);
		this.htmlPageNum = $("a", this.htmlPageNumContainer);
		this.htmlFirstPage.click(function() {
					if (panel.currentPage != 1) {
						panel.currentPage = 1;
						panel.gotoPage();
					}
				});
		this.htmlPrvPage.click(function() {
					if (panel.currentPage != 1) {
						panel.currentPage--;
						panel.gotoPage();
					}
				});
		this.htmlNextPage.click(function() {
					if (panel.currentPage != panel.pageCount) {
						panel.currentPage++;
						panel.gotoPage();
					}
				});
		this.htmlLastPage.click(function() {
					if (panel.currentPage != panel.pageCount) {
						panel.currentPage = panel.pageCount;
						panel.gotoPage();
					}
				});
		this.htmlGoPage.click(function() {
					var goPageNum = parseInt($("#inputPageNum").val());
					if (goPageNum>0) {
						if(goPageNum>panel.pageCount){
							alert("数据共"+panel.pageCount+"页.不存在第"+goPageNum+"页.");
						}else{
							panel.currentPage = goPageNum;
							panel.gotoPage();
						}
					}else{
						alert("输入页号不得小于1.");
					}
				});
		if (this.pageCount > 1) {
			this.htmlNumContainer.css("display", "inline");
			this.setStyle();
		}
	},
	setPageNum : function() {
		// 设置每页显示的页码，
		// 页码的显示取决与3个因素：
		// 1、每页显示的页码数量
		// 2、当前页
		// 3、总页数
		var pageNumArray = [];
		var firstNum = 1, lastNum = this.pageCount;

		// 当总页数>每页显示的页数时才需要额外的处理
		if (this.pageCount > this.pageNum) {
			var halfNum = Math.floor(this.pageNum / 2);
			firstNum = this.currentPage - halfNum;
			if (firstNum <= 0) {
				firstNum = 1;
			} else {
				var isTotalPage = false;
				while ((firstNum + this.pageNum) > (this.pageCount + 1)) {
					isTotalPage = true;
					firstNum--;
				}
			}
			if (isTotalPage) {
				lastNum = this.pageCount;
			} else {
				lastNum = firstNum + this.pageNum - 1;
			}
		}
		for (var i = firstNum; i <= lastNum; i++) {
			pageNumArray.push("<a name='pageNo'>" + i + "</a>");
		}
		return pageNumArray.join("");
	},
	setStyle : function() {
		// 设置样式
		var panel = this;
		// 设置默认颜色风格
		var usableCssClass = "use";
		var disableCssClass = "unUse";
		var usableColor = "";
		var disableColor = "grey";
		var currentCssClass = "pageCurrent";
		var currentColor = "white";
		if(this.themeStyle==2){
			// 设置第二种颜色风格
		}
		// 通过当前页号判断首页,上一页按钮的颜色
		if (this.currentPage != 1) {
			// 不为第一页,设置首页与上一页按钮为可用样式
			this.htmlFirstPage.css({
						cursor : "pointer",
						color : usableColor
					}).removeClass(disableCssClass).addClass(usableCssClass);
			this.htmlPrvPage.css({
						cursor : "pointer",
						color : usableColor
					}).removeClass(disableCssClass).addClass(usableCssClass);
		} else {
			// 若为第一页,设置首页与上一页按钮为不可用样式
			this.htmlFirstPage.css({
						cursor : "",
						color : disableColor
					}).removeClass(usableCssClass).addClass(disableCssClass);
			this.htmlPrvPage.css({
						cursor : "",
						color : disableColor
					}).removeClass(usableCssClass).addClass(disableCssClass);
		}
		// 通过当前页号判断尾,下一页按钮的颜色
		if (this.currentPage != this.pageCount) {
			// 不为尾页,设置尾页与下一页按钮为可用样式
			this.htmlLastPage.css({
						cursor : "pointer",
						color : usableColor
					}).removeClass(disableCssClass).addClass(usableCssClass);
			this.htmlNextPage.css({
						cursor : "pointer",
						color : usableColor
					}).removeClass(disableCssClass).addClass(usableCssClass);
		} else {
			// 若为尾巴页,设置尾页与下一页按钮为可用样式
			this.htmlLastPage.css({
						cursor : "",
						color : disableColor
					}).removeClass(usableCssClass).addClass(disableCssClass);
			this.htmlNextPage.css({
						cursor : "",
						color : disableColor
					}).removeClass(usableCssClass).addClass(disableCssClass);
		}
		// 设置当前页按钮与悬浮样式
		this.htmlPageNum.each(function() {
			var pageNum = Number($(this).html());
			if (panel.currentPage != pageNum) {
				$(this).css({
							cursor : "pointer"
							//,textDecoration : "underline"
						}).click(function() {
							panel.currentPage = pageNum;
							panel.gotoPage();
						}).mouseover(function() {
							$(this).css("color", currentColor);
						}).mouseout(function() {
							$(this).css("color", "");
						}).removeClass(currentCssClass);
			} else {
				$(this).css("color", currentColor).addClass(currentCssClass);
			}
		});

	},
	reRender : function(_totalCount, _currentPage, _pageSize) {
		this.totalCount = _totalCount;
		this.pageSize = _pageSize || this.pageSize;
		this.currentPage = _currentPage || 1;
		this.pageCount = this.getPageCount();
		this.htmlTotalRecord.html("共" + this.totalCount + "条");
		this.htmlPageSize.html("每页" + this.pageSize + "条");
		this.htmlTotalPage.html("共" + this.pageCount + "页 到第");
		if (this.pageCount > 1) {
			this.htmlNumContainer.css("display", "inline");
			this.htmlPageNumContainer.html(this.setPageNum());
			this.htmlPageNum = $("a", this.htmlPageNumContainer);
			this.setStyle();
		} else {
			this.htmlNumContainer.css("display", "none");
		}
	},
	// 设置颜色主题
	setTheme : function(themeStyle) {
		this.themeStyle = parseInt(themeStyle);
	},
	getPageCount : function() {
		// 计算总页数
		return Math.floor((this.totalCount + this.pageSize - 1)
				/ this.pageSize);
	},
	// 去网页面函数
	gotoPage : function() {
		if (!this.sync) {
			// 异步时，需要更新组件的外观
			this.htmlPageNumContainer.html(this.setPageNum());
			this.htmlPageNum = $("a", this.htmlPageNumContainer);
			this.setStyle();
		}
		// 清空输入栏数字
		this.htmlInputPage.val("");
		this.callBack(this.currentPage, this.getStartIndex(), this.getEndIndex());
	},
	// 获取start索引值
	getStartIndex : function(){
		return (this.currentPage-1)*this.pageSize+1;
	},
	// 获取end索引值
	getEndIndex : function(){
		return this.currentPage*this.pageSize;
	}
};
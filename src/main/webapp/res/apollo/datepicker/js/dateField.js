$(function(){
		/*
		* 年
		* Author yjp
		* Date 2013-1-7
		*/
		$("#year").live("click",function(){
			WdatePicker({
				el: "yearBox",
				dateFmt: "yyyy"
			});
		});
		/*
		* 月
		* Author yjp
		* Date 2013-1-7
		*/
		$("#month").live("click",function(){
			WdatePicker({
				el: "monthBox",
				dateFmt: "MM"
			});
		});
		/*
		* 年-月-日
		* Author yjp
		* Date 2013-1-7
		*/
		$("#ymd").live("click",function(){
			WdatePicker({
				el: "ymdBox",
				dateFmt: "yyyy-MM-dd"
			});
		});
		/*
		* 年-月-日 时
		* Author yjp
		* Date 2013-1-7
		*/
		$("#ymdh").live("click",function(){
			WdatePicker({
				el: "ymdhBox",
				dateFmt: "yyyy-MM-dd HH"
			});
		});
		/*
		* 年-月-日 时分
		* Author yjp
		* Date 2013-1-7
		*/
		$("#ymdhm").live("click",function(){
			WdatePicker({
				el: "ymdhmBox",
				dateFmt: "yyyy-MM-dd HH:mm"
			});
		});
		/*
		* 年-月-日 时分秒
		* Author yjp
		* Date 2013-1-7
		*/
		$("#ymdhms").live("click",function(){
			WdatePicker({
				el: "ymdhmsBox",
				dateFmt: "yyyy-MM-dd HH:mm:ss"
			});
		});
		
		/*
		 * 日期控件起始
		 * Author zhaiqi
		 * Date 2014-02-12
		 */
		$("#ymdhmsStart").live("click",function(){
			WdatePicker({
				el: "ymdhmsBoxStart",
				dateFmt: "yyyy-MM-dd HH:mm:ss"
			});
		});
		$("#ymdhmsEnd").live("click",function(){
			WdatePicker({
				el: "ymdhmsBoxEnd",
				dateFmt: "yyyy-MM-dd HH:mm:ss"
			});
		});
		
		/*
		 * 日期控件起始1
		 * Author zhangweilin
		 * Date 2014-02-20
		 */
		$("#ymdhmsStart1").live("click",function(){
			WdatePicker({
				el: "ymdhmsBoxStart1",
				dateFmt: "yyyy-MM-dd HH:mm:ss"
			});
		});
		$("#ymdhmsEnd1").live("click",function(){
			WdatePicker({
				el: "ymdhmsBoxEnd1",
				dateFmt: "yyyy-MM-dd HH:mm:ss"
			});
		});
		
		/*
		 * 日期控件起始2
		 * Author zhangweilin
		 * Date 2014-02-20
		 */
		$("#ymdhmsStart2").live("click",function(){
			WdatePicker({
				el: "ymdhmsBoxStart2",
				dateFmt: "yyyy-MM-dd HH:mm:ss"
			});
		});
		$("#ymdhmsEnd2").live("click",function(){
			WdatePicker({
				el: "ymdhmsBoxEnd2",
				dateFmt: "yyyy-MM-dd HH:mm:ss"
			});
		});
	});
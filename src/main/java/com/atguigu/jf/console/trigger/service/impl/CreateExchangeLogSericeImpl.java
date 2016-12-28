package com.atguigu.jf.console.trigger.service.impl;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.trigger.ExchangeLogMapper;
import com.atguigu.jf.console.trigger.bean.bo.ExchangeLogBean;
import com.atguigu.jf.console.trigger.service.CreateExchangeLogSerice;

@Service
public class CreateExchangeLogSericeImpl implements CreateExchangeLogSerice {

	@Autowired
	private ExchangeLogMapper exchangeLogMapper;
	
	@Override
	public String CreateExchangeLogExcle() {
		Map<String, Object> map = new HashMap<String, Object>();
		String path = "E:\\file\\";
		String fileName = this.getFileName("ExchangeLog");
		try {

			Workbook wb = new HSSFWorkbook();
			Sheet sheet = wb.createSheet("new sheet");
			CreationHelper createHelper = wb.getCreationHelper();
			Row row = sheet.createRow((short) 0);
			
			String[] titles = new String[] { "积分导入流水", "业务发生时间", "积分供应商",
					"导入积分", "积分兑换比例", "兑换手续费率", "结算金额", "平台利润", "结算状态", "结算日期",
					"导出状态", "导出时间" };
			// 创建表头
			for (int i = 0; i < titles.length; i++) {
				row.createCell(i).setCellValue(
						createHelper.createRichTextString(titles[i]));
			}

			List<ExchangeLogBean> list = exchangeLogMapper
					.selectExchageLog(map);

			for (int i = 0; i < list.size(); i++) {
				Row daterow = sheet.createRow((short) (i + 1));
				ExchangeLogBean exchangeLogBean = list.get(i);
				String[] strings = this
						.getExchangeLogBeanStrings(exchangeLogBean);
				for (int j = 0; j < strings.length; j++) {
					daterow.createCell(j).setCellValue(
							createHelper.createRichTextString(strings[j]));
				}
			}

			FileOutputStream fileOut = new FileOutputStream(path + fileName);
			wb.write(fileOut);
			fileOut.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return path + fileName;
	}

	public String getFileName(String prefix) {
		return prefix
				+ new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")
						.format(new Date()) + ".xls";
	}

	public String[] getExchangeLogBeanStrings(ExchangeLogBean exchangeLogBean) {
		return new String[] { exchangeLogBean.getId(),
				exchangeLogBean.getImpDate(),
				exchangeLogBean.getProviderName(),
				exchangeLogBean.getImpPoint(), exchangeLogBean.getRate(),
				exchangeLogBean.getFee(), exchangeLogBean.getAmount(),
				exchangeLogBean.getProfit(),
				exchangeLogBean.getExchangeState(),
				exchangeLogBean.getExchangeDate(),
				exchangeLogBean.getExportState(),
				exchangeLogBean.getExportDate() };
	}

}

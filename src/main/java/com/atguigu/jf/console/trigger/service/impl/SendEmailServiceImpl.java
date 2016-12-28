package com.atguigu.jf.console.trigger.service.impl;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

import com.atguigu.jf.console.trigger.service.SendEmailService;

@Service
public class SendEmailServiceImpl implements SendEmailService {
	
	@Override
	public void sendEmail(String path) throws Exception {
		//创建邮件的Session对象
		Properties props = new Properties();
		props.setProperty("mail.host", "smtp.sina.com");
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.auth","true");
		Session session  = Session.getInstance(props);
		
		//开启Debug模式
		session.setDebug(true);
		
		//创建Message
		MimeMessage mimeMessage = new MimeMessage(session);
		//设置发送方
		mimeMessage.setFrom(new InternetAddress("15586783763@sina.cn"));
		//设置邮件的主题
		mimeMessage.setSubject("什么啊啊啊");
		//设置接收方
		mimeMessage.setRecipient(RecipientType.TO, new InternetAddress("15586783763@sina.cn"));
		//设置邮件内容
		//mimeMessage.setContent("<h1>什么鬼鬼啊啊</h1>", "text/html;charset=UTF-8");
		
		//设置邮件的附件内容
		//设置正文部分
		MimeMultipart multipart = new MimeMultipart();
		MimeBodyPart bodyPart = new MimeBodyPart();
		bodyPart.setContent("<h1>什么鬼鬼啊啊，有附件的啊</h1>", "text/html;charset=UTF-8");
		//多部件中加入正文的部分
		multipart.addBodyPart(bodyPart);
		
		bodyPart = new MimeBodyPart();
		//设置这个部分的处理器为文件的形式
		bodyPart.setDataHandler(new DataHandler(new FileDataSource(new File(path))));
		
		bodyPart.setFileName("test.xls");
		
		multipart.addBodyPart(bodyPart);
		
		//将多部件set进message中
		mimeMessage.setContent(multipart);
		
		
		//创建transport，将准备好的数据运输
		Transport transport = session.getTransport();
		transport.connect("smtp.sina.com","15586783763@sina.cn","lj520hk");
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
	}
	
}

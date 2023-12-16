package com.asap.util;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
//import javax.mail.MailService;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class JavaMail {

	private String userName = "tha104asap@gmail.com";
	private String passWord = "hgzupxnbhftjeakx";
	private String to = "";
	private String subject = "";
	private String messageText = "";
	private DataSource dataSource;

	public JavaMail(String to, String subject, String messageText, DataSource dataSource) {

		if ((to.trim()).length() == 0) {
			System.out.println("請輸入收件者");
		}
		if ((subject.trim()).length() == 0) {
			System.out.println("請輸入主旨");
		}
		if ((to.trim()).length() == 0) {
			System.out.println("請輸入內文");
		}
		this.to = to;
		this.subject = subject;
		this.messageText = messageText;
		this.dataSource = dataSource;
		System.out.println("信件設置成功");
	}

	public JavaMail(String to, String subject, String messageText) {

		if ((to.trim()).length() == 0) {
			System.out.println("請輸入收件者");
		}
		if ((subject.trim()).length() == 0) {
			System.out.println("請輸入主旨");
		}
		if ((to.trim()).length() == 0) {
			System.out.println("請輸入內文");
		}
		this.to = to;
		this.subject = subject;
		this.messageText = messageText;
		System.out.println("JavaMail : 信件設置成功");
	}

	public String sendMail() {

		try {
			// 設定使用SSL連線至 Gmail smtp Server
			Properties props = new Properties(); // 連線設定
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.port", "465");
//			props.put("mail.debug", "true");

			// 建立session
			Session session = Session.getDefaultInstance(props, new Authenticator() {

				@Override
				protected PasswordAuthentication getPasswordAuthentication() {

					return new PasswordAuthentication(userName, passWord);
				}
			});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(userName));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// 設定信中的主旨
			message.setSubject(subject);

			if (dataSource == null) {
				message.setContent(messageText, "text/html;charset=UTF-8");
			} else {
				// 設定信中的內容 文字
				MimeBodyPart text = new MimeBodyPart();
				text.setContent(messageText, "text/html;charset=UTF-8");

				// 設定信中的內容 圖片
				MimeBodyPart image = new MimeBodyPart();
				DataHandler dh = new DataHandler(dataSource);// new FileDataSource(imgFile)
				image.setDataHandler(dh);
				image.setContentID("abc");

				// 建立郵件本文內容
				MimeMultipart multipart = new MimeMultipart();
				multipart.addBodyPart(text);
				multipart.addBodyPart(image);
				multipart.setSubType("related");

				message.setContent(multipart);

				Transport.send(message);
			}
			System.out.println("JavaMail : 傳送成功");
			return "傳送成功";
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("JavaMail : 傳送失敗");
			return "傳送失敗";

		}
	}

}

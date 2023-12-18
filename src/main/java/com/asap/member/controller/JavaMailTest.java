package com.asap.member.controller;

import com.asap.util.MailFormat;

public class JavaMailTest {

	public static void main(String args[]) {
		/*
		 * JavaMail 的 constructor 
		 * 1.String to : 收件人地址 
		 * 2.String subject : 信件主旨 
		 * 3.String messageText : 
		 * 信件內容，可調用MailFormat的get方法，MailFormat的constructor需填入收件人姓名和信件內容，
		 * get方法可得到以加上開頭歡迎詞和結束詞的內容 
		 * 4.String imgFile(可省) : 圖片路徑
		 * 若無圖片，第三個參數請調用MailFormat的getMessageText方法，不填此參數;
		 * 若有圖片，第三個參數請調用MailFormat的getMessageTextAndImg方法
		 */

		MailFormat mailFormat = new MailFormat("name", "測試內容");
		JavaMail mail = new JavaMail("danieljiang9152@gmail", "測試標題", mailFormat.getMessageTextAndImg(),
				"C:\\Users\\T14 Gen 3\\Desktop\\mailLogo.png");
		mail.sendMail();

	}
}

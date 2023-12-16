package com.asap.util;

public class MailFormat {
	private String header = " 先生/小姐 您好, <br><br>";
	private String footer = "<br><br><br>Best, <br>ASAP團隊 敬上";
	private String context = "";
	private String name = "";

	public MailFormat(String name, String context) {
		this.name = name;
		this.context = context;
	}

	public String getMessageText() {

		String mailContent = name + header +  context  + footer;
		return mailContent;

	}

	public String getMessageTextAndImg() {

		String mailContent = name + header +  context  + footer
				+ "<br>--------------------------<br><img src='cid:abc'>";
		return mailContent;

	}
}

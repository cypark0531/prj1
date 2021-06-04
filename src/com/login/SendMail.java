package com.login;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	public static void sendMessage(){
		String host="smtp.gmail.com";
		
		final String username="qwertyman0505";
		final String password="gnh04271";
		int port=465;
		
		String recipient="aipotu11204@naver.com";
		String subject="메일테스트";
		
		String body="4349089";
		
		Properties props = System.getProperties();
		
		props.put("mali.smtp.host",host);
		props.put("mali.smtp.port",port);
		props.put("mali.smtp.auth","true");
		props.put("mali.smtp.ssl.enable","true");
		props.put("mali.smtp.ssl.trust",host);
		
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			String un = username;
			String pw = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		Message mimeMessage=new MimeMessage(session);
		try {
			mimeMessage.setFrom(new InternetAddress("qwertyman0505@gmail.com"));
			mimeMessage.setRecipient( Message.RecipientType.TO, new InternetAddress(recipient));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			Transport.send(mimeMessage);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

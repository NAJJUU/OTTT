package com.ottt.ottt.domain;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSend {

	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;		// 난수 발생
	
	//makeRandomNumber(): 이메일을 보낼 때 인증번호로 111111~999999까지의 난수를 발생시킨다.
	public void makeRandomNumber() {
		// 난수의 범위 111111~999999(6자리 난수)
		Random rNum = new Random();
		int checkNum = rNum.nextInt(888888)+111111;
		System.out.println("인증번호: "+checkNum);
		authNumber = checkNum;
	}
	
	//이메일 보낼 양식
	// public String joinEmail(String email): 컨트롤러에서 아이디가 넘어오면서 붙을 스트링값 
	// 메일 샌드로 보내줄 준비를 마친다.
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom="otttEmailCheck@gmail.com";
		String toMail=email;
		String title="OTTT 회원 가입 인증메일입니다.";	//이메일 제목
		String content=
				"OTTT 홈페이지를 방문해 주셔서 감사합니다."+	//HTML 형식으로 작성
		"<br><br>"+
				"인증변호는 "+authNumber+"입니다."+
		"<br>"+"해당 인증번호를 인증번호 확인란에 기입하여 주세요";	// 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	// 이메일 전송 메소드
	//public void mailSend(String setFrom, String toMail, String title, String content) :
	//MimeMessage message = mailSender.createMimeMessage(); 객체를 생성해주며, 이것이 스프링에서 제공하는 메일 API이다.
	private void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage massage = mailSender.createMimeMessage();
		//true 매개값을 전달하면 mltipert 형식의 메세지 전달이 가능, 문자 인코딩 설정도 가능하다.
		
		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(massage, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			//true 전달 > html 형식으로 전송, 작성하지 않으면 단순 텍스트로 전달
			helper.setText(content, true);
			mailSender.send(massage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
}

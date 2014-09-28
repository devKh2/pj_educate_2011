package mail;

import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import model.EmailListModel;

public class MailTransfer {

	private String from;
	private String to;
	private String authNumber;  // 난수 발생을 통해 생성된 번호
	private String title;
	
	//인증번호를 위한 생성자
	public MailTransfer(String from, String to, String authNumber) {
		this.from = from;
		this.to = to;
		this.authNumber = authNumber;
	}

	//단체메일을 위한 생성자
	public MailTransfer(String from,String title){
		this.from = from;
		this.title = title;
	}
	
	public void mailSend() {
		if (from == null || to == null ) {
			System.out.println("usage : java <from> <to>");
			System.exit(0);
		}

		try {
			System.out.println("메일을 보낼 준비가 됐다");
			// 시스템 속성 객체 생성
			Properties props = System.getProperties();

			// POP3 메일 서버 속성 설정
			props.put("mail.smtp.host", "127.0.0.01");
			
			System.out.println(to);
			
			// 메일 서버 세션 생성
			Session session = Session.getInstance(props, null);

			// 메세지 정의
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("메일서버 테스트입니다."); // 메일 제목

			// 메세지 몸체 생성
			BodyPart messageBodyPart = new MimeBodyPart();

			// 메세지 텍스트 내용 설정
			messageBodyPart.setText("인증번호는" + authNumber + "입니다");

			// 다양한 종류의 데이터 추가를 위한 객체 생성
			Multipart multipart = new MimeMultipart();

			// 첫번째 메세지 몸체 추가
			multipart.addBodyPart(messageBodyPart);

			// 새로운 몸체 생성
			//messageBodyPart = new MimeBodyPart();

			// 파일 객체 생성
			//DataSource source = new FileDataSource(filename);

			// 메세지 몸체에 파일 객체 첨부
			//messageBodyPart.setDataHandler(new DataHandler(source));

			// 파일 이름 설정
			//messageBodyPart.setFileName(filename);

			// 두번째 메세지 몸체 추가
			multipart.addBodyPart(messageBodyPart);

			// Multipart 객체를 Message 객체에 추가
			message.setContent(multipart);

			// 보낸 날짜 설정..ㅡ0ㅡ;; 이거빠지니깐 에러나는데..ㅠㅠ
			message.setSentDate(new Date());

			// 생성된 메세지 전송
			Transport.send(message);
			System.out.println("메일을 보냈다.");
		} catch (javax.mail.MessagingException ex) {
			ex.printStackTrace();
		}
	}
	
	
	//단체메일 보내는 메서드
	public void MassEmailSend(String content, List<EmailListModel> list) {
		System.out.println("MailTransfer클래스의 MassEmailSend실행");
		
		if (from == null || title == null ) {
			System.out.println("usage : java <from> <title>");
			System.exit(0);
		}

		try {

			System.out.println("메일을 보낼 준비가 됐다");
			// 시스템 속성 객체 생성
			Properties props = System.getProperties();

			// POP3 메일 서버 속성 설정
			props.put("mail.smtp.host", "127.0.0.01");
			
			System.out.println(to);
			
			// 메일 서버 세션 생성
			Session session = Session.getInstance(props, null);

			// 메세지 정의
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			
			for(int i = 0; i < list.size(); i++){
				System.out.println(list.get(i).getEmailaddr());
				if(list.get(i).getEmailaddr() != null){
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(list.get(i).getEmailaddr()));
				}
			}
			
			message.setSubject(title); // 메일 제목

			// 메세지 몸체 생성
			BodyPart messageBodyPart = new MimeBodyPart();

			// 메세지 텍스트 내용 설정
			messageBodyPart.setText(content);

			// 다양한 종류의 데이터 추가를 위한 객체 생성
			Multipart multipart = new MimeMultipart();

			// 첫번째 메세지 몸체 추가
			multipart.addBodyPart(messageBodyPart);

			// 새로운 몸체 생성
			//messageBodyPart = new MimeBodyPart();

			// 파일 객체 생성
			//DataSource source = new FileDataSource(filename);

			// 메세지 몸체에 파일 객체 첨부
			//messageBodyPart.setDataHandler(new DataHandler(source));

			// 파일 이름 설정
			//messageBodyPart.setFileName(filename);

			// 두번째 메세지 몸체 추가
			multipart.addBodyPart(messageBodyPart);

			// Multipart 객체를 Message 객체에 추가
			message.setContent(multipart);

			// 보낸 날짜 설정..ㅡ0ㅡ;; 이거빠지니깐 에러나는데..ㅠㅠ
			message.setSentDate(new Date());

			// 생성된 메세지 전송
			Transport.send(message);
			System.out.println("메일을 보냈다.");
		} catch (javax.mail.MessagingException ex) {
			ex.printStackTrace();
		}
	}
}

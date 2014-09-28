package mail;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class HtmlTransfer {

	private String from;
	private String to;
	private String filename;

	public HtmlTransfer(String from, String to, String filename) {
		this.from = from;
		this.to = to;
		this.filename = filename;
	}

	public void mailSend() {
		if (from == null || to == null || filename == null) {
			System.out.println("usage : java <from> <to> <filename>");
			System.exit(0);
		}

		try {
			// 시스템 속성 객체 생성
			Properties props = System.getProperties();

			// POP3 메일 서버 속성 설정
			props.put("mail.smtp.host", "127.0.0.1");

			// 메일 서버 세션 생성
			Session session = Session.getInstance(props, null);

			// 메세지 정의
			Message message = new MimeMessage(session);

			// 메일 헤더 설정
			message.setSubject("저의 가족입니다.");
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(
					to));

			// 메세지 몸체 생성
			BodyPart messageBodyPart = new MimeBodyPart();

			// HTML 데이터 생성
			String htmlText = "<H3>안녕 우리 가족이야<H3>"
					+ "<img src = \"cid:family\">";

			// 메세지 데이터 MIME 형식 설정

			// 단순히 텍스트로만 발송할경우에는 text/html 대신에 text/plain으로 바꾸시면 됩니다.
			messageBodyPart.setContent(htmlText, "text/html; charset=euc-kr");

			// 다양한 종류의 데이터 추가를 위한 객체 생성
			MimeMultipart multipart = new MimeMultipart("related");

			// 메세지 몸체를 Multipart 객체에 추가
			multipart.addBodyPart(messageBodyPart);

			// 이미지 메세지 몸체 생성
			messageBodyPart = new MimeBodyPart();

			// 메세지 몸체에 이미지 첨부
			DataSource fds = new FileDataSource(filename);

			// 메세지 몸체에 파일 객체 첨부
			messageBodyPart.setDataHandler(new DataHandler(fds));

			// 파일 이름 설정
			messageBodyPart.setFileName(filename);

			// 메일 헤더 설정
			messageBodyPart.setHeader("Content-ID", "family");

			// 메세지 몸체를 Multipart 객체에 추가
			multipart.addBodyPart(messageBodyPart);

			// Multipart 객체를 Message 객체에 추가
			message.setContent(multipart);

			// 보낸 날짜 설정..ㅡ0ㅡ;; 이거빠지니깐 에러나는데..ㅠㅠ
			message.setSentDate(new Date());

			// 생성된 메세지 전송
			Transport.send(message);
		} catch (javax.mail.MessagingException ex) {
			ex.printStackTrace();
		}
	}
}

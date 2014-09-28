package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import model.JoinRequest;


public class JoinValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		return JoinRequest.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userID", 		"required", new Object[] {"아이디"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "preResident", 	"required", new Object[] {"주민번호'앞'자리"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tailResident", 	"required", new Object[] {"주민번호 '뒷'자리"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPW", 		"required", new Object[] {"패스워드"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPWCheck", 	"required", new Object[] {"확인패스워드"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", 		"required", new Object[] {"사용자이름"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "preEmail", 		"required", new Object[] {"이메일'앞'자리"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tailEmail", 		"required", new Object[] {"이메일'뒷'자리"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cellNumber",		"required", new Object[] {"핸드폰번호"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "preAddress", 	"required", new Object[] {"기본주소"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tailAddress", 	"required", new Object[] {"상세주소"});
		
		JoinRequest jr = (JoinRequest) target;
		
		if(errors.getFieldError("userID") != null){
			if(jr.getUserID().length() <8){
				errors.rejectValue("userID", "denied.userId");
			}
		}
		
		if(errors.hasFieldErrors("userPW")){
			
		} else if (jr.getUserPW().length() < 8){
			errors.rejectValue("userPW", "denied.userPW");
		} else if (!(jr.getUserPW().equals(jr.getUserPWCheck()))){
			errors.rejectValue("userPWCheck", "denied.userPWCheck");
		}
		
	}
}
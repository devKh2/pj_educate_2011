package validator;



import model.EBBS_Article;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class EBBS_Validator implements Validator{
	public boolean supports(Class<?> clazz) {
		return EBBS_Article.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate 실행");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ebbs_score", "required", new Object[] {"점수"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ebbs_title", "required", new Object[] {"타이틀"});
		System.out.println("validate 완료");
		
	}
}

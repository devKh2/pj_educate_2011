package validator;

import model.SBBS_Article;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class SBBS_Validator implements Validator{
	public boolean supports(Class<?> clazz) {
		return SBBS_Article.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate 실행");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sbbs_content", "required", new Object[] {"콘텐츠"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sbbs_title", "required", new Object[] {"타이틀"});
		System.out.println("validate 완료");
		
	}
}

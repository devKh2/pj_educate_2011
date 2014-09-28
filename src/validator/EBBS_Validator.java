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
		System.out.println("validate ����");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ebbs_score", "required", new Object[] {"����"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ebbs_title", "required", new Object[] {"Ÿ��Ʋ"});
		System.out.println("validate �Ϸ�");
		
	}
}

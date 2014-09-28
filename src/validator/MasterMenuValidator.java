package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import model.MenuModel;


public class MasterMenuValidator implements Validator{
	public boolean supports(Class<?> clazz) {
		return MenuModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate ½ÇÇà");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "menu_name", "menu");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "st_name", "menu");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "menu_price", "menu");
	}
}

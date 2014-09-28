package validator;

import model.Admin;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class AdminValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Admin.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Admin admin = (Admin)target;
		if(admin.getPw() != null){
			if(admin.getPwch() == null){
				errors.rejectValue("pwch", "pw");
			}
		}
		if(!admin.getPw().equals(admin.getPwch())){
			errors.rejectValue("pwch", "pwch");
		}
	}

}

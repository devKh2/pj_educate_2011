package validator;

import java.lang.Character.UnicodeBlock;

import model.StoreModel;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class StoreMenuValidator implements Validator{
	public boolean supports(Class<?> clazz) {
		return StoreModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		StoreModel storeModel = (StoreModel)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "st_name", "store");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "owner_id", "store");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "st_owner", "store");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "biz03", "store");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "st_post", "store");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "st_ph", "store");
		
		
		if(errors.getFieldError("biz03") == null){
			if(storeModel.getBiz_num().length() != 10){
				errors.rejectValue("biz03", "biz");
			}
			else if(biz(storeModel.getBiz_num())){
				errors.rejectValue("biz03", "biz");
			}
		}
	}
	
	private boolean biz(String biz){
		int[] temp = new int[10];
		temp[0] = Integer.parseInt(biz.substring(0, 1)) * 1;
		temp[1] = Integer.parseInt(biz.substring(1, 2)) * 3;
		temp[2] = Integer.parseInt(biz.substring(2, 3)) * 7;
		temp[3] = Integer.parseInt(biz.substring(3, 4)) * 1;
		temp[4] = Integer.parseInt(biz.substring(4, 5)) * 3;
		temp[5] = Integer.parseInt(biz.substring(5, 6)) * 7;
		temp[6] = Integer.parseInt(biz.substring(6, 7)) * 1;
		temp[7] = Integer.parseInt(biz.substring(7, 8)) * 3;
		temp[8] = Integer.parseInt(biz.substring(8, 9)) * 5;
		for(int i = 0;i<9;i++){
			temp[9] += temp[i];
		}
		temp[9] += (Integer.parseInt(biz.substring(8, 9)) * 5) / 10;
		temp[9] /= 10;
		temp[9] = 10 - temp[9];
		if(Integer.parseInt(biz.substring(9, 10)) == temp[9]){
			return false;
		}
		
		return true;
	}
	
}

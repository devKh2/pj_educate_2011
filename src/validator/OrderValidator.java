package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import model.MenuModel;
import model.OrderModel;


public class OrderValidator implements Validator{
	public boolean supports(Class<?> clazz) {
		return OrderModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		OrderModel model=(OrderModel)target;
		int size=model.getStdistance().size();
		boolean flag=true;
		System.out.println(model.getStdistance());
		System.out.println(model.getUsrdistance());
		for(int i=0;i<size;i++){
			if(Double.valueOf(model.getStdistance().get(i)) < Double.valueOf(model.getUsrdistance().get(i)))
			{
				flag=false;
			}
		}
		System.out.println("flag�� Ȯ��"+flag);
		if(!flag){
			errors.rejectValue("ordersatus","distance");
		}
		System.out.println("�ǽ�����");
		//errors.rejectValue(errors,"usrdistance", "distance", new Object[]{model.getSt_name()});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "preAddress", "Address",new Object[]{"�⺻�ּ�"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tailAddress", "Address",new Object[]{"���ּ�"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "name",new Object[]{"���ּ�"});
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userphoe", "phone");
	}
}

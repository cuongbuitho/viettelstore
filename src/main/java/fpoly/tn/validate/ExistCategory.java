package fpoly.tn.validate;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;


@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = CategoryValidator.class)
public @interface ExistCategory {
	String message() default "Danh mục không tồn tại";
	  Class<?>[] groups() default {};
	  Class<? extends Payload>[] payload() default {};
	  
	  
}

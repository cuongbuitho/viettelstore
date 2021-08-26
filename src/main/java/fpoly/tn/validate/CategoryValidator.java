package fpoly.tn.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import fpoly.tn.model.Category;
import fpoly.tn.reponesitory.CategoryReponsitory;

public class CategoryValidator implements ConstraintValidator<ExistCategory, Category> {
	@Autowired
	CategoryReponsitory categoryRepository;

	@Override
	public boolean isValid(Category category, ConstraintValidatorContext context) {
		if (categoryRepository == null)
			return true;
		if (categoryRepository.findById(category.getCategorId()).isEmpty()) {
			return false;
		}
		return true;
	}
}

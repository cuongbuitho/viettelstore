package fpoly.tn;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import fpoly.tn.iterceptor.cartIterceptor;

@Configuration
public class IterceptorCongfig implements WebMvcConfigurer{

	@Bean("localeResolver")
	public LocaleResolver getLocaleResolver() {
		CookieLocaleResolver clr = new CookieLocaleResolver();
		clr.setDefaultLocale(new Locale("vi"));
		clr.setCookiePath("/");
		clr.setCookieMaxAge(60 * 60);
		return clr;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		lci.setParamName("lang");
		registry.addInterceptor(lci);
	}
}

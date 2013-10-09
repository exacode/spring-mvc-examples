package net.exacode.springmvc;

import net.exacode.springmvc.util.iterceptor.EnvironmentInterceptor;
import net.exacode.springmvc.util.iterceptor.UrlInterceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.joda.JodaDateTimeFormatAnnotationFormatterFactory;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Main configuration of spring mvc.
 * <p>
 * It is separated from {@code TemplateEngineConfiguration}s.
 * 
 * @author mendlik
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackageClasses = WebMvcConfiguration.class)
public class WebMvcConfiguration extends WebMvcConfigurerAdapter {

	@Autowired
	private Environment environment;

	/**
	 * Represents application environment profiles.
	 * <p>
	 * It is not an {@code enum} type because it's fields are used inside
	 * {@link org.springframework.context.annotation.Profile} annotations.
	 * 
	 * @author <a href="mailto:mendelski.pawel@gmail.com">Paweł Mendelski</a>
	 * 
	 */
	public static class Profiles {
		/**
		 * Used during application development.
		 */
		public static final String DEVELOPMENT = "development";
		/**
		 * Used during testing.
		 */
		public static final String TEST = "test";
		/**
		 * Used on production environment.
		 */
		public static final String PRODUCTION = "production";
	}

	/**
	 * Creates internationalized message source.
	 * 
	 * @return internationalized message source
	 */
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:messages/messages");
		messageSource.setUseCodeAsDefaultMessage(true);
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}

	/**
	 * Creates JSR-303 validator and sets internationalized message source.
	 * 
	 * @return JSR-303 validator
	 */
	@Bean
	public LocalValidatorFactoryBean validator() {
		LocalValidatorFactoryBean validatorFactoryBean = new LocalValidatorFactoryBean();
		validatorFactoryBean.setValidationMessageSource(messageSource());
		return validatorFactoryBean;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new UrlInterceptor());
		registry.addInterceptor(new EnvironmentInterceptor(environment
				.getActiveProfiles()[0]));
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations(
				"/resources/");
	}

	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addFormatterForFieldAnnotation(new JodaDateTimeFormatAnnotationFormatterFactory());
		super.addFormatters(registry);
	}

}

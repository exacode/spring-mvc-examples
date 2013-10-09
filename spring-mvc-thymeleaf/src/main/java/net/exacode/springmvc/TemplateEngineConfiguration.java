package net.exacode.springmvc;

import java.util.HashSet;
import java.util.Set;

import net.exacode.springmvc.WebMvcConfiguration.Profiles;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import org.thymeleaf.dialect.IDialect;
import org.thymeleaf.spring3.SpringTemplateEngine;
import org.thymeleaf.spring3.dialect.SpringStandardDialect;
import org.thymeleaf.spring3.view.ThymeleafViewResolver;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

@Configuration
@Import({ TemplateEngineConfiguration.CacheableThymeleafConfiguration.class,
		TemplateEngineConfiguration.NonCacheableThymeleafConfiguration.class })
public class TemplateEngineConfiguration {

	@Bean
	public Set<IDialect> thymeleafDialects() {
		Set<IDialect> dialects = new HashSet<IDialect>();
		dialects.add(new SpringStandardDialect());
		return dialects;
	}

	@Bean
	public SpringTemplateEngine templateEngine(
			ServletContextTemplateResolver templateResolver,
			MessageSource messageSource) {
		SpringTemplateEngine engine = new SpringTemplateEngine();
		engine.setTemplateResolver(templateResolver);
		engine.setDialects(thymeleafDialects());
		return engine;
	}

	@Bean
	public ThymeleafViewResolver thymeleafViewResolver(
			SpringTemplateEngine templateEngine) {
		ThymeleafViewResolver resolver = new ThymeleafViewResolver();
		resolver.setTemplateEngine(templateEngine);
		resolver.setCharacterEncoding("UTF-8");
		return resolver;
	}

	@Configuration
	@Profile({ Profiles.PRODUCTION })
	static class CacheableThymeleafConfiguration {
		@Bean
		public ServletContextTemplateResolver templateResolver() {
			ServletContextTemplateResolver resolver = new NonCacheableThymeleafConfiguration()
					.templateResolver();
			resolver.setCacheable(true);
			return resolver;
		}
	}

	@Configuration
	@Profile({ Profiles.TEST, Profiles.DEVELOPMENT })
	static class NonCacheableThymeleafConfiguration {
		@Bean
		public ServletContextTemplateResolver templateResolver() {
			ServletContextTemplateResolver resolver = new ServletContextTemplateResolver();
			resolver.setPrefix("/WEB-INF/templates/");
			resolver.setSuffix(".html");
			resolver.setTemplateMode("HTML5");
			resolver.setCacheable(false);
			return resolver;
		}
	}

}

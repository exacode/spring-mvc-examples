package net.exacode.springmvc;

import java.io.IOException;

import net.exacode.springmvc.WebMvcConfiguration.Profiles;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

/**
 * FreeMarker Template engine configuration.
 * 
 * @see <a href="http://freemarker.org/">FreeMarker</a>
 * @author mendlik
 */
@Configuration
@Import({
		TemplateEngineConfiguration.ProductionTemplateEngineConfiguration.class,
		TemplateEngineConfiguration.DebugTemplateEngineConfiguration.class })
public class TemplateEngineConfiguration {

	/**
	 * Creates template engine configuration for debugging.
	 * <p>
	 * Provides: no cache and readable exception handler.
	 * 
	 * @author mendlik
	 * 
	 */
	@Configuration
	@Profile({ Profiles.TEST, Profiles.DEVELOPMENT })
	static class DebugTemplateEngineConfiguration {

		/**
		 * Creates {@link FreeMarkerConfigurer} that is responsible for
		 * selecting global properties for templates.
		 * 
		 * @return configured instance of {@link FreeMarkerConfigurer}
		 * @throws IOException
		 * @throws TemplateException
		 */
		@Bean
		public FreeMarkerConfigurer freeMarkerConfigurer(
				WebApplicationContext applicationContext) throws IOException,
				TemplateException {
			FreeMarkerConfigurer configurer = new FreeMarkerConfigurer();
			freemarker.template.Configuration configuration = configurer
					.createConfiguration();
			configuration.addAutoInclude("/macro/util.ftl");
			configuration.addAutoImport("layout", "/layout/layout.ftl");
			configuration.setWhitespaceStripping(true);
			configuration.setDefaultEncoding("UTF-8");
			configuration.setServletContextForTemplateLoading(
					applicationContext.getServletContext(),
					"/WEB-INF/templates/");
			configurer.setConfiguration(configuration);
			return configurer;
		}

		/**
		 * Resolves templates by their names.
		 * 
		 * @return
		 */
		@Bean
		public FreeMarkerViewResolver freeMarkerViewResolver() {
			FreeMarkerViewResolver resolver = new FreeMarkerViewResolver();
			resolver.setCache(false);
			resolver.setSuffix(".ftl");
			resolver.setContentType("text/html;charset=UTF-8");
			return resolver;
		}

	}

	/**
	 * Creates template engine configuration that is production ready.
	 * <p>
	 * Provides: cache and exception handler that redirects to error page.
	 * 
	 * @author mendlik
	 * 
	 */
	@Configuration
	@Profile({ Profiles.PRODUCTION })
	static class ProductionTemplateEngineConfiguration {
		DebugTemplateEngineConfiguration debugConfiguration = new DebugTemplateEngineConfiguration();

		@Bean
		public FreeMarkerViewResolver freeMarkerViewResolver() {
			FreeMarkerViewResolver resolver = debugConfiguration
					.freeMarkerViewResolver();
			resolver.setCache(true);
			return resolver;
		}

		@Bean
		public FreeMarkerConfigurer freeMarkerConfigurer(
				WebApplicationContext applicationContext) throws IOException,
				TemplateException {
			FreeMarkerConfigurer configurer = debugConfiguration
					.freeMarkerConfigurer(applicationContext);
			configurer.getConfiguration().setTemplateExceptionHandler(
					TemplateExceptionHandler.RETHROW_HANDLER);
			return configurer;
		}

	}
}
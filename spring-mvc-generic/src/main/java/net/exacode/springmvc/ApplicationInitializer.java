package net.exacode.springmvc;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.io.support.ResourcePropertySource;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextCleanupListener;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Initializes web application in Servlet 3.0+ environment. Replaces
 * {@code /WEB-INF/web.xml} file and enables programmatic and typesafe
 * configuration.
 * <p>
 * Exceptions thrown by Spring framework sometimes omit
 * {@link com.softwaremill.shop.controller.ExceptionController}. That is why ,
 * error pages are still defined in {@code /WEB-INF/web.xml} file. You can not
 * do it in a programmatic way that is clean and elegant.
 * 
 * 
 * @author mendlik
 */
public class ApplicationInitializer implements WebApplicationInitializer {

	private static final String ENVIRONMENT_FILE = "classpath:/environment.properties";

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void onStartup(ServletContext servletContext)
			throws ServletException {
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();

		loadEnvironmentProperties(rootContext.getEnvironment(),
				ENVIRONMENT_FILE);
		logger.info("Spring active profiles: {}", Arrays.toString(rootContext
				.getEnvironment().getActiveProfiles()));

		rootContext.register(WebMvcConfiguration.class);
		registerSpringContextLoaderListener(servletContext, rootContext);
		registerSpringDispatcherServlet(servletContext, rootContext);
		registerSpringCharacterEncodingFilter(servletContext);
		registerSpringHiddenHttpMethodFilter(servletContext);
	}

	private void loadEnvironmentProperties(
			ConfigurableEnvironment configurableEnvironment, String fileName) {
		try {
			configurableEnvironment.getPropertySources().addLast(
					new ResourcePropertySource(fileName));
		} catch (IOException e) {
			// Properties file cannot be found.
			// We cannot ignore it!
			throw new IllegalStateException(
					"Unable to load environment properties: " + fileName
							+ ". Error: " + e.getMessage());
		}
	}

	/**
	 * Registers {@link DispatcherServlet} that is responsible for dispatching
	 * {@code HTTP Requests} into appropriate {@code Controllers}.
	 * 
	 * @param servletContext
	 * @param rootContext
	 */
	private void registerSpringDispatcherServlet(ServletContext servletContext,
			AnnotationConfigWebApplicationContext rootContext) {
		ServletRegistration.Dynamic springDispatcher = servletContext
				.addServlet("springDispatcherServlet", new DispatcherServlet(
						rootContext));
		springDispatcher.setLoadOnStartup(1);
		springDispatcher.addMapping("/");
	}

	/**
	 * Registers {@link ContextLoaderListener} that is responsible for managing
	 * Spring context life cycle.
	 * 
	 * @param servletContext
	 * @param rootContext
	 */
	private void registerSpringContextLoaderListener(
			ServletContext servletContext,
			AnnotationConfigWebApplicationContext rootContext) {
		servletContext.addListener(new ContextLoaderListener(rootContext));
		servletContext.addListener(new ContextCleanupListener());
	}

	/**
	 * Registers {@link CharacterEncodingFilter} that allows one to specify a
	 * character encoding for requests. This is useful because current browsers
	 * typically do not set a character encoding even if specified in the HTML
	 * page or form.
	 * 
	 * @param servletContext
	 */
	private void registerSpringCharacterEncodingFilter(
			ServletContext servletContext) {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setForceEncoding(true);
		filter.setEncoding("UTF-8");
		FilterRegistration.Dynamic springCharacterEncodingFilter = servletContext
				.addFilter("encodingFilter", filter);
		springCharacterEncodingFilter.addMappingForUrlPatterns(null, false,
				"/*");
	}

	/**
	 * Registers {@link HiddenHttpMethodFilter} that allows one to specify a
	 * HTTP method as a hidden field ("_method") in a simple web form.
	 * 
	 * @param servletContext
	 */
	private void registerSpringHiddenHttpMethodFilter(
			ServletContext servletContext) {
		HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
		FilterRegistration.Dynamic springHiddenHttpMethodFilter = servletContext
				.addFilter("hiddenHttpMethodFilter", filter);
		springHiddenHttpMethodFilter
				.addMappingForUrlPatterns(null, false, "/*");
	}

}

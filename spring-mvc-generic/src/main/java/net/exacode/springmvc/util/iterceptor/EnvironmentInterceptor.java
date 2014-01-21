package net.exacode.springmvc.util.iterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.exacode.springmvc.WebMvcConfiguration.Profiles;

import org.springframework.web.servlet.ModelAndView;

/**
 * Injects into view context information about current environment.
 * 
 * @author mendlik
 * 
 */
public class EnvironmentInterceptor extends ModelHandlerInterceptorAdapter {

	private final String environment;

	public EnvironmentInterceptor(String environment) {
		this.environment = environment;
	}

	@Override
	public void postForwardHandleWithModel(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {
		modelAndView.getModel().put("environment", environment);
		String[] queryEnv = request.getParameterValues("env");
		if (queryEnv != null && Profiles.DEVELOPMENT.equals(environment)) {
			modelAndView.getModel().put("environment", queryEnv[0]);
		}
	}
}

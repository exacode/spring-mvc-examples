package net.exacode.springmvc.util.iterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	}
}

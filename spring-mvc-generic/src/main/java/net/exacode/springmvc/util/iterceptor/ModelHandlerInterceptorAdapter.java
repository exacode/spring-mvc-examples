package net.exacode.springmvc.util.iterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Abstract type for all spring mvc interceptors that uses model generated in
 * view.
 * 
 * @author mendlik
 * 
 */
public abstract class ModelHandlerInterceptorAdapter extends
		HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {
		if (modelAndView != null) {
			String viewName = modelAndView.getViewName();
			if (viewName != null && !viewName.startsWith("redirect")) {
				postForwardHandleWithModel(request, response, handler,
						modelAndView);
			}
		}
	}

	public abstract void postForwardHandleWithModel(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView);
}

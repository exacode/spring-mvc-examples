package net.exacode.springmvc.util.iterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

/**
 * Injects into view context an instance of {@link UrlInfo}.
 * 
 * @author mendlik
 * 
 */
public class UrlInterceptor extends ModelHandlerInterceptorAdapter {
	/**
	 * Describes requested url. Exposes multiple url parts.
	 * 
	 * @author mendlik
	 * 
	 */
	public static class UrlInfo {
		// Example url address:
		// http://localhost:8080/spring-mvc-freemarker/hello?a=b
		private String serverUrl; // http://localhost:8080
		private String contextUrl; // http://localhost:8080/spring-mvc-freemarker
		private String contextPath; // /spring-mvc-freemarker
		private String servletUrl; // http://localhost:8080/spring-mvc-freemarker/hello
		private String servletPath; // /hello
		private String query; // a=b

		public String getServerUrl() {
			return serverUrl;
		}

		public void setServerUrl(String serverUrl) {
			this.serverUrl = serverUrl;
		}

		public String getContextUrl() {
			return contextUrl;
		}

		public void setContextUrl(String contextUrl) {
			this.contextUrl = contextUrl;
		}

		public String getContextPath() {
			return contextPath;
		}

		public void setContextPath(String contextPath) {
			this.contextPath = contextPath;
		}

		public String getServletUrl() {
			return servletUrl;
		}

		public void setServletUrl(String servletUrl) {
			this.servletUrl = servletUrl;
		}

		public String getServletPath() {
			return servletPath;
		}

		public void setServletPath(String servletPath) {
			this.servletPath = servletPath;
		}

		public String getQuery() {
			return query;
		}

		public void setQuery(String query) {
			this.query = query;
		}

	}

	@Override
	public void postForwardHandleWithModel(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {

		String servletContextPath = request.getContextPath()
				+ request.getServletPath();
		String requestUrl = request.getRequestURL().toString();
		String serverUrl = requestUrl.substring(0, requestUrl.length()
				- servletContextPath.length());

		UrlInfo urlInfo = new UrlInfo();
		urlInfo.serverUrl = serverUrl;
		urlInfo.contextUrl = serverUrl + request.getContextPath();
		urlInfo.contextPath = request.getContextPath();
		urlInfo.servletUrl = request.getRequestURL().toString();
		urlInfo.servletPath = request.getServletPath();
		urlInfo.query = request.getQueryString();

		modelAndView.getModel().put("urlInfo", urlInfo);
	}

}

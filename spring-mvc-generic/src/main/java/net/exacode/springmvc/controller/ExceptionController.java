package net.exacode.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Responsible for presenting and logging error information.
 * 
 * @author <a href="mailto:mendelski.pawel@gmail.com">Paweł Mendelski</a>
 * 
 */
@Controller
public class ExceptionController {
	/** Error code model key */
	public static final String ERROR_CODE_MODEL = "errorCode";
	/** Error page template name */
	public static final String ERROR_TEMPLATE = "error";

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * Handles 500 error page defined in {@code /WEB-INF/web.xml}.
	 * <p>
	 * Catches all uncaught exceptions from Spring context.
	 * <p>
	 * Not all of the exception goes through
	 * {@link ExceptionController#serverError(Exception)} method.
	 * 
	 * @return
	 */
	@ExceptionHandler(Exception.class)
	@RequestMapping("/error/500")
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	public String internalServerError(Model model) {
		model.addAttribute(ERROR_CODE_MODEL, "500");
		return ERROR_TEMPLATE;
	}

	/**
	 * Handles 404 error page defined in {@code /WEB-INF/web.xml}.
	 * <p>
	 * Necessary when someone will try url that deosn't math
	 * {@link RequestMapping} on any of application controllers including
	 * {@link ExceptionController#pageNotFound(Model, HttpServletRequest)}. For
	 * example: /error/99999999999999999999999
	 * 
	 * @return
	 */
	@RequestMapping("/error/404")
	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public String pageNotFound(Model model) {
		model.addAttribute(ERROR_CODE_MODEL, "404");
		return ERROR_TEMPLATE;
	}

	/**
	 * When no controller can be matched, logs requested url (for SEO reasons)
	 * and presents 404 error page.
	 */
	@RequestMapping({ "{path:(?!assets|error).*$}",
			"{path:(?!assets|error).*$}/**" })
	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public String pageNotFound(Model model, HttpServletRequest request) {
		String path = request.getRequestURI().substring(
				request.getContextPath().length());
		logger.warn("PageNotFound. Could not find mapping for: {}", path);
		model.addAttribute(ERROR_CODE_MODEL, "404");
		return ERROR_TEMPLATE;
	}

}
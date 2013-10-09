package net.exacode.springmvc.controller.register;

import javax.validation.Valid;

import net.exacode.springmvc.util.Alerts;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Registration view controller.
 * 
 * @author mendlik
 * 
 */
@Controller
public class RegistrationController {

	@RequestMapping("/register")
	public String login(ModelMap model) {
		if (!model.containsAttribute(RegistrationFormModel.NAME)) {
			model.addAttribute(RegistrationFormModel.NAME,
					new RegistrationFormModel());
		}
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerForm(
			@Valid @ModelAttribute(RegistrationFormModel.NAME) RegistrationFormModel registrationForm,
			final BindingResult errors, ModelMap model,
			RedirectAttributes redirectAttributes) {
		if (!isRegistrationFormValid(registrationForm, errors,
				redirectAttributes)) {
			return "redirect:/register";
		}
		// securityService
		// .logUserIn(formModel.getEmail(), formModel.getPassword());
		redirectAttributes.addFlashAttribute(RegistrationFormModel.NAME,
				registrationForm);
		Alerts.create().addSuccess("registration.form.success")
				.embed(redirectAttributes);
		return "redirect:/register";
	}

	private boolean isRegistrationFormValid(
			RegistrationFormModel registrationForm, BindingResult errors,
			RedirectAttributes redirectAttributes) {
		boolean valid = true;
		if (errors.hasErrors()) {
			// Handles JSR-303 validation errors
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX
					+ RegistrationFormModel.NAME, errors);
			valid = false;
		}
		if (registrationForm.getEmail().equals("john@gmail.com")) {
			errors.addError(new FieldError(RegistrationFormModel.NAME, "email",
					"registration.email.illegal"));
			valid = false;
		}
		if (!registrationForm.getRepeatedPassword().equals(
				registrationForm.getPassword())) {
			errors.addError(new FieldError(RegistrationFormModel.NAME,
					"repeatedPassword", "registration.repeatedPassword.error"));
			valid = false;
		}
		if (!valid) {
			// send back the form model
			registrationForm.resetPassword();
			Alerts.create()
					.addError("registration.form.error.provideCorrectInfo")
					.embed(redirectAttributes);
			redirectAttributes.addFlashAttribute(RegistrationFormModel.NAME,
					registrationForm);
		}
		return valid;
	}
}

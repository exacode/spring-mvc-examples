package net.exacode.springmvc.controller.register;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Registration form model.
 * 
 * @author mendlik
 * 
 */
public class RegistrationFormModel {

	/**
	 * Describes model name under which this model is available in the view.
	 */
	public static final String NAME = "registrationForm";

	@NotEmpty
	@Email
	private String email;

	@NotEmpty
	@Length(min = 5, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String password;

	@NotEmpty
	@Length(min = 5, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String repeatedPassword;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepeatedPassword() {
		return repeatedPassword;
	}

	public void setRepeatedPassword(String repeatedPassword) {
		this.repeatedPassword = repeatedPassword;
	}

	public void resetPassword() {
		repeatedPassword = null;
		password = null;
	}

}

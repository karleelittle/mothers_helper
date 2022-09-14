package com.mothershelper.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
	@NotEmpty(message="Email is required to login!")
	@Email(message="Please enter a valid email address!")
	private String email;
	
	@NotEmpty(message="Password is required to login!")
	@Size(min=8, max=21, message="Password must be minimum 8 characters!" )
	private String password;
	
	public LoginUser() {}
	
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
}


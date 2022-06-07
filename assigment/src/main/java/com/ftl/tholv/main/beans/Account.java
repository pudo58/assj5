package com.ftl.tholv.main.beans;



import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Account {
	private Integer id;
	@NotBlank(message = "Username cannot be null ")
	private String username;
	@NotBlank(message = "Password cannot be null ")
	private String password;
	@NotBlank(message = "Full cannot be null ")
	private String fullname;
	@NotBlank(message = "Email cannot be null ")
	private String email;
	@NotBlank(message = "photo cannot be null ")
	private String photo;
	private Integer activated;
	private Integer admin;
}

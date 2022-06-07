package com.ftl.tholv.main.beans;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.ftl.tholv.main.entities.Account;

import lombok.Data;
@Data
public class Order {
	private Integer id;
	
	@NotNull(message = "Username cannot be null ")
	private Account user;

	@NotBlank(message = "Createdate cannot be null ")
	private String createdDate;
	@NotBlank(message = "Address cannot be null ")
	private String address;

}

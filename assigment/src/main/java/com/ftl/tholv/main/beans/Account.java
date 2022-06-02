package com.ftl.tholv.main.beans;

import lombok.Data;

@Data
public class Account {
	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String photo;
	private Integer activated;
	private Integer admin;
}

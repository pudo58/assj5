package com.ftl.tholv.main.beans;

import com.ftl.tholv.main.entities.Account;

import lombok.Data;
@Data
public class Order {
	private Integer id;
	
	private Account user;

	private String createdDate;

	private String address;
}

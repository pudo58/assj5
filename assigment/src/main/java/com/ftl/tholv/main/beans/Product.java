package com.ftl.tholv.main.beans;


import com.ftl.tholv.main.entities.Category;

import lombok.Data;

@Data
public class Product {
	private Integer id;
	
	private String name;
	
	private String image;
	
	private double price;
	
	private String createdDate;
	
	private Integer available;

	private Category category;
}

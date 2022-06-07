package com.ftl.tholv.main.beans;


import javax.validation.constraints.NotNull;


import org.hibernate.validator.constraints.NotBlank;

import com.ftl.tholv.main.entities.Category;

import lombok.Data;

@Data
public class Product {
	private Integer id;
	
	@NotBlank(message = "Name cannot be null ")
	private String name;
	
	@NotBlank(message = "Image cannot be null ")
	private String image;
	
	@NotNull(message = "price cannot be null ")
	private Double price;
	
	@NotBlank(message = "createdate cannot be null ")
	private String createdDate;
	
	@NotNull(message = "available cannot be null ")
	private Integer available;

	private Category category;
}

package com.ftl.tholv.main.beans;

import javax.validation.constraints.NotNull;

import com.ftl.tholv.main.entities.Order;
import com.ftl.tholv.main.entities.Product;

import lombok.Data;

@Data
public class OrderDetail {
	private Integer id;
	@NotNull(message = "Field cannot be null")
	private Order order;
	@NotNull(message = "Field cannot be null")
	private Product product;
	@NotNull(message = "Field cannot be null")
	private Double price;
	@NotNull(message = "Field cannot be null")
	private Integer quantity;
}

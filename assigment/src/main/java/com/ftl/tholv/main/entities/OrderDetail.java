package com.ftl.tholv.main.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="orderdetails")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;

	@ManyToOne
	@JoinColumn(name="orderid")
	private Order order;

	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	@Column(name="price")
	private Double price;

	@Column(name="quantity")
	private Integer quantity;
}

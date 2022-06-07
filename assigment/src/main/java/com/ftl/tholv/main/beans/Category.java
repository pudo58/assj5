package com.ftl.tholv.main.beans;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Category {
Integer id;
@NotBlank(message = "Name cannot be null ")
String name;
}

package com.ftl.tholv.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ftl.tholv.main.entities.Product;

public interface ProductDao extends JpaRepository<Product, Integer>{

}

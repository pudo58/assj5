package com.ftl.tholv.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ftl.tholv.main.entities.Order;

public interface OrderDao extends JpaRepository<Order, Integer> {

}

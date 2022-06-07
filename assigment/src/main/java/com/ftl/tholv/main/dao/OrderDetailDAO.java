package com.ftl.tholv.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ftl.tholv.main.entities.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

}

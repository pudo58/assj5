package com.ftl.tholv.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ftl.tholv.main.entities.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer>{

}

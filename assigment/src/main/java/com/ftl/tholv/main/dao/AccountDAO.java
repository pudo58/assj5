package com.ftl.tholv.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ftl.tholv.main.entities.Account;

public interface AccountDAO extends JpaRepository<Account, Integer> {

}

package com.ftl.tholv.main.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ftl.tholv.main.dao.AccountDAO;
import com.ftl.tholv.main.entities.Account;
import com.ftl.tholv.main.entities.Category;

@Controller
public class AccountController {
	@Autowired
	AccountDAO accDao;
	
	@GetMapping("/admin/account/reg")
	public String get(@ModelAttribute("account") com.ftl.tholv.main.beans.Account acc) {
		   return "account/create";
	}
@PostMapping("/admin/account/reg")
	public String create(@ModelAttribute("account") com.ftl.tholv.main.beans.Account acc) {
	  Account account=new Account();
	 account.setId(acc.getId());
	 account.setUsername(acc.getUsername());
	 account.setPassword(acc.getPassword());
	 account.setFullname(acc.getFullname());
	 account.setEmail(acc.getEmail());
	 account.setPhoto(acc.getPhoto());
	 account.setActivated(0);
	 account.setAdmin(acc.getAdmin());
	accDao.save(account);
	   return "account/create";
	}
@RequestMapping("/admin/account/delete")
public String delete(HttpServletRequest req) {
	Integer id=Integer.parseInt(req.getParameter("user"));
	Account account =accDao.getById(id);
	accDao.delete(account);
	return "account/list";
}
@GetMapping("/account/detail/all")
public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p) {
	Pageable page=PageRequest.of(p.orElse(0),10);
	Page<Account> list=accDao.findAll(page);
   model.addAttribute("page",list);
	return "account/list";
}
@PostMapping("/account/detail/all")
public String update(com.ftl.tholv.main.beans.Account acc) {
	Account account=accDao.getById(acc.getId());
	account.setId(acc.getId());
	account.setUsername(acc.getUsername());
	account.setPhoto(acc.getPhoto());
	account.setPassword(acc.getPassword());
	account.setFullname(acc.getFullname());
	accDao.save(account);
	return "account/list";
}
}

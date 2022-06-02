package com.ftl.tholv.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ftl.tholv.main.dao.AccountDAO;
import com.ftl.tholv.main.dao.OrderDao;
import com.ftl.tholv.main.entities.Account;
import com.ftl.tholv.main.entities.Order;

@Controller
public class OrderController {
@Autowired
OrderDao od;

@Autowired
AccountDAO acc;
	@ModelAttribute("acc")
	public List<Account> getall(){
		List<Account> list=acc.findAll();
		return list;
	}
	@GetMapping("/order/create")
	public String get1(@ModelAttribute("order")com.ftl.tholv.main.beans.Order or) {
		return "order/create";
	}
	@PostMapping("/order/create")
	public String getForm(@ModelAttribute("order")com.ftl.tholv.main.beans.Order or) throws ParseException {
		SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
		Order o=new Order();
		o.setId(or.getId());
		o.setCreatedDate(s.parse(or.getCreatedDate()));
		o.setAddress(or.getAddress());
		o.setUser(or.getUser());
		od.save(o);
		return "order/create";
	}
	@GetMapping("/order/list")
	public String getAll() {
		return "order/list";
	}
	@RequestMapping("/order/delete")
	public String delete(HttpServletRequest req) {
		Integer id=Integer.parseInt(req.getParameter("id"));
		Order o=od.getById(id);
		od.delete(o);
		return "order/list";
	}
	@ModelAttribute("list")
	public List<Order>getLisst(){
		return od.findAll();
	}
}

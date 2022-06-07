package com.ftl.tholv.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String getForm(@Validated@ModelAttribute("order")com.ftl.tholv.main.beans.Order or,BindingResult br) throws ParseException {
		
		if(!br.hasErrors()) {
			SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
			Order o=new Order();
			o.setId(or.getId());
			
			o.setAddress(or.getAddress());
			o.setUser(or.getUser());
			o.setCreatedDate(s.parse(or.getCreatedDate()));
			od.save(o);
			return "redirect:/order/list";
		}
		return "order/create";
		
		
	}
	@RequestMapping("/order/delete")
	public String delete(HttpServletRequest req) {
		Integer id=Integer.parseInt(req.getParameter("id"));
		Order o=od.getById(id);
		od.delete(o);
		return "redirect:/order/list";
	}
	@ModelAttribute("list")
	public List<Order>getLisst(){
		return od.findAll();
	}
	@RequestMapping("/order/update")
	public String update(com.ftl.tholv.main.beans.Order or) throws Exception{
		
		SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
		Order order=od.getById(or.getId());
		order.setAddress(or.getAddress());
		order.setCreatedDate(fm.parse(or.getCreatedDate()));
		order.setUser(or.getUser());
		od.save(order);
		return  "redirect:/order/list";
	}	
	@GetMapping("/order/list")
	public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p) {
		Pageable page=PageRequest.of(p.orElse(0),20);
		Page<Order> list=od.findAll(page);
	   model.addAttribute("page",list);
		return "order/list";
	}
}

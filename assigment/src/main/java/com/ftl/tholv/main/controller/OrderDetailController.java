package com.ftl.tholv.main.controller;

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

import com.ftl.tholv.main.beans.Order;
import com.ftl.tholv.main.dao.OrderDao;
import com.ftl.tholv.main.dao.OrderDetailDAO;
import com.ftl.tholv.main.dao.ProductDao;
import com.ftl.tholv.main.entities.OrderDetail;

@Controller
public class OrderDetailController {
	@Autowired
	OrderDetailDAO odd;
	
	@Autowired
	ProductDao pd;
	
	@Autowired
	OrderDao od;
	
	@GetMapping("/order-detail/create")
public String getForm(@ModelAttribute("orderDetail")com.ftl.tholv.main.beans.OrderDetail order) {
	return "orderdetail/create";
}
	@PostMapping("/order-detail/create")
	public String getForm1(@Validated@ModelAttribute("orderDetail")com.ftl.tholv.main.beans.OrderDetail order,BindingResult br) {
		if(!br.hasErrors()){
			OrderDetail od=new OrderDetail();
			od.setId(order.getId());
			od.setOrder(order.getOrder());
			od.setPrice(order.getPrice());
			od.setProduct(order.getProduct());
			od.setQuantity(order.getQuantity());
			odd.save(od);
			return "redirect:/order-detail/list";
		}
		return "orderdetail/create";
	}
	@GetMapping("/order-detail/list")
	public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p) {
		Pageable page=PageRequest.of(p.orElse(0),20);
		Page<com.ftl.tholv.main.entities.OrderDetail> list=odd.findAll(page);
	   model.addAttribute("page",list);
		return "orderdetail/list";
	}
	@ModelAttribute("list")
	public List<com.ftl.tholv.main.entities.Order >getAll(){
		return  od.findAll();
	}
	@ModelAttribute("listProduct")
	public List<com.ftl.tholv.main.entities.Product >getAllProduct(){
		return  pd.findAll();
	}
	@RequestMapping("/order-detail/delete")
	public String delete(HttpServletRequest req) {
		OrderDetail od=odd.getById(Integer.parseInt(req.getParameter("id")));
		odd.delete(od);
		return "redirect:/order-detail/list";
	}
	@RequestMapping("/order-detail/update")
	public String delete(com.ftl.tholv.main.beans.OrderDetail order) {
		OrderDetail od=odd.getById(order.getId());
		od.setOrder(order.getOrder());
		od.setPrice(order.getPrice());
		od.setProduct(order.getProduct());
		od.setQuantity(order.getQuantity());
		odd.save(od);
		return "redirect:/order-detail/list";
	}
}

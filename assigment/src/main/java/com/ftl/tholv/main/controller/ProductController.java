package com.ftl.tholv.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ftl.tholv.main.beans.Product;
import com.ftl.tholv.main.dao.CategoryDAO;
import com.ftl.tholv.main.dao.ProductDao;



@Controller
public class ProductController {
	@Autowired
	ProductDao pDao;
	@Autowired
	CategoryDAO cDao ;
	
	@GetMapping("/products/add")
	public String getform(@ModelAttribute("product")Product p) {
		return "products/add";
	}
	@PostMapping("products/add")
	public String create(Product p,HttpServletRequest req) throws ParseException {
		SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
		com.ftl.tholv.main.entities.Product p1 = new com.ftl.tholv.main.entities.Product();
		p1.setId(p.getId());
		p1.setName(p.getName());
		p1.setImage(p.getImage());
		p1.setPrice(p.getPrice());
		p1.setCreatedDate(fm.parse(p.getCreatedDate()));
		p1.setAvailable(p.getAvailable());
		p1.setCategory(p.getCategory());
		pDao.save(p1);
		return "products/add";
	}
	
	@RequestMapping("products/update")
	public String update(Product p) throws ParseException {
		SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
		com.ftl.tholv.main.entities.Product  p1 = pDao.getById(p.getId());
		p1.setName(p.getName());
		p1.setImage(p.getImage());
		p1.setPrice(p.getPrice());
		p1.setCreatedDate(fm.parse(p.getCreatedDate()));
		p1.setAvailable(p.getAvailable());
		p1.setCategory(p.getCategory());

		return "products/list";
	}
	
	@RequestMapping("products/delete")
	public String delete(HttpServletRequest req) {
		int id=Integer.parseInt(req.getParameter("id"));
		com.ftl.tholv.main.entities.Product c1 =pDao.getById(id);
		pDao.delete(c1);
		return "products/list";
	}

	@ModelAttribute("list")
	public List<com.ftl.tholv.main.entities.Product >getAll(){
		return  pDao.findAll();
	}
	
	@GetMapping("/products/list")
	public String list() {
		return "products/list";
	}
	@ModelAttribute("category")
	public List<Integer> getAl1l(){
	List<Integer> list=new ArrayList<Integer>();
	for(com.ftl.tholv.main.entities.Category x : cDao.findAll()) {
		list.add(x.getId());
	}
	return list;
		
	}
	
}
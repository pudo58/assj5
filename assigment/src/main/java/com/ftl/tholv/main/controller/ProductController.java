package com.ftl.tholv.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.ftl.tholv.main.beans.Product;
import com.ftl.tholv.main.dao.CategoryDAO;
import com.ftl.tholv.main.dao.ProductDao;
import com.ftl.tholv.main.entities.Account;



@Controller
public class ProductController {
	@Autowired
	ProductDao pDao;
	@Autowired
	CategoryDAO cDao ;
	
	@GetMapping("/products/add")
	public String getform() {
		return "product/create";
	}
	@PostMapping("/products/add")
	public String create(@Validated@ModelAttribute("product")Product p,BindingResult br) throws ParseException {
		if(!br.hasErrors()) {
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
			return "redirect:/products/list";
		}
		return "product/create";
		
	}
	
	@RequestMapping("/products/update")
	public String update(Product p) throws ParseException {
		SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
		com.ftl.tholv.main.entities.Product  p1 = pDao.getById(p.getId());
		p1.setName(p.getName());
		p1.setImage(p.getImage());
		p1.setPrice(p.getPrice());
		p1.setCreatedDate(fm.parse(p.getCreatedDate()));
		p1.setAvailable(p.getAvailable());
		p1.setCategory(p.getCategory());
         pDao.save(p1);
		return "redirect:/products/list";
	}
	
	@RequestMapping("product/delete")
	public String delete(HttpServletRequest req) {
		int id=Integer.parseInt(req.getParameter("id"));
		com.ftl.tholv.main.entities.Product c1 =pDao.getById(id);
		pDao.delete(c1);
		return "redirect:/products/list";
	}

	@ModelAttribute("list")
	public List<com.ftl.tholv.main.entities.Product >getAll(){
		return  pDao.findAll();
	}
	
	@GetMapping("/products/list")
	public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p) {
		Pageable page=PageRequest.of(p.orElse(0),20);
		Page<com.ftl.tholv.main.entities.Product> list=pDao.findAll(page);
	   model.addAttribute("page",list);
		return "product/list";
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
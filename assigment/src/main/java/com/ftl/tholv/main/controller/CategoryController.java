package com.ftl.tholv.main.controller;

import java.util.Optional;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
//import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
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
import com.ftl.tholv.main.dao.CategoryDAO;
import com.ftl.tholv.main.entities.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO c;
	
	@GetMapping("/admin/category/create")
	public String get(@ModelAttribute("category")com.ftl.tholv.main.beans.Category category) {
		return "category/create";
	}
@PostMapping("/admin/category/create")
public String create(@Validated@ModelAttribute("category")com.ftl.tholv.main.beans.Category category,BindingResult rs) {
	synchronized (Category.class) {
	
		try {
			if(!rs.hasErrors()) {
				Category s=new Category();
				s.setId(category.getId());
				s.setName(category.getName());
				c.saveAndFlush(s);
				return "redirect:/category/list/all";
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	return "category/create";
}
@GetMapping("/category/list/all")
public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p) {
	Pageable page=PageRequest.of(p.orElse(0),10);
	Page<Category> list=c.findAll(page);
   model.addAttribute("page",list);
	return "category/list";
}
@PostMapping("/category/update")
public String update(com.ftl.tholv.main.beans.Category category)
{
	Category ca=c.getById(category.getId());
	 ca.setName(category.getName());	
		c.save(ca);
	return "redirect:/category/list/all";
}

@RequestMapping("/category/delete")
public String delete(HttpServletRequest req) {
	Integer id=Integer.parseInt(req.getParameter("id"));
	c.delete(c.getOne(id));
	return "redirect:/category/list/all";
	
}
}

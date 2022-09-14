package com.mothershelper.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import com.mothershelper.models.Grocery;
import com.mothershelper.models.LoginUser;
import com.mothershelper.models.User;
import com.mothershelper.services.GroceryService;
import com.mothershelper.services.UserService;



@Controller
public class GroceryController {
	@Autowired
	private UserService users;
	@Autowired
	private GroceryService grocerys;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		
		User user =users.register(newUser, result);
		
		if(result.hasErrors()) {
			//Be sure to send in the empty LoginUser before re-rendering the page
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/home";
	}
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
			
		User user = users.login(newLogin, result);
		
		if(result.hasErrors() || user==null) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return"redirect:/home";
	}
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
	

		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("grocerys", grocerys.all());
		model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
		return "home.jsp";
		
	}
	@GetMapping("/addPage")public String addPage(@ModelAttribute("grocery")Grocery grocery, Model model, HttpSession session) {
		
		User user = users.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		
		return "addPage.jsp";
	}
	
	@PostMapping("/grocerys")
	public String createGrocery(@Valid @ModelAttribute("grocery") Grocery grocery, BindingResult result) {
		if (result.hasErrors()) {
			return "addPage.jsp";
		}
		grocerys.create(grocery);
		return "redirect:/home";
	}
	
	@GetMapping("/grocerys/{id}/edit")
	public String editPage(Model model, @PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Grocery grocery = grocerys.findById(id);
		model.addAttribute("grocery", grocery);
		return "editPage.jsp";
	}
	
	@GetMapping("/grocerys/{id}")
	public String view(Model model, @PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Grocery grocery = grocerys.findById(id);
		model.addAttribute("grocery", grocery);
		model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
		
		return "view.jsp";
	}
	@DeleteMapping("/grocerys/{id}")
	public String delete(@PathVariable("id") Long id) {
		
		grocerys.delete(id);
		
		return "redirect:/home";
	}
	@PutMapping("/grocerys/{id}")
	public String updateGrocery(@Valid @ModelAttribute("grocery") Grocery grocery, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "editPage.jsp";
		}
		
		System.out.println("Show to be saved to DB:" + grocery.getId());
		grocerys.update(grocery);
		return "redirect:/home";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//Set userID to null and redirect to login register page
		session.setAttribute("userId", null);
			
			return "redirect:/";
	}
}

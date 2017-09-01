package com.nikita.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nikita.project.dao.UserDAO;
import com.nikita.project.pojo.User;

@Controller
@RequestMapping("/login1.htm")
public class LoginController {
	
	@Autowired
	@Qualifier("loginValidator")
	LoginValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(method = RequestMethod.POST)
	protected String doSubmitAction(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user") User user,BindingResult result) throws Exception {
		
		validator.validate(user, result);
		if (result.hasErrors()) {
			return "Login";
		}
		String type = null;
		
		System.out.print("test");
		String userName=user.getUserName();
		String password=user.getPassword();
		
		UserDAO userDao = new UserDAO();
		System.out.print("test1");
		System.out.println("username = "+user.getUserName()+",password = "+user.getPassword()+"----------*********************");
		User us = userDao.getUserEntry(userName,password);
		type = us.getUserType();

		
		if(type.equalsIgnoreCase("manager")){
			request.setAttribute("name",user.getUserName());
			return "Index2";
		}
		
		else if(type.equalsIgnoreCase("person")){
			
			request.setAttribute("name",user.getUserName());
			return "Index3";
		}


		return "Login";
	}
	

	@RequestMapping(method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("user") User user) {
		return "Login";
	}
}
package com.nikita.project;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nikita.project.dao.UserDAO;
import com.nikita.project.exception.AdException;
import com.nikita.project.pojo.User;

@Controller
@RequestMapping("/successReg.htm")
public class SuccessRegController {
	@RequestMapping(method = RequestMethod.POST)
	protected String doSubmitAction(@ModelAttribute("user") User user,BindingResult result) throws Exception {
		
		System.out.print("test");
		UserDAO userDao = new UserDAO();
		System.out.print("test1");		
		return "SuccessReg";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("user") User user) {
	
		return "Login";
	}
}

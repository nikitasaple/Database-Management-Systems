package com.nikita.project;

import java.io.File;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nikita.project.dao.UserDAO;
import com.nikita.project.pojo.Person;

@Controller
@RequestMapping("/personReg.htm")
public class PersonRegController {

	private static final Logger log1 = Logger.getAnonymousLogger();
    

	@Autowired
	@Qualifier("userValidator")
	UserValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
        
	@RequestMapping(method = RequestMethod.POST)
	protected String doSubmitAction(@ModelAttribute("person") Person user, BindingResult result) throws Exception {
		validator.validate(user, result);
		if (result.hasErrors()) {
			return "PersonRegister";
		}

		
			System.out.println("test");
			UserDAO userDao = new UserDAO();
			System.out.print("test1");
			userDao.createIns(user.getUserName(), user.getPassword(), user.getEmail(), user.getFirstName(), user.getLastName(), user.getPhone(), user.getGender(),"person");
			
			// DAO.close();
		
		return "SuccessReg";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("person") Person person) {
		

		return "PersonRegister";
	}
}
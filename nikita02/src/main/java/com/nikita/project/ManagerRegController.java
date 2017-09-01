package com.nikita.project;

	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nikita.project.dao.UserDAO;
import com.nikita.project.pojo.Manager;

	@Controller
	@RequestMapping("/managerReg.htm")
	public class ManagerRegController {


		@Autowired
		@Qualifier("managerValidator")
		ManagerValidator validator;

		@InitBinder
		private void initBinder(WebDataBinder binder) {
			binder.setValidator(validator);
		}

		@RequestMapping(method = RequestMethod.POST)
		protected String doSubmitAction(@ModelAttribute("manager") Manager manager,BindingResult result) throws Exception {
			validator.validate(manager, result);
			if (result.hasErrors()) {
			return "ManagerRegister";
			}
	
			
				System.out.print("test");
				UserDAO userDao = new UserDAO();
				System.out.print("test1");
				userDao.createCust(manager.getUserName(), manager.getPassword(), manager.getEmail(), manager.getFirstName(), manager.getLastName(), manager.getPhone(), manager.getGender(),"manager");
				
				//DAO.close();
			

			return "SuccessReg";
		}

		@RequestMapping(method = RequestMethod.GET)
		public String initializeForm(@ModelAttribute("manager") Manager manager) {
			
			

			return "ManagerRegister";
		}
	}
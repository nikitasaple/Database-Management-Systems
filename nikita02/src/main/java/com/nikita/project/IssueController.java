package com.nikita.project;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nikita.project.dao.IssueDAO;
import com.nikita.project.exception.AdException;
import com.nikita.project.pojo.Issuev;
	
	
	@Controller
	@RequestMapping("/addIssue.htm")
	public class IssueController {
	/*    @Autowired
	    @Qualifier("issueValidator")
	    IssueValidator validator;
	    
	    @InitBinder
	    private void initBinder(WebDataBinder binder) {
	        binder.setValidator(validator);
	    } */
	    
	    @RequestMapping(method = RequestMethod.GET)
	    public String initializeForm(@ModelAttribute("issue") Issuev issue, BindingResult result) {        return "addIssueForm";
	    }
	    
	    @RequestMapping(method = RequestMethod.POST)
	    public String doSubmitAction(@ModelAttribute("issue") Issuev issue, BindingResult result) {    /*    validator.validate(issue, result);
	        if (result.hasErrors()) {
	            return "addUserForm";
	        }  */
	        try {
	            System.out.print("test");
	            IssueDAO issueDAO = new IssueDAO();
	            System.out.print("test1");
	            //userDao.validate(user.getName(), user.getPassword());
	            
	            issueDAO.create(issue);
	            
	            // DAO.close();
	        } catch (AdException e) {
	            System.out.println("Exception: " + e.getMessage());
	        }
	        return "loginIssue";
	    }
	}




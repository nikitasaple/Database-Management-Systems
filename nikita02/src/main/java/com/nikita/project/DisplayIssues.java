package com.nikita.project;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nikita.project.dao.IssuesDAO;
import com.nikita.project.exception.AdException;
import com.nikita.project.pojo.Issues;


@Controller
@RequestMapping("/displayissues.htm")
public class DisplayIssues {

	@RequestMapping(method=RequestMethod.GET)
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		HttpSession session=request.getSession();
		
		IssuesDAO issuesDAO = new IssuesDAO();
        List insList = new ArrayList();
	
        try {
            insList = issuesDAO.listOfPostedIssues();

            Iterator iterator = insList.iterator();

            while (iterator.hasNext())
            {
            		Issues instruct = (Issues) iterator.next();
                    insList.add(instruct);
                }
            
        } catch (AdException e) {
            System.out.println(e.getMessage());
        }
        if(session.getAttribute("manager") != null){
			ModelAndView mav = new ModelAndView("Learn2", "instruction", insList);
	        return mav;
		}
		else{
			ModelAndView mav = new ModelAndView("Learn", "instruction", insList);
	        return mav;
		}
    }
}

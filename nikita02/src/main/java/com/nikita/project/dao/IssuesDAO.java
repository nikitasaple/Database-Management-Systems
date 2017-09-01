
package com.nikita.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.nikita.project.exception.AdException;
import com.nikita.project.pojo.Issues;

public class IssuesDAO  extends DAO{
	
	public Issues postInstruction(String description,String title, String username) throws AdException{
		try{
			begin();
			
			Issues md = new Issues();
			md.setDescription(description);
			md.setTitle(title);
			
			
			getSession().save(md);
			commit();
			return md;
		}
		catch(HibernateException e){
			throw new AdException("No user found"+username,e);
		}
	}
	
	public List<Issues> listOfPostedIssues() throws AdException{
		List<Issues> md = new ArrayList<Issues>();
		try{
			begin();
			Query q = getSession().createQuery("from Issues");
			md = (List<Issues>)q.list();
			commit();
		}catch(HibernateException e){
			rollback();
			throw new AdException("No item uploaded",e);
		}
	return  md;
	}
	
	
}
package com.nikita.project.dao;


	import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.nikita.project.exception.AdException;
import com.nikita.project.pojo.Issuev;
	
	
	public class IssueDAO extends DAO{    
	    public IssueDAO(){
	}
	    
	   public Issuev get(String name)
	           throws AdException {
	       try {
	           begin();
	           Query q = getSession().createQuery("from Issue where name = :name");
	           q.setString("name",name);
	           Issuev issue = (Issuev) q.uniqueResult();
	           commit();
	           return issue;
	       } catch (HibernateException e) {
	           rollback();
	           throw new AdException("Could not get user " + name, e);
	       }
	   }
	   
	   public Issuev getById(int id)
	           throws AdException {
	       try {
	           begin();
	           Query q = getSession().createQuery("from Issue where name = :id");
	           q.setInteger("id", id);
	           Issuev issue = (Issuev) q.uniqueResult();
	           commit();
	           return issue;
	       } catch (HibernateException e) {
	           rollback();
	           throw new AdException("Could not get user " + id, e);
	       }
	   }
	  	   
	   public Issuev validate(String userName, String password)
	           throws AdException {
	       try {
	           begin();
	           Query q = getSession().createQuery("from Issue where userName = :userName and password = :password");
	           q.setString("userName", userName);
	           q.setString("password", password);
	           Issuev issue = (Issuev) q.uniqueResult();
	           commit();           
	           return issue;
	       } catch (HibernateException e) {
	           rollback();
	           throw new AdException("Exception while validating issue with User Name : " + userName);
	       }
	   }
	   
	   public Issuev create(Issuev c)
	           throws AdException {
	       try {
	           begin();
	           System.out.println("inside DAO");
	                       
	           getSession().save(c);
	           
	           commit();
	           return c;
	       } catch (HibernateException e) {
	           rollback();
	           throw new AdException("Exception while creating issue: " + c.getName());
	       }
	   }
	} 



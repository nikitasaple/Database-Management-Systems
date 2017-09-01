package com.nikita.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.nikita.project.exception.AdException;
import com.nikita.project.pojo.ItemsPurchased;
import com.nikita.project.pojo.Manager;
import com.nikita.project.pojo.ModelDetails;
import com.nikita.project.pojo.Person;

public class ModelDetailDAO  extends DAO{
	
	public ModelDetails postModel(String description, long price, int quantity, String username) throws AdException{
		try{
			begin();
			
			ModelDetails md = new ModelDetails();
			md.setDescription(description);
			md.setPrice(price);
			md.setQuantity(quantity);
			
			Query query = getSession().createQuery("from Person where userName = :username");
			query.setString("username", username);
			Person ins = (Person)query.uniqueResult();
			md.setPerson(ins);
			
			getSession().save(md);
			commit();
			return md;
		}
		catch(HibernateException e){
			throw new AdException("No user found"+username,e);
		}
	}
	public void purchase(int userid, int itemid,int quantity)throws AdException{
		ItemsPurchased order = new ItemsPurchased();
		try{
			begin();
			Query q = getSession().createQuery("from Manager where userid = :userid");
			q.setInteger("userid",userid);
			
			Manager manager = (Manager)q.uniqueResult();
			
			Query q1 = getSession().createQuery("from ModelDetails where itemid = :itemid");
			q1.setInteger("itemid",itemid);
			ModelDetails md = (ModelDetails)q1.uniqueResult();
			
			order.setStatus("Purchased");
			order.setModel(md);
			order.setManager(manager);
			order.setQuantity(quantity);
			getSession().save(order);
			commit();
		}                                                                                                                       
		catch(HibernateException e){
			throw new AdException("No item purchased",e);
		}
	}
	
	public List<ItemsPurchased> listOfManagers(int itemid) throws AdException{
		//ItemsPurchased order = new ItemsPurchased();
		List<ItemsPurchased> order = new ArrayList<ItemsPurchased>();
		 try{
			 begin();
//		 	Query q = getSession().createQuery("from ModelDetails where itemid = :itemid");
//			q.setInteger("itemid",itemid);
//			ModelDetails md = (ModelDetails)q.uniqueResult();
//			
			Query q1 = getSession().createQuery("from ItemsPurchased where model = :id");
			q1.setInteger("id",itemid);
			order = q1.list();
			commit();
		
		 }
		 catch(HibernateException e){
				throw new AdException("No item purchased",e);
			}
		return order;
	}
	
	public List<ModelDetails> listOfPostedModels() throws AdException{
		List<ModelDetails> md = new ArrayList<ModelDetails>();
		try{
			begin();
			Query q = getSession().createQuery("from ModelDetails");
			md = q.list();
			commit();
		}catch(HibernateException e){
			rollback();
			throw new AdException("No item purchased",e);
		}
	return  md;
	}
	
	public ItemsPurchased listOfItemsPurcahsed(int itemid) throws AdException{
		ItemsPurchased order = new ItemsPurchased();
		try{
			begin();
			Query q = getSession().createQuery("from ItemsPurchased where itemid = :itemid");
			q.setInteger("itemid", itemid);
			order = (ItemsPurchased)q.uniqueResult();
			commit();
		}
		catch(HibernateException e){
			rollback();
			throw new AdException("No item found with id "+itemid,e);
		}
		return order;
	}
	
	
	
}
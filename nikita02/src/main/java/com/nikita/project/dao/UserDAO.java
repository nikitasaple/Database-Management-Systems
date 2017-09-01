package com.nikita.project.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.nikita.project.exception.AdException;
import com.nikita.project.pojo.Manager;
import com.nikita.project.pojo.Person;
import com.nikita.project.pojo.User;

public class UserDAO extends DAO{
	public UserDAO() {
		
    }

    public Boolean check(User user)
            throws AdException {
    	ArrayList<User> users = new ArrayList();
    	Query q = getSession().createQuery("from Person");
    	
    	users = (ArrayList<User>)q.list();
    	for(User u:users){
    		System.out.println("given"+user.getUserName()+"actual"+u.getUserName());
    		if(user.getUserName().equalsIgnoreCase(u.getUserName())){
    			return false;
    		}
    	}
    	return true;

    }

    public User getUserEntry(String username, String password)
            throws AdException {
    	try {
            Query query = getSession().createQuery("from User where userName = :username and password = :password");
            query.setString("username", username);
            query.setString("password", password);
            User user = (User) query.uniqueResult();
            if(user==null){
            	System.out.println("No such user found");
            }
            close();
            return user;
        } catch (HibernateException e) {
            throw new AdException("Could not get user " + username, e);
          // System.out.println(e);
        }

    }
    public Manager createCust( String userName, String password,String email, String firstName, String lastName,  String phone,String gender,String userType) {

		begin();
		System.out.println("inside DAO");

		// Person user=new Person();

			Manager manager=new Manager();

            manager.setGender(gender); 
            manager.setFirstName(firstName);
            manager.setLastName(lastName);
            manager.setPhone(phone);
            manager.setEmail(email);
            manager.setUserType(userType);
            manager.setPassword(password);
            manager.setUserName(userName);
            //getSession().save(user);
            getSession().save(manager);
			commit();
			return manager;
			
		}
		public Person createIns( String userName, String password,String email, String firstName, String lastName,  String phone,String gender,String userType) {
		
			begin();
			Person person=new Person();

			person.setGender(gender); 
            person.setFirstName(firstName);
            person.setLastName(lastName);
            person.setPhone(phone);
            person.setEmail(email);
            person.setUserType(userType);
            person.setPassword(password);
            person.setUserName(userName);
           // getSession().save(user);
            getSession().save(person);
			commit();
			return person;
	}
	public Person getPerson(int id) throws AdException{
			try{
				Query query = getSession().createQuery("from Person where userid = :userid ");
				query.setInteger("userid",id);
				
				Person ins = (Person)query.uniqueResult();
				if(ins == null){
					System.out.println("No User found");
				}
				close();
				return ins;
			}
			catch (HibernateException e) {
				
		        throw new AdException("Could not get user " + id, e);
			}
		}
	public Person getPersonByName(String username) throws AdException{
		try{
			Query query = getSession().createQuery("from Person where userName= :username");
			query.setString("username",username);
			
			Person ins = (Person)query.uniqueResult();
			if(ins == null){
				System.out.println("No User found");
			}
			close();
			return ins;
		}
		catch (HibernateException e) {
			
	        throw new AdException("Could not get user " + username, e);
		}
	}
	
	public Manager getManagerByName(String username) throws AdException{
		try{
			Query query = getSession().createQuery("from Manager where userName= :username");
			query.setString("username",username);
			
			Manager ins = (Manager)query.uniqueResult();
			if(ins == null){
				System.out.println("No User found");
			}
			close();
			return ins;
		}
		catch (HibernateException e) {
			
	        throw new AdException("Could not get user " + username, e);
		}
	}
	
	public List listOfPerson() throws AdException{
		try{
			begin();
			Query query = getSession().createQuery("from Manager");
			List list = query.list();
			commit();
			return list;
		}
		catch (HibernateException e) {
			
	        throw new AdException("Could not get the list " , e);
		}
	}
}



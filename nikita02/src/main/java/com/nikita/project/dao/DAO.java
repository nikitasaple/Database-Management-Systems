package com.nikita.project.dao;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.AnnotationConfiguration;


public class DAO {
	
	private static final Logger log = Logger.getAnonymousLogger();
    
	private static final ThreadLocal sessionThread = new ThreadLocal();
	
    private static final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    protected DAO() {
    }

    public static Session getSession()
    {
    	System.out.println("inside session");
        Session session = (Session) DAO.sessionThread.get();
        
        if (session == null)
        {
        	System.out.println("Session Null");
            session = sessionFactory.openSession();
            DAO.sessionThread.set(session);
        }
        System.out.println("Return Session"+session);
        return session;
    }

    protected void begin() {
    	System.out.println("tx begin");
        getSession().beginTransaction();
    }

    protected void commit() {
    	System.out.println("tx commit");
        getSession().getTransaction().commit();
    }

    protected void rollback() {
        try {
        	System.out.println("rollback");
            getSession().getTransaction().rollback();
        } catch (HibernateException e) {
            log.log(Level.WARNING, "Cannot rollback", e);
        }
        try {
        	System.out.println("session close");
            getSession().close();
        } catch (HibernateException e) {
            log.log(Level.WARNING, "Cannot close", e);
        }
        DAO.sessionThread.set(null);
    }

    public static void close() {
        getSession().close();
        DAO.sessionThread.set(null);
    }
}
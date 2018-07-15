package com.maphib;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class History{
	
	public static void main(String... s){
		
		//create session factory
		SessionFactory factory = new Configuration()
								.configure("hibernate.cfg.xml")
								.addAnnotatedClass(Hist.class)
								.buildSessionFactory();
		
		//create session
		Session session = factory.getCurrentSession();
		
		try{
			
			//create a session object
			System.out.println("Creating new history object");
			Hist histo = new Hist(123, "Europe");
			
			
			//start a transaction
			session.beginTransaction();
			
			//save the Hist object
			System.out.println("Saving the student...");
			session.save(histo);
			
			//commit transaction
			session.getTransaction().commit();
			
			System.out.println("Done...");
		}
		finally {
			factory.close();
		}
	}
}
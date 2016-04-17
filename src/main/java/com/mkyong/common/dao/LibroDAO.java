package com.mkyong.common.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mkyong.common.model.GeneroLibro;
import com.mkyong.common.model.Libro;

@Repository
public class LibroDAO  {
     
    private static final Logger logger = LoggerFactory.getLogger(LibroDAO.class);
 
    private static SessionFactory sessionFactory;
     
    @Autowired
    public static Session getCurrentSession() {
        Session session = null;
        try { 
            session = sessionFactory.getCurrentSession();
        } catch ( HibernateException he ) {
            session = sessionFactory.openSession();
        }
        return session;
    }    
    
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    public static void addLibro(Libro s) {
        Session session = getCurrentSession();
        session.persist(s);
        session.flush();
        session.close();
        logger.info("Libro saved successfully, Socio Details="+s);
        
        
    }
 
    public static void updateLibro(Libro s) {
        Session session = getCurrentSession();
        session.update(s);
        logger.info("Libro updated successfully, Socio Details="+s);
        session.flush();
        session.close();
    }
    
    
    @SuppressWarnings("unchecked")
    public static List<Libro> listLibros() {

        Session session = getCurrentSession();
        
        List<Libro> libroList = session.createQuery("from Libro").list();
        for(Libro s : libroList){
            logger.info("Libro List::"+s);
        }
        session.close();
        return libroList;
    }
 
    public static Libro getLibroById(int id) {
        Session session = getCurrentSession();      
        Libro s = (Libro) session.load(Libro.class, new Integer(id));
        logger.info("Libro loaded successfully, Socio details="+s);
        session.close();
        return s;
    }
 
    public static void removeLibro(Libro libro) {
        Session session = getCurrentSession();
        session.delete(libro);
        logger.info("Borrado correctamente"+libro);
        session.flush();
        session.close();
        
        
        
    }
    
    public static List<GeneroLibro> getListGeneroLibro(){
    	Session session = getCurrentSession();
        
        List<GeneroLibro> generoLibroList = session.createQuery("from GeneroLibro").list();
        for(GeneroLibro g : generoLibroList){
            logger.info("Genero List::"+g);
        }
        session.close();
        return generoLibroList;
    }
    
    public static GeneroLibro getGeneroLibro(String codigo){
    	Session session = getCurrentSession();
        
        GeneroLibro generoLibro = (GeneroLibro) session.createQuery("from GeneroLibro where codigo= '"+codigo+"'").uniqueResult();
        logger.info("Genero :"+generoLibro);
        session.close();
        return generoLibro;
    }
    
    public static GeneroLibro getGeneroLibroDes(String descripcion){
    	Session session = getCurrentSession();
        
        GeneroLibro generoLibro = (GeneroLibro) session.createQuery("from GeneroLibro where descripcion= '"+descripcion+"'").uniqueResult();
        logger.info("Genero :"+generoLibro);
        session.close();
        return generoLibro;
    }
 
}
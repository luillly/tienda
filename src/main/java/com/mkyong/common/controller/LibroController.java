package com.mkyong.common.controller;

import org.springframework.stereotype.Controller;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.mkyong.common.dao.LibroDAO;
import com.mkyong.common.model.Libro;


@Controller
public class LibroController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(LibroController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/principal", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		
		return "principal";
	}
	
	@RequestMapping(value="listalibros")
	public String obtenerLista(Locale locale, Model model){
		
		List<Libro> listalibros= LibroDAO.listLibros();
		model.addAttribute("listalibros", listalibros);
		return "listalibros";
	}
	
}

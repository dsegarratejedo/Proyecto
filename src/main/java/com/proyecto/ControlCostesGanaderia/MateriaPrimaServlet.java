package com.proyecto.ControlCostesGanaderia;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;


public class MateriaPrimaServlet extends HttpServlet{
	
	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		    
		 
		    String id = req.getParameter("id");
		    String descripcion = req.getParameter("descripcion");
		    String existenciasString = req.getParameter("existencias");
		    float existencias = Float.parseFloat(existenciasString);
		    
		    MateriaPrima materiaprima = new MateriaPrima(id, descripcion, existencias);
		    
		    ObjectifyService.ofy().save().entity(materiaprima).now();
		    
		    //resp.sendRedirect("/materiasprimas.jsp?id=" + materiaprima.id + 
		    //		"&descripcion=" + materiaprima.descripcion +
		    //		"&existencias=" + existenciasString);    
	 }

}
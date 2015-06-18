package com.proyecto.ControlCostesGanaderia;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;


public class MateriaPrimaServlet extends HttpServlet{
	
	List<MateriaPrima> materias;
	
	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		 
		 materias = ObjectifyService.ofy()
					.load()
					.type(MateriaPrima.class)
					.order("id")
					.list(); 
	 
		 if(req.getParameter("guardar")!=null){
		    String id = req.getParameter("id");
		    String descripcion = req.getParameter("descripcion");
		    String existenciasString = req.getParameter("existencias");
		    float existencias = Float.parseFloat(existenciasString);
		    
		    MateriaPrima materiaprima = new MateriaPrima(id, descripcion, existencias);
		    if(!materias.contains(materiaprima)){
			    ObjectifyService.ofy().save().entity(materiaprima).now();
			    resp.sendRedirect("/materiasprimas.jsp?id=" + materiaprima.id + 
		    		"&descripcion=" + materiaprima.descripcion +
		    		"&existencias=" + existenciasString);
		    }else{
		    	resp.sendRedirect("/lotes.jsp?descripcion=" + "ERROR" + "&id=" + "IDERROR");
		    }
		 }
		 
		 if(req.getParameter("borrar")!=null){
			 if(req.getParameterValues("check")!=null){
				 for (int i = 0; i < req.getParameterValues("check").length; i++) {
					 ObjectifyService.ofy().delete().type(MateriaPrima.class).ids(req.getParameterValues("check")[i]);
					 resp.sendRedirect("/materiasprimas.jsp");
				 }
			 }else{
				 resp.sendRedirect("/materiasprimas.jsp");
			 }
		 }
	 }

}
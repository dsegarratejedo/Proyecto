package com.proyecto.ControlCostesGanaderia;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.util.Closeable;

public class LotesServlet extends HttpServlet{
	
	List<Lote> lotes;

	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		 
		 lotes = ObjectifyService.ofy()
					.load()
					.type(Lote.class)
					.order("id")
					.list();   
		 
		 if(req.getParameter("guardar")!=null){
			 if(!req.getParameter("id").equals("") || !req.getParameter("descripcion").equals("")){
			    String id = req.getParameter("id");
			    String descripcion = req.getParameter("descripcion");
			    Lote lote = new Lote(id, descripcion);
			    
			    if(!lotes.contains(lote)){
				    ObjectifyService.ofy().save().entity(lote).now();
				    resp.sendRedirect("/lotes.jsp?descripcion=" + lote.descripcion + "&id=" + lote.id);
			    }else{
			    	resp.sendRedirect("/lotes.jsp?descripcion=" + "ERROR" + "&id=" + "IDERROR");
			    }
			 }else{
				 resp.sendRedirect("/lotes.jsp");
			 }
		 }
		 
		 if(req.getParameter("borrar")!=null){
			 if(req.getParameterValues("check")!=null){
				 for (int i = 0; i < req.getParameterValues("check").length; i++) {
					 System.out.println(req.getParameterValues("check")[i]);
					 ObjectifyService.ofy().delete().type(Lote.class).ids(req.getParameterValues("check")[i]);
					 resp.sendRedirect("/lotes.jsp");
				 }
			 }else{
				 resp.sendRedirect("/lotes.jsp");
			 }
		 }
		 
		    
	 }
	 
}

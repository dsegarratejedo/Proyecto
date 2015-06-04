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
import com.googlecode.objectify.util.Closeable;

public class LotesServlet extends HttpServlet{

	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		    
		 
		    String id = req.getParameter("id");
		    String descripcion = req.getParameter("descripcion");
		    Lote lote = new Lote(id, descripcion);
		    
		    ObjectifyService.ofy().save().entity(lote).now();
		    
		    resp.sendRedirect("/lotes.jsp?descripcion=" + lote.descripcion + "&id=" + lote.id);
		    //System.out.println("Guardado...");
		    
	 }
}

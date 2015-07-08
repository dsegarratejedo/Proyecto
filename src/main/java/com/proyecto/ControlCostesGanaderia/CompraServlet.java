package com.proyecto.ControlCostesGanaderia;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

public class CompraServlet extends HttpServlet{
	
	List<Compra> compras;
	
	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	 
		 compras = ObjectifyService.ofy()
					.load()
					.type(Compra.class)
					.order("id")
					.list();
		 
		 if(req.getParameter("guardar")!=null){
			    String id = req.getParameter("id");
			    String concepto = req.getParameter("concepto");
			    String fecha = req.getParameter("fecha");
			    int kgs = Integer.parseInt(req.getParameter("kgs"));
				int importe = Integer.parseInt(req.getParameter("importe"));
				int consumido = Integer.parseInt(req.getParameter("consumido"));
				int preciokg = Integer.parseInt(req.getParameter("preciokg"));
			    
			    Compra compra = new Compra(id, concepto, fecha, kgs, importe, consumido, preciokg);
			    
			    if(!compras.contains(compra)){
				    ObjectifyService.ofy().save().entity(compra).now();
				    resp.sendRedirect("/compras.jsp?id=" + compra.id + 
				    		"&concepto=" + compra.concepto + 
				    		"&fecha=" + compra.fecha +
				    		"&kgs=" + compra.kgs +
				    		"&importe=" + compra.importe +
				    		"&consumido=" + compra.consumido +
				    		"&preciokg=" + compra.preciokg);
			    }else{
			    	resp.sendRedirect("/compras.jsp?descripcion=" + "ERROR" + "&id=" + "IDERROR");
			    }
			    
			    if(req.getParameter("borrar")!=null){
					 if(req.getParameterValues("check")!=null){
						 for (int i = 0; i < req.getParameterValues("check").length; i++) {
							 System.out.println(req.getParameterValues("check")[i]);
							 ObjectifyService.ofy().delete().type(Compra.class).ids(req.getParameterValues("check")[i]);
							 resp.sendRedirect("/compras.jsp");
						 }
					 }else{
						 resp.sendRedirect("/compras.jsp");
					 }
				 }
			 }
	 }

}

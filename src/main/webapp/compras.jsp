<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>

<%@ page import="com.proyecto.ControlCostesGanaderia.Compra" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://ssl.gstatic.com/docs/script/css/add-ons1.css">
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css">
    <link type="text/css" rel="stylesheet" href="/stylesheets/compras.css">
    
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>Control de costes de gandería</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String concepto = request.getParameter("concepto");
		String fecha = request.getParameter("fecha");
		String kgs = request.getParameter("kgs");
		String importe = request.getParameter("importe");
		String consumido = request.getParameter("consumido");
		String preciokg = request.getParameter("preciokg");
		
		pageContext.setAttribute("id", id);
		pageContext.setAttribute("concepto", concepto);
		pageContext.setAttribute("fecha", fecha);
		pageContext.setAttribute("kgs", kgs);
		pageContext.setAttribute("importe", importe);
		pageContext.setAttribute("consumido", consumido);
		pageContext.setAttribute("preciokg", preciokg);
	
	%>
	
	<jsp:include page="/menu.jsp"></jsp:include>
	
	<div id="central">
	<h1>Compra:</h1>
	<form action="/servletcompra" method="post">
	<div id="izquierdo">
		<div id="formulario_compras">
			<div>
	    		<table>
	    			<tr><td>ID:</td>
	    				<td><input type="text" name="id"></td>
	    			</tr>
	    			<tr><td>Concepto: &nbsp</td>
	    				<td><input type="text" name="concepto"></td>
	    			</tr>
	    			<tr><td>Fecha:&nbsp</td>
	    				<td><input type="text" name="fecha" placeholder="ej. 02/05/2015"></td>
	    			</tr>
	    			<tr><td>KGS:&nbsp</td>
	    				<td><input type="text" name="kgs"></td>
	    			</tr>
	    			<tr><td>Importe:&nbsp</td>
	    				<td><input type="text" name="importe"></td>
	    			</tr>
	    			<tr><td>Consumido:&nbsp</td>
	    				<td><input type="text" name="consumido"></td>
	    			</tr>
	    			<tr><td>Precio/Kg:&nbsp</td>
	    				<td><input type="text" name="preciokg"></td>
	    			</tr>
	    			
	    		</table>
	    		<div><input name="guardar" type="submit" value="Guardar"/></div>
	    	</div>
	    	
	    	<%
		
				if(concepto!=null){
			%>
			<p>Nueva compra: ${fn:escapeXml(id)}, ${fn:escapeXml(concepto)},
				 ${fn:escapeXml(fecha)}, ${fn:escapeXml(kgs)}, ${fn:escapeXml(importe)},
				 ${fn:escapeXml(consumido)}, ${fn:escapeXml(preciokg)}</p>
		
			<%
				}
			%>
			
			</div>
		
			<%
				List<Compra> compras = ObjectifyService.ofy()
					.load()
					.type(Compra.class)
					.order("id")
					.list();
			%>
		
			</div>
			
			<div id="resumen_compras">
			<table id="tabla_compras" >
	    			<tr><th WIDTH="25px"><input name="borrar" type="submit" value="Borrar" id="botonborrar"/> </th>
	    				<th WIDTH="50px">ID &nbsp</th>
	    				<th>Concepto &nbsp</th>
	    				<th>Fecha &nbsp</th>
	    				<th>KGS &nbsp</th>
	    				<th>Importe &nbsp</th>
	    				<th>Consumido &nbsp</th>
	    				<th>Precio/Kg &nbsp</th>
	    			</tr>
	    				<%
	    					
							for(Compra compra : compras){
								pageContext.setAttribute("id", compra.getId());
								pageContext.setAttribute("concepto", compra.getConcepto());
								pageContext.setAttribute("fecha", compra.getFecha());
								pageContext.setAttribute("kgs", compra.getKgs());
								pageContext.setAttribute("importe", compra.getImporte());
								pageContext.setAttribute("consumido", compra.getConsumido());
								pageContext.setAttribute("preciokg", compra.getPreciokg());
								String c = compra.getId();
						%>
				    		<tr id="fila"><td><input type="checkbox" name="check" value=<%=c%>></td>
				    			<td>${fn:escapeXml(id)} &nbsp</td>
				    			<td>${fn:escapeXml(concepto)} &nbsp</td>
				    			<td>${fn:escapeXml(fecha)} &nbsp</td>
				    			<td>${fn:escapeXml(kgs)} &nbsp</td>
				    			<td>${fn:escapeXml(importe)} &nbsp</td>
				    			<td>${fn:escapeXml(consumido)} &nbsp</td>
				    			<td>${fn:escapeXml(preciokg)} &nbsp</td>
				    				
				    		</tr>
				    		
				    		<script>
		    					document.getelementbyid("check").setvalue(materia.getId());
		    				</script>
				    		
		    			<%
		    				
							}
						%>
	    		</table>
			</div>
		</form>

</body>
</html>
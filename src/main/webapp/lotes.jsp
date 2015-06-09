<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>

<%@ page import="com.proyecto.ControlCostesGanaderia.Lote" %>

<html>
<head>
    <link rel="stylesheet" href="https://ssl.gstatic.com/docs/script/css/add-ons1.css">
    <link type="text/css" rel="stylesheet"  href="/stylesheets/main.css">
    <link type="text/css" rel="stylesheet"  href="/stylesheets/lotes.css">
    
    <title>Control de costes de gandería</title>
    
</head>

<body>

<%
	String id = request.getParameter("id");
	String descripcion = request.getParameter("descripcion");
	
	pageContext.setAttribute("id", id);
	pageContext.setAttribute("descripcion", descripcion);
%>

	<header>
		<h1><a href="/index.jsp" style="text-decoration:none">Control de costes ganadería</a></h1>
    </header>
    <div id="menu">
  		<ul>
    		<li><a href="/lotes.jsp" style="text-decoration:none">Lotes</a></li>
    		<li><a href="/materiasprimas.jsp" style="text-decoration:none">Materias primas</a></li>
    		<li><a href="/compras.jsp" style="text-decoration:none">Compras</a></li>
    		<li><a href="/consumos.jsp" style="text-decoration:none">Consumos</a></li>
    		<li><a href="/fichasvacas.jsp" style="text-decoration:none">Fichas vacas</a></li>
    		<li><a href="/fichascorderos.jsp" style="text-decoration:none">Fichas corderos</a></li>
    		<li><a href="/gastosfijos.jsp" style="text-decoration:none">Gastos fijos</a></li>
    		<li><a href="/incidencias.jsp" style="text-decoration:none">Incidencias</a></li>
    		<li><a href="/log.jsp" style="text-decoration:none">Log</a></li>
    		<li><a href="/notas.jsp" style="text-decoration:none">Notas</a></li>
  		</ul>
	</div>

<div id="central">
	<h1>Lote:</h1>
	<div id="izquierdo">
		
		<div id="formulario_lotes">
			<form action="/servletlotes" method="post">
		    	<div>
		    		
		    		<table>
		    			<tr><td>ID:</td>
		    				<td><input type="text" name="id"></td>
		    			</tr>
		    			<tr><td>Descripción: &nbsp</td>
		    				<td><textarea name="descripcion" rows="3" cols="40"></textarea></td>
		    			</tr>
		    		</table>
		    		<div><input type="submit" value="Añadir"/></div>
		    		
		    	</div>
			</form>
			<%
				
				if(descripcion!=null){
			%>
				<p>Nuevo lote: ${fn:escapeXml(id)}, ${fn:escapeXml(descripcion)}</p>
				
			<%
				}else{}
			%>
		</div>
		
		<%
			List<Lote> lotes = ObjectifyService.ofy()
				.load()
				.type(Lote.class)
				.order("id")
				.list();		
			
		%>
		
		<div>
			<p>Modificar lote:</p>
			<select>
				<option value="default" selected>Selecciona un lote</option>
			
				<%
					for(Lote l : lotes){
						String idLote = l.getId();
				%>
				<option value="<%=idLote %>"><%=idLote %></option>
				<%} %>
			  
			</select>
		
		</div>
	</div>
	
	<div id="resumen_lotes">
		<table id="tabla_lotes" >
    			<tr><th WIDTH="100px">ID</td>
    				<th>Descripción</td>
    			</tr>
    				<%
						for(Lote lote : lotes){
							pageContext.setAttribute("lote_id", lote.getId());
							pageContext.setAttribute("lote_descripcion", lote.getDescripcion());
					%>
			    			<tr><td>${fn:escapeXml(lote_id)}</td>
			    				<td>${fn:escapeXml(lote_descripcion)}</td>
			    			</tr>
	    			<%
						}
					%>
    		</table>
	</div>
	
</div>

</body>
</html>
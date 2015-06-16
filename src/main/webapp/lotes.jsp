<%@page import="com.google.appengine.api.conversion.Document"%>
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

<jsp:include page="/menu.jsp"></jsp:include>

<div id="central">
	<h1>Lote:</h1>
	<form action="/servletlotes" method="post">
	<div id="izquierdo">
		<div id="formulario_lotes">
	    	<div>
	    		<table>
	    			<tr><td>ID:</td>
	    				<td><input type="text" name="id"></td>
	    			</tr>
	    			<tr><td>Descripción: &nbsp</td>
	    				<td><textarea name="descripcion" rows="3" cols="40"></textarea></td>
	    			</tr>
	    		</table>
	    		<div><input name="guardar" type="submit" value="Guardar"/></div>
	    	</div>
			
			
			<%
				if(descripcion !=null){
			%>
				<p>Nuevo lote: ${fn:escapeXml(id)}, ${fn:escapeXml(descripcion)}</p>
				
			<%
				}
			%>
		</div>
		
			<%
				List<Lote> lotes = ObjectifyService.ofy()
					.load()
					.type(Lote.class)
					.order("id")
					.list();
				
			%>
		
		</div>
	
		<div id="resumen_lotes">
			<table id="tabla_lotes" >
	    			<tr><th WIDTH="50px"><input name="borrar" type="submit" value="Borrar"/> </td>
	    				<th WIDTH="100px">ID</td>
	    				<th>Descripción</td>
	    			</tr>
	    				<%
	    					
							for(Lote lote : lotes){
								pageContext.setAttribute("lote_id", lote.getId());
								pageContext.setAttribute("lote_descripcion", lote.getDescripcion());
								String l = lote.getId();
						%>
				    		<tr><td><input type="checkbox" name="check" value=<%=l%>></td>
				    			<td>${fn:escapeXml(lote_id)}</td>
				    			<td>${fn:escapeXml(lote_descripcion)}</td>
				    				
				    		</tr>
				    		
				    		
				    		
				    		<script>
		    					document.getelementbyid("check").setvalue(lote.getId());
		    				</script>
				    		
		    			<%
		    				
							}
						%>
	    		</table>
		</div>
	</form>
	
</div>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>

<%@ page import="com.proyecto.ControlCostesGanaderia.MateriaPrima" %>

<html>
<head>
    <link rel="stylesheet" href="https://ssl.gstatic.com/docs/script/css/add-ons1.css">
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css">
    <link type="text/css" rel="stylesheet" href="/stylesheets/materiasprimas.css">
    
    <title>Control de costes de gandería</title>
    
</head>

<body>

<%
	String id = request.getParameter("id");
	String descripcion = request.getParameter("descripcion");
	String existencias = request.getParameter("existencias");
	
	pageContext.setAttribute("id", id);
	pageContext.setAttribute("descripcion", descripcion);
	pageContext.setAttribute("existencias", existencias);
%>

	<jsp:include page="/menu.jsp"></jsp:include>

<div id="central">
	<h1>Materia prima:</h1>
	<form action="/servletmateriaprima" method="post">
	<div id="izquierdo">
		<div id="formulario_materias">
			<div>
	    		<table>
	    			<tr><td>ID:</td>
	    				<td><input type="text" name="id"></td>
	    			</tr>
	    			<tr><td>Descripción: &nbsp</td>
	    				<td><textarea name="descripcion" rows="3" cols="40"></textarea></td>
	    			</tr>
	    			<tr><td>Existencias:&nbsp</td>
	    				<td><input type="text" name="existencias"></td>
	    			</tr>
	    		</table>
	    		<div><input name="guardar" type="submit" value="Guardar"/></div>
	    	</div>
	<%
		
		if(descripcion!=null){
	%>
		<p>Nueva materia prima: ${fn:escapeXml(id)}, ${fn:escapeXml(descripcion)}, ${fn:escapeXml(existencias)}</p>
		
	<%
		}
	%>
	
	</div>
		
	<%
		List<MateriaPrima> materias = ObjectifyService.ofy()
			.load()
			.type(MateriaPrima.class)
			.order("id")
			.list();
	%>
		
	</div>
		
		<div id="resumen_materias">
			<table id="tabla_lotes" >
	    			<tr><th WIDTH="25px"><input name="borrar" type="submit" value="Borrar" id="botonborrar"/> </th>
	    				<th WIDTH="50px">ID</th>
	    				<th>Descripción &nbsp</th>
	    				<th>Existencias</th>
	    			</tr>
	    				<%
	    					
							for(MateriaPrima materia : materias){
								pageContext.setAttribute("id", materia.getId());
								pageContext.setAttribute("descripcion", materia.getDescripcion());
								pageContext.setAttribute("existencias", materia.getExistencias());
								String m = materia.getId();
						%>
				    		<tr id="fila"><td><input type="checkbox" name="check" value=<%=m%>></td>
				    			<td>${fn:escapeXml(id)} &nbsp</td>
				    			<td>${fn:escapeXml(descripcion)} &nbsp</td>
				    			<td>${fn:escapeXml(existencias)}</td>
				    				
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
</div>

</body>
</html>
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
    <link type="text/css" rel="stylesheet" href="/stylesheets/lotes.css">
    
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

	<form action="/servletmateriaprima" method="post">
    	<div>
    		<h1>Materia prima:</h1>
    		
    		<table>
    			<tr><td>ID:</td>
    				<td><input type="text" name="id"></td>
    			</tr>
    			<tr><td>Descripción: </td>
    				<td><textarea name="descripcion" rows="3" cols="60"></textarea></td>
    			</tr>
    			<tr><td>Existencias:</td>
    				<td><input type="text" name="existencias"></td>
    			</tr>
    		</table>
    		<div><input type="submit" value="Añadir"/></div>
    		
    	</div>
	</form>
	<%
		
		if(descripcion!=null){
	%>
		<p>Nueva materia prima: ${fn:escapeXml(id)}, ${fn:escapeXml(descripcion), ${fn:escapeXml(existencias)}</p>
		
	<%
		}else{}
	%>
</div>

</body>
</html>
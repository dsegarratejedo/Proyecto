<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link rel="stylesheet" href="https://ssl.gstatic.com/docs/script/css/add-ons1.css">
    <link type="text/css" rel="stylesheet"  href="/stylesheets/main.css">
    <link type="text/css" rel="stylesheet"  href="/stylesheets/index.css">
    
    <title>Control de costes de gandería</title>
    
</head>

<body>

  		<jsp:include page="/menu.jsp"></jsp:include>

<div id="central">
	<div id="cont_titulo">
		<p id="titulo"> Migración Cloud</p>
		<p id="titulo"> Control de Costes Ganadería </p>
	</div>
	<div id="logos">
		<img id="vaca" src="/img/vaca.png">
		<img id="oveja" src="/img/oveja.png">
	</div>
</div>

</body>
</html>
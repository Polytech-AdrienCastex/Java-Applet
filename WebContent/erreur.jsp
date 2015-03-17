<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Date,java.text.*" %>

<title>Erreur</title>

<jsp:include page="top.jsp" />
	<h1>Une erreur s'est produite!</h1>

	<div class="alert alert-danger">${MesErreurs}</div>
	
<jsp:include page="bottom.jsp" />

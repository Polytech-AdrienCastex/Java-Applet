<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Date,java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="top.jsp" />


<div class="col-sm-1">
	<form action="Controleur">
		<button type="submit" class="return btn btn-default"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></button>
	</form>
</div>
<div class="col-sm-11">
	<h1>Listing des Stages</h1>
</div>

<table class="table table-striped table-bordered table-hover">
  <caption><b>Tableau des Stages</b></caption>
  <thead>
  	<tr>
		<th> Numero </th>
		<th> Libellé  </th>
		<th> Date début  </th>
		<th> Date fin </th>
		<th>Nombre de places </th>
		<th>Nombre d'inscrits </th>
		<th></th>
	</tr>
 </thead>
 <tbody>
 <c:forEach items="${liste}" var="item" >
  <tr>
     <td>${item.id}</td>
     <td>${item.libelle}</td>
     <td>
     	<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy"/>
     </td>
     <td>
      	<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy" />
     </td>
      
     <td>${item.nbplaces}</td>
  	 <td>${item.nbinscrits}</td>
     <td class="text-center">
	  	 <form action="Controleur">
		  	 <input type="hidden" name="type" value="modifier" />
		  	 <input type="hidden" name="action" value="saisieStage" />
		  	 <input type="hidden" name="id" value="${item.id}" />
	  	 	 <button class="btn" type="submit">
	  	 	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
	  	 	 </button>
	     </form>
     </td>
     
  </tr>
 </c:forEach>
 </tbody>
</table>

<jsp:include page="bottom.jsp" />

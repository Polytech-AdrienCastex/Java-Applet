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
	<h1>Recherche de stage</h1>
</div>

<div class="col-sm-12">
	<form class="search navbar-form navbar-right" action="Controleur" method="GET" role="search">
		<div class="form-group">
		  <input type="hidden" name="action" value="rechercheStage" />
	      <input type="text" class="form-control" name="label" placeholder="Stage" value="${recherche}" />
	    </div>
	    <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	</form>
	
	<c:choose>
		<c:when test="${listeEmpty}">
			<div class="alert alert-danger"> Aucun stage ne correspond à la recherche "${recherche}".</div>
		</c:when>
		
		<c:when test="${recherche != null && recherche != \"\"}">
			<table class="table table-striped table-bordered table-hover">
			  <caption>
				  <b>Tableau des Stages trouvés pour la recherche "${recherche}"</b>
			  </caption>
			  <thead>
			  	<tr>
					<th> Numero </th>
					<th> Libellé  </th>
					<th> Date début  </th>
					<th> Date fin </th>
					<th>Nombre de places </th>
					<th>Nombre d'inscrits </th>
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
			     
			  </tr>
			 </c:forEach>
			 </tbody>
			</table>
		</c:when>
		
		<c:otherwise>
			<div class="alert alert-info">Entrez un stage à rechercher.</div>
		</c:otherwise>
	</c:choose>
</div>

<jsp:include page="bottom.jsp" />

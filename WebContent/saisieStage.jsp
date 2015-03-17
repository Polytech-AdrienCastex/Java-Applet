<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Date,java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="top.jsp" />

<title>Ajout d'un stage</title>

<script language=javascript>
  function verif()
  {
  if(document.getElementById("id").value == "" || 
     document.getElementById("libelle").value == "" || 
     document.getElementById("datedebut").value == "" ||
     document.getElementById("datefin").value == "")
       { alert("Un des champs n'est pas rempli !"); 
         return false; 
       }
  else
    return true;
  }
  function Chargement()
  {
      var obj = document.getElementById("id_erreur");
      if (obj.value!='')
         alert('Erreur signalée  : "'+obj.value+"'");
  }
  </script>
</head>
<body  onLoad="Chargement();">
	
	<div class="col-sm-1">
		<form action="Controleur">
			<button type="submit" class="return btn btn-default"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></button>
		</form>
	</div>
	<div class="col-sm-11">
		<h1>Formulaire ${actionType=="ajout"?"d'ajout":"de modification"} d'un stage</h1>
	</div>
	
	<div class="col-sm-12">

		<c:choose>
			<c:when test="${MesErreurs != null}">
				<div class="alert alert-danger">${MesErreurs}</div>
			</c:when>
			<c:when test="${stageAjoute}">
				<div class="alert alert-success">Le stage a été ${actionType=="ajout"?"ajouté":"modifié"} avec succès!</div>
			</c:when>
		</c:choose>
	  	
		<input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
		<form method="post" action="Controleur" onsubmit="return verif();" class="form-horizontal">
			<input type="hidden" name="type" value="${actionType}"  id="type"/>
			<input type="hidden" name="action" value="ajoutStage" />
			 
			 
			<div class="col-sm-1"></div>
			<div class="col-sm-6">
			  <div class="form-group">
			  	  <label for="id" class="col-sm-6 control-label">Numéro</label>
				  <div class="col-sm-6">
			  	  	<div class="input-group">
			  	  		<div class="input-group-addon">N°</div>
				  		<input type="text" class="form-control" name="id" value="${stage.id}" id="id" placeholder="Numéro" ${actionType==ajout?"":"readonly=\"readonly\""} />
				  	</div>
				  </div>
			  </div>
			  <div class="form-group">
			  	  <label for="libelle" class="col-sm-6 control-label">Libellé</label>
			  	  <div class="col-sm-6">
			  		<input type="text" class="form-control" name="libelle" value="${stage.libelle}" id="libelle" placeholder="Libellé" />
				  </div>
			  </div>
			  <div class="form-group">
			  	  <label for="datedebut" class="col-sm-6 control-label">Date de début du stage</label>
			  	  <div class="col-sm-6">
			  		<input type="text" class="form-control" name="datedebut" value="<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${stage.datedebut}" pattern="dd/MM/yyyy"/>" id="datedebut" placeholder="YYYY/MM/DD" />
				  </div>
			  </div>
			  <div class="form-group">
			  	  <label for="datefin" class="col-sm-6 control-label">Date de fin de stage</label>
			  	  <div class="col-sm-6">
			  		<input type="text" class="form-control" name="datefin" value="<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${stage.datefin}" pattern="dd/MM/yyyy"/>" id="datefin" placeholder="YYYY/MM/DD" />
				  </div>
			  </div>
			  <div class="form-group">
			  	  <label for="nbplaces" class="col-sm-6 control-label">Nombre de places</label>
			  	  <div class="col-sm-6">
			  	  	<div class="input-group">
			  			<input type="text" class="form-control" name="nbplaces" value="${stage.nbplaces}" id="nbplaces" placeholder="Nombre de places" />
				  		<div class="input-group-addon">places</div>
			  		</div>
				  </div>
			  </div>
			  <div class="form-group">
			  	  <label for="nbinscrits" class="col-sm-6 control-label">Nombre d'inscrits</label>
			  	  <div class="col-sm-6">
			  	  	<div class="input-group">
				  		<input type="text" class="form-control" name="nbinscrits" value="${stage.nbinscrits}" id="nbinscrits" placeholder="Nombre d'inscrits" />
				  		<div class="input-group-addon">inscrits</div>
			  		</div>
				  </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-6 col-sm-10">
			        <button type="submit" class="btn btn-success">${actionType=="ajout"?"Ajouter":"Modifier"}</button> <button type="reset" class="btn btn-warning">Reset</button>
				  </div>
			  </div>
			</div>
		  
		  	<div class="col-sm-5"></div>
  
  		</form>
  
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
    
		<!-- Bootstrap -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/site.css" rel="stylesheet">
	</head>
	<body>
	
	
	
	
	
		<nav class="navbar  navbar-inverse">
			<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="Controleur?action=index">Gestion des Stages HIGH TECH</a>
				</div>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li	${action=='afficheStage' ? 'class="active"' : ''}><a href="Controleur?action=afficheStage">Afficher <span class="sr-only">(current)</span></a></li>
						<li	${action=='saisieStage' ? 'class="active"' : ''}><a href="Controleur?action=saisieStage">Ajouter</a></li>
						<li	${action=='rechercheStage' ? 'class="active"' : ''}><a href="Controleur?action=rechercheStage">Rechercher</a></li>
					</ul>
					<form class="search navbar-form navbar-right" action="Controleur" method="GET" role="search">
						<div class="form-group">
							<input type="hidden" name="action" value="rechercheStage" />
							<input type="text" class="form-control" name="label" value="${recherche}" placeholder="Stage" />
						</div>
						<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
					</form>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
	
		<div class="jumbotron">
			<div class="container">

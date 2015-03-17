<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Date,java.text.*" %>

<title>Accueil</title>

<jsp:include page="top.jsp" />

<H1> Gestion des Stages  HIGH TECH </H1>

<div class="col-lg-4">
	<div id="menu">
		<dl class="dl-horizontal">
		    <dt><a href="Controleur?action=saisieStage">Saisie d'un stage</a></dt>
		    <dd>Saisir des informations concernant un nouveau stage pour l'ajouter à la base de données.</dd>
		    <dt><a href="Controleur?action=afficheStage">Affichage liste des stages</a></dt>
		    <dd>Afficher la liste des stages deja enregistrés dans la base de données.</dd>
		    <dt><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></dt>
		    <dd>Effectuer une recherche d'un ou plusieurs stages dans la base de données.</dd>
		</dl>
	</div>
</div>
<div class="col-lg-8">
	<blockquote>
		<h2>Nous sommes le <%= DateFormat.getDateTimeInstance(DateFormat.FULL,DateFormat.FULL).format(new Date()) %></h2>
	</blockquote>
</div>

<jsp:include page="bottom.jsp" />

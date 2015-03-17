package controle;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64.Decoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;

import meserreurs.MonException;
import metier.Stage;

@WebServlet("/Controleur")
public class Controleur extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	private static final String ACTION_TYPE = "action";
	private static final String RECHERCHE_PARAMETRE = "label";

	private static final String ACCUEIL = "accueil";
	private static final String SAISIE_STAGE = "saisieStage";
	private static final String AFFICHER_STAGE = "afficheStage";
	private static final String RECHERCHER_STAGE = "rechercheStage";
	private static final String CHERCHER_STAGE = "chercheStage";
	private static final String AJOUT_STAGE = "ajoutStage";
	private static final String MODIFIER_STAGE = "modifierStage";
	
	private static final String ERROR_PAGE = null;

	// le format est une combinaison de MM dd yyyy avec / ou –
	// exemple dd/MM/yyyy
	public Date conversionChaineenDate(String unedate, String unformat) throws Exception
	{
		Date datesortie;
		// on définit un format de sortie
		SimpleDateFormat defFormat = new SimpleDateFormat(unformat);
		datesortie = defFormat.parse(unedate);
		return datesortie;
	}
	
	public String toUTF8(String nonUTF8Value) throws UnsupportedEncodingException
	{
		byte[] array = nonUTF8Value.getBytes();
		return new String(array, 0, array.length, "UTF-8");
	}


	protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MonException, Exception
	{
		String actionName = request.getParameter(ACTION_TYPE);
		String destinationPage = ERROR_PAGE;
		List<Stage> listeStages = null;

		request.setAttribute("action", actionName);
		
		// execute l'action
		if (SAISIE_STAGE.equals(actionName))
		{
			request.setAttribute("stage", new Stage());
			String type = request.getParameter("type");
			if(type == null)
				type = "ajout";
			request.setAttribute("actionType", type);

			if(type.equals("modifier"))
			{
				Stage unStage = new Stage();
				request.setAttribute("stage", unStage.rechercheLeStage(request.getParameter("id")));
			}
				
			destinationPage = "/saisieStage.jsp";
		}
		else if (AJOUT_STAGE.equals(actionName))
		{
			try
			{
				Stage unStage = new Stage();
				unStage.setId(request.getParameter("id"));
				unStage.setLibelle(toUTF8(request.getParameter("libelle")));
				unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "yyyy/MM/dd"));
				unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "yyyy/MM/dd"));
				unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
				unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
				unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
				request.setAttribute("stage", unStage);
				
				String type = request.getParameter("type");
				if(type == null)
					type = "ajout";
				
				request.setAttribute("actionType", type);
				
				if(type.equals("ajout"))
					unStage.insertionStage();
				else
					unStage.updateStage();
				request.setAttribute("stageAjoute", true);
				destinationPage = "/saisieStage.jsp";
			} catch (Exception e)
			{
				request.setAttribute("MesErreurs", e.getMessage());
				destinationPage = "/saisieStage.jsp";
			}
		}
		else if (AFFICHER_STAGE.equals(actionName))
		{
			try
			{
				Stage unStage = new Stage();
				request.setAttribute("affichageListe", 1);
				listeStages = unStage.rechercheLesStages();
				request.setAttribute("liste", listeStages);
				destinationPage = "/afficherStages.jsp";
			}
			catch (MonException e)
			{
				request.setAttribute("MesErreurs", e.getMessage());
				destinationPage = "/erreur.jsp";
			}
		}
		else if (RECHERCHER_STAGE.equals(actionName))
		{
			try
			{
				String rechercheLabel = request.getParameter(RECHERCHE_PARAMETRE);
				if(rechercheLabel == null)
				{
					listeStages = new ArrayList<>();
				}
				else
				{
					Stage unStage = new Stage();
					request.setAttribute("affichageListe", 1);
					listeStages = unStage.rechercheLesStages(rechercheLabel);
					request.setAttribute("recherche", rechercheLabel);
				}
				request.setAttribute("listeEmpty", listeStages == null || listeStages.isEmpty());
				request.setAttribute("liste", listeStages);
				destinationPage = "/rechercherStages.jsp";
			}
			catch (MonException e)
			{
				request.setAttribute("MesErreurs", e.getMessage());
				destinationPage = "/erreur.jsp";
			}
		}
		else
		{
			destinationPage = "/index.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
		dispatcher.forward(request, response); 
  } 

	//L’appel de cette procédure se fait avec :

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			processusTraiteRequete(request, response);
		}
		catch( Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			processusTraiteRequete(request, response);
		}
		catch( Exception e)
		{
			e.printStackTrace();;
		}
	}
}
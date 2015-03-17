package metier;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.*;

import persistance.DialogueBd;

import meserreurs.MonException;

public class Stage {

	private String id;
	private String libelle;
	private Date datedebut;
	private Date datefin;
	private int nbplaces;
	public int getNbplaces() {
		return nbplaces;
	}


	public void setNbplaces(int nbplaces) {
		this.nbplaces = nbplaces;
	}


	public int getNbinscrits() {
		return nbinscrits;
	}


	public void setNbinscrits(int nbinscrits) {
		this.nbinscrits = nbinscrits;
	}
	private int nbinscrits;

	
	public Stage(String id, String libelle, Date datedebut, Date datefin, 
			int nbplaces, int nbinscrits) {
		this.id = id;
		this.libelle = libelle;
		this.datedebut = datedebut;
		this.datefin = datefin;
		this.nbplaces = nbplaces;
		this.nbinscrits = nbinscrits;
	}
	

	public String getId() {
		return id;
	}
	public Stage() {
	
		// TODO Auto-generated constructor stub
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public Date getDatedebut() {
		return datedebut;
	}
	public void setDatedebut(Date datedebut) {
		this.datedebut = datedebut;
	}
	public Date getDatefin() {
		return datefin;
	}
	public void setDatefin(Date datefin) {
		this.datefin = datefin;
	}
	
	
	/* traitements métier */
	
	public void insertionStage() throws Exception 
	{   
		
		try 
		{ 
			String mysql="";
			DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
			String dd = dateFormatpers.format(this.getDatedebut());
			String df = dateFormatpers.format(this.getDatefin());
			
			mysql = "INSERT INTO stages (id, libelle, datedebut ,";
			mysql = mysql + " datefin, nbplaces, nbinscrits) ";
			mysql = mysql + " VALUES ( \'" + this.getId() + "\', \'" + this.getLibelle() + "\', ";
			mysql = mysql + "\' " + dd + "\', " + "\' " + df + "\', ";
			mysql = mysql + this.getNbplaces() + ", " + this.getNbinscrits() + " )";
			DialogueBd.insertionBD(mysql);
		}
		catch(Exception e)
		{
			throw e;
		}
	} 
	public void updateStage() throws Exception 
	{   
		
		try 
		{ 
			String mysql="";
			DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
			String dd = dateFormatpers.format(this.getDatedebut());
			String df = dateFormatpers.format(this.getDatefin());
			
			mysql = "UPDATE stages SET ";
			mysql = mysql + "libelle = \'" + this.getLibelle() + "\', ";
			mysql = mysql + "datedebut = \' " + dd + "\', datefin = \' " + df + "\', nbplaces = ";
			mysql = mysql + this.getNbplaces() + ", nbinscrits = " + this.getNbinscrits() + " WHERE id = \'" + this.getId() + "\'";
			DialogueBd.insertionBD(mysql);
		}
		catch(Exception e)
		{
			throw e;
		}
	} 

	public Stage rechercheLeStage(String id) throws MonException, ParseException
	{
		List<Object> rs;
		try
		{
			 String mysql = "SELECT * FROM stages WHERE id=" + id;
			
			 rs = DialogueBd.lecture(mysql); 
			
	         if(rs.size() > 0)
	         { 
	             // On crée un stage
	             Stage unS = new Stage();
	             // il faut redecouper la liste pour retrouver les lignes
	             unS.setId(rs.get(0).toString());
	             unS.setLibelle(rs.get(1).toString());
	             DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
	             unS.setDatedebut(dateFormatpers.parse(rs.get(2).toString()));
	             unS.setDatefin((dateFormatpers.parse(rs.get(3).toString())));
	             unS.setNbplaces( Integer.parseInt(rs.get(4).toString()));
	             unS.setNbinscrits( Integer.parseInt(rs.get(5).toString()));
	             return unS;
	         }
	         else
	        	 return null;
			
		} catch (MonException e)
		{
			System.out.println(e.getMessage());
			throw e;
		}

	}
	public List<Stage> rechercheLesStages(String label) throws MonException, ParseException
	{
		List<Object> rs;
		List<Stage> mesStages = new ArrayList<Stage>();
		int index=0;
		try
		{
			String mysql = "";

			label = label.replace("'", "").replace("%", "");
			while(label.endsWith("\\"))
				label = label.substring(0, label.length() - 1);
			
			mysql = "SELECT * FROM stages WHERE libelle LIKE '%" + label + "%' ORDER BY id ASC";
			
			 rs = DialogueBd.lecture(mysql); 
			
             while(index < rs.size())
             { 
                 // On crée un stage
                  Stage unS = new Stage();
                 // il faut redecouper la liste pour retrouver les lignes
                    unS.setId(rs.get(index+0).toString());
                    unS.setLibelle(rs.get(index+1).toString());
                    DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
                    unS.setDatedebut(dateFormatpers.parse(rs.get(index+2).toString()));
                    unS.setDatefin((dateFormatpers.parse(rs.get(index+3).toString())));
                    unS.setNbplaces( Integer.parseInt(rs.get(index+4).toString()));
                    unS.setNbinscrits( Integer.parseInt(rs.get(index+5).toString()));
                    // On incrémente tous les 6 champs
                    index= index+6;
                     mesStages.add(unS);
                    }
            
             return mesStages;
			
		} catch (MonException e)
		{
			System.out.println(e.getMessage());
			throw e;
		}

	}
	public List<Stage> rechercheLesStages() throws MonException, ParseException
	{
		List<Object> rs;
		List<Stage> mesStages = new ArrayList<Stage>();
		int index=0;
		try
		{
			String mysql = "";
			
			mysql = "SELECT * FROM stages ORDER BY id ASC";
			
			 rs= DialogueBd.lecture(mysql); 
			
             while(index < rs.size())
             { 
                 // On crée un stage
                  Stage unS = new Stage();
                 // il faut redecouper la liste pour retrouver les lignes
                    unS.setId(rs.get(index+0).toString());
                    unS.setLibelle(rs.get(index+1).toString());
                    DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
                    unS.setDatedebut(dateFormatpers.parse(rs.get(index+2).toString()));
                    unS.setDatefin((dateFormatpers.parse(rs.get(index+3).toString())));
                    unS.setNbplaces( Integer.parseInt(rs.get(index+4).toString()));
                    unS.setNbinscrits( Integer.parseInt(rs.get(index+5).toString()));
                    // On incrémente tous les 6 champs
                    index= index+6;
                     mesStages.add(unS);
                    }
            
             return mesStages;
			
		} catch (MonException e)
		{
			System.out.println(e.getMessage());
			throw e;
		}

	}
}

package com.voteApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import com.voteApp.entities.CentreCo;
import com.voteApp.entities.CentreDe;
import com.voteApp.entities.Employe;
import com.voteApp.entities.Votant;
import com.voteApp.entities.Vote;
import com.voteApp.hachage.hach;



public class Gestiondb {
	public Collection<Employe> getAllEmploye() {
		// TODO Auto-generated method stub
		Connection connection = Connectiondb.getInstance().getConnection();

		try {
			PreparedStatement stmt;
			stmt = connection.prepareStatement("SELECT * FROM  Employe");
			ResultSet result = stmt.executeQuery();
			Collection<Employe> listemp = new ArrayList<Employe>();

			while (result.next()) { 
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				String datenaissance = result.getString("datenaissance");
				String 	identificateur = result.getString("identificateur");
				Employe e = new Employe(nom, prenom, datenaissance,identificateur);
				e.setId(id);
				listemp.add(e);
			}
			return listemp;

		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
		}
		return null;
	}
	
	public Boolean findEmploye(Employe employe) {
		Connection connection = Connectiondb.getInstance().getConnection();
		try {
			PreparedStatement stmt;
			Statement st = connection.createStatement();
			String sql = "select * from employe where 	identificateur ='" + employe.getIdentificateur() +"'";
			ResultSet rs = st.executeQuery(sql);
			rs.last();
			if (rs.getRow() == 0)
				return false;
			else
				return true;
		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
		}
		return false;
	}
	
	public int getNbrVotes(String candidat) {
		Connection connection = Connectiondb.getInstance().getConnection();
		try {
			PreparedStatement stmt;
			Statement st = connection.createStatement();
			String sql = "select count(*) as votecount from vote where bulltinvote like '%" + candidat +"%'";
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			int count = rs.getInt("votecount") ;
			return count;
		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
			return -1;
		}
	}
	
	public ArrayList<String> getCandidats(){
		ArrayList<String> list = new ArrayList<String>();
		Connection connection = Connectiondb.getInstance().getConnection();
		try {
			PreparedStatement stmt;
			Statement st = connection.createStatement();
			String sql = "select candidat as candidat from candidats";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) { 
				String candidat = rs.getString("candidat");
				list.add(candidat);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
			return null;
		}
	}
	
	public Boolean LoginCo(CentreCo centreCo) {
		Connection connection = Connectiondb.getInstance().getConnection();
		try {
			PreparedStatement stmt;
			Statement st = connection.createStatement();
			String sql = "select * from centreco where UPPER(email) like UPPER('" + centreCo.getEmail() +"') and password = '" + hach.getsh(centreCo.getPassword()) + "'";
			ResultSet rs = st.executeQuery(sql);
			rs.last();
			if (rs.getRow() == 0)
				return false;
			else
				return true;
		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
		}
		return false;
	}
	
	public Boolean loginDe(CentreDe centreDe ) {
		Connection connection = Connectiondb.getInstance().getConnection();
		try {
			PreparedStatement stmt;
			Statement st = connection.createStatement();
			String sql = "select * from centrede where UPPER(email) like UPPER('" + centreDe.getEmail() +"') and password ='" + hach.getsh(centreDe.getPassword()) + "'";
			ResultSet rs = st.executeQuery(sql);
			rs.last();
			if (rs.getRow() == 0)
				return false;
			else
				return true;
		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
		}
		return false;
	}
	
	public Collection<Votant> getAllVotant() {
		// TODO Auto-generated method stub
		Connection connection = Connectiondb.getInstance().getConnection();

		try {
			PreparedStatement stmt;
			stmt = connection.prepareStatement("SELECT * FROM  votant");
			ResultSet result = stmt.executeQuery();
			Collection<Votant> listco = new ArrayList<Votant>();

			while (result.next()) {
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				String datenaissance = result.getString("datenaissance");
				String identificateur = result.getString("identificateur");
				String bulltinvote = result.getString("bulltinvote");
				Votant co = new Votant(nom, prenom, datenaissance, identificateur, bulltinvote);
				co.setId(id);
				listco.add(co);
			}
			return listco;

		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
		}
		return null;
	}

	public Collection<Vote> getAllVote() {
		// TODO Auto-generated method stub
		Connection connection = Connectiondb.getInstance().getConnection();

		try {
			PreparedStatement stmt;
			stmt = connection.prepareStatement("SELECT * FROM vote ");
			ResultSet result = stmt.executeQuery();
			Collection<Vote> listde = new ArrayList<Vote>();
			while (result.next()) {
				int id = result.getInt("id");
				String identification = result.getString("identificateur");
				String bulltinvote = result.getString("bulltinvote");
				Vote de = new Vote(identification, bulltinvote);
				de.setId(id);
				listde.add(de);
			}
			return listde;

		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
		}
		return null;
	}

	public Boolean setVotant(Votant votant) {
		Connection connection = Connectiondb.getInstance().getConnection();
		try {
			PreparedStatement stmt;
			Statement st = connection.createStatement();
			String sql = "select * from Votant where identificateur ='" + votant.getIdentificateur() +"'";
			ResultSet rs = st.executeQuery(sql);
			rs.last();
			if (rs.getRow() == 0) {
				stmt = connection.prepareStatement("INSERT INTO Votant(nom, prenom, datenaissance, identificateur, bulltinvote)VALUES"
						+ "(\'"+votant.getNom()+"\',\'"+votant.getPrenom()+"\',\'"+votant.getDatenaissance()
						+"\',\'"+votant.getIdentificateur()+"\',\'"+votant.getBulltinvote()+"\')");
				stmt.execute();
				return true;
			} else {
				System.out.println("ce personne est deja voter");
			}
		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
		}
		return false;
	}

	public Boolean setVote(Vote vote) {
		Connection connection = Connectiondb.getInstance().getConnection();
		try {
			Statement st = connection.createStatement();
			String sql = "select * from vote where identificateur ='" + vote.getIdentificateur() +"'";
			ResultSet rs = st.executeQuery(sql);
			rs.last();
			if (rs.getRow() == 0) {
				PreparedStatement stmt;
				stmt = connection.prepareStatement("INSERT INTO vote(identificateur, bulltinvote) VALUES(\'" + vote.getIdentificateur()+ "\',\'" +vote.getBulltinvote()+"\')");
				stmt.execute();
			}
		} catch (SQLException e) {
			System.out.println("Erreur SQL " + e.getMessage());
			return false;
		}
		return true;
	}


}

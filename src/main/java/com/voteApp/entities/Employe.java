package com.voteApp.entities;


	
	public class Employe {

		private int id;
		private String nom;
		private String prenom;
		private String datenaissance;
		private String identificateur;

		public Employe(String nom, String prenom, String datenaissance, String identification) {
			super();
			this.nom = nom;
			this.prenom = prenom;
			this.datenaissance = datenaissance;
			this.identificateur = identification;
		}

		@Override
		public String toString() {
			return "Employe [id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", datenaissance=" + datenaissance
					+ ", identification=" + identificateur + "]";
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}
		
		public String getNom() {
			return nom;
		}

		public void setNom(String nom) {
			this.nom = nom;
		}

		public String getPrenom() {
			return prenom;
		}

		public void setPrenom(String prenom) {
			this.prenom = prenom;
		}

		public String getDatenaissance() {
			return datenaissance;
		}

		public void setDatenaissance(String datenaissance) {
			this.datenaissance = datenaissance;
		}

		public String getIdentificateur() {
			return identificateur;
		}

		public void setIdentificateur(String identification) {
			this.identificateur = identification;
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	



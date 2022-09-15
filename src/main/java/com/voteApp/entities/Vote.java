package com.voteApp.entities;

public class Vote {

	private int id;
	private String identificateur;
	private String bulltinvote;

	public Vote(String identification, String bulltinvote) {
		super();
		this.identificateur = identification;
		this.bulltinvote = bulltinvote;
	}

	@Override
	public String toString() {
		return "Devotant [id=" + id + ", identification=" + identificateur + ", bulltinvote=" + bulltinvote + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdentificateur() {
		return identificateur;
	}

	public void setIdentificateur(String identification) {
		this.identificateur = identification;
	}

	public String getBulltinvote() {
		return bulltinvote;
	}

	public void setBulltinvote(String bulltinvote) {
		this.bulltinvote = bulltinvote;
	}

}

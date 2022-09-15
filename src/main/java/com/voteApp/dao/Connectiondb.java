package com.voteApp.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;



public class Connectiondb {
	private static Connectiondb uniqueInstance;	
	private Connectiondb() {
	
	}
	
	public static Connectiondb getInstance() {
		if(uniqueInstance == null) {
			uniqueInstance = new Connectiondb();
		}
		return uniqueInstance;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vote?characterEncoding=latin1&useConfigs=maxPerformance", "root","");
		}
		catch(ClassNotFoundException ex) {
			System.out.println("Erreur de pilote : " + ex.getMessage());
		}
		catch(SQLException ex) {
			System.out.println("Erreur SQL : " + ex.getMessage());
		}
		return conn;
	}
	

	public static void main (String[] args) {
		Connectiondb sing =getInstance();
		Connection conn =sing.getConnection();
	    if (conn == null) 
		System.out.println("Faild");
		else		System.out.println("succusful ");}
	}
	

	
//	

	




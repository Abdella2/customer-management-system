package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Customer;

public class CustomerRepository {
	private String jdbcUrl = "jdbc:mysql://localhost:3306/sale_db";
	private String dbUserName = "SEStudent";
	private String dbPassword = "SEStudent";
    
	private Connection con;
	private Statement stm;
	
	public CustomerRepository() { 

    
     try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
        con = DriverManager.getConnection(jdbcUrl, dbUserName, dbPassword);
        stm = con.createStatement();
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    }
    
    public int saveCustomer(Customer customer) {
    	
    	int result = 0;
    	
    	 String query = "INSERT INTO customer(id, first_name, middle_name, last_name, telephone_no, email, house_no)"
    	 		+ " VALUES (?, ?, ?, ?, ?, ?, ?);";
    	 
    	 PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(query);
			
			long id = countCustomers() + 1;

			preparedStatement.setLong(1, id);
	        preparedStatement.setString(2, customer.getFirstName());
	        preparedStatement.setString(3, customer.getMiddleName());
	        preparedStatement.setString(4, customer.getLastName());
	        preparedStatement.setString(5, customer.getTelephoneNo());
	        preparedStatement.setString(6, customer.getEmail());
	        preparedStatement.setString(7, customer.getHouseNo());
	         
	        result = preparedStatement.executeUpdate();
	        
	        con.close();
	        
	        return result;
		} catch (Exception ex) {
	        ex.printStackTrace();
	    }
		
		return result;
    	
    }
    
    public int deleteCustomer(int id) {
    	String query = "DELETE FROM customer WHERE id="+ id;
    	
    	int count = 0;
    	try {
    		count = stm.executeUpdate(query);
	    } catch (Exception ex) {
			 ex.printStackTrace();
	    }
    	
    	return count;
    	
    }
    
    public ResultSet getCustomers() {
    	String query = "SELECT * FROM sale_db.customer";
    	
    	ResultSet rs = null;
    	try {
    		rs = stm.executeQuery(query);
	    } catch (Exception ex) {
			 ex.printStackTrace();
	    }
    	
    	return rs;
    }
    
    private int countCustomers() {
    	String query = "SELECT count(id) FROM sale_db.customer";
    	
    	ResultSet rs;
    	int numberOfCustomers = 0;
    	
		try {
			
			rs = stm.executeQuery(query);
			rs.next();
			numberOfCustomers = rs.getInt(1);
			
		 } catch (Exception ex) {
			 ex.printStackTrace();
	     }
    	
    	return numberOfCustomers;
    	
    }

}

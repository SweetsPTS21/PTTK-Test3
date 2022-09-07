package dao;

import model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDAO extends DBconnection {
    public String username;

    public String getUsername() {return username;}

    public void registerEmployee(Customer customer) {
        String sql = "INSERT INTO bookonline.customer(id, first_name, last_name, username, password, address, contact) VALUES(?, ?, ?, ?, ?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customer.getId());
            ps.setNString(2, customer.getFirstName());
            ps.setNString(3, customer.getLastName());
            ps.setNString(4, customer.getUsername());
            ps.setString(5, customer.getPassword());
            ps.setNString(6, customer.getAddress());
            ps.setNString(7, customer.getContact());
            ps.executeUpdate();

        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public int getID() {
        String sql = "SELECT COUNT(id) FROM bookonline.customer";
        int id = 0;

        try {
            PreparedStatement  ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                id = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return (id + 1);
    }

    public boolean customerLogin(String username, String password) {
        String sql = "SELECT * FROM bookonline.customer WHERE username = ? AND password = ?";
        Boolean login = false;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                login = true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return login;
    }

    public Customer getCustomerByUsername(String username) {
        String sql = "SELECT * FROM customer WHERE username = ?";
        Customer customer = new Customer();

        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customer.setId(rs.getInt("id"));
                customer.setUsername(username);
                customer.setPassword(rs.getString("password"));
                customer.setFirstName(rs.getNString("first_name"));
                customer.setLastName(rs.getNString("last_name"));
                customer.setAddress(rs.getNString("address"));
                customer.setContact(rs.getString("contact"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }
}
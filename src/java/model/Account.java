/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.*;
import java.sql.*;
import java.util.*;

public class Account {

	public static ResultSet login(Connection conn, String uname, String pass) throws SQLException {
		String query = "SELECT * FROM account WHERE ACC_UNAME = ? AND ACC_PASS = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, uname);
		ps.setString(2, pass);
		return ps.executeQuery();
	}

    public static ResultSet accountInfo(Connection conn, String uname) throws SQLException {
        String query = "SELECT * FROM account WHERE ACC_UNAME = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, uname);
        return ps.executeQuery();
    }
}

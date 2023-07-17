/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.*;
import java.sql.*;
import java.util.*;

public class Post {
    
	public static ResultSet allPosts(Connection conn) throws SQLException {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM post ORDER BY POST_DATE DESC");
		return rs;
	}

	public static void publishPost(Connection conn, String title, String text, String uname) throws SQLException {
        String query = "INSERT INTO post (POST_TITLE, POST_DATE, POST_TEXT, ACC_UNAME) VALUES (?, NOW(), ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, title);
        ps.setString(2, text);
        ps.setString(3, uname);
        ps.executeUpdate();
	}

    public static ResultSet getPost(Connection conn, int id) throws SQLException {
        String query = "SELECT * FROM post WHERE POST_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public static ResultSet getAccPosts(Connection conn, String uname) throws SQLException {
        String query = "SELECT * FROM post WHERE ACC_UNAME = ? ORDER BY POST_DATE DESC";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, uname);
        return ps.executeQuery();
    }

    public static boolean ownsPost(Connection conn, String uname, int id) throws SQLException {
        String query = "SELECT * FROM post WHERE ACC_UNAME = ? AND POST_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, uname);
        ps.setInt(2, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) return true;
        else return false;
    }

    public static void editPost(Connection conn, int id, String title, String text) throws SQLException {
        String query = "UPDATE post SET POST_TITLE = ?, POST_DATE = NOW(), POST_TEXT = ? WHERE POST_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, title);
        ps.setString(2, text);
        ps.setInt(3, id);
        ps.executeUpdate();
    }
}

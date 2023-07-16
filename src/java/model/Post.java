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

	public static void publishPost(Connection conn, String title, String text, String uname) {
	}
}

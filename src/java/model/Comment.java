/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.*;
import java.sql.*;
import java.util.*;

public class Comment {

    public static void publishComment(Connection conn, String text, int postID, String uname) throws SQLException {
        String query = "INSERT INTO comment (COM_DATE, COM_TEXT, POST_ID, ACC_UNAME) VALUES (NOW(), ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, text);
        ps.setInt(2, postID);
        ps.setString(3, uname);
        ps.executeUpdate();
    }

    public static ResultSet allComments(Connection conn, int postID) throws SQLException {
        String query = "SELECT * FROM comment WHERE POST_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, postID);
        return ps.executeQuery();
    }

    public static int commentCount(Connection conn, int postID) throws SQLException {
        String query = "SELECT COUNT(*) as total FROM comment WHERE POST_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, postID);
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs.getInt("total");
    }
}

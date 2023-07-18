/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.*;
import java.sql.*;
import java.util.*;

public class Vote {

    public static int upVoteCount(Connection conn, int postid) throws SQLException {
        // count post upvotes
        String query = "SELECT COUNT(*) as total FROM upvote WHERE POST_ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, postid);
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs.getInt("total");
    }

    public static boolean postUp(Connection conn, int postid, String uname) throws SQLException {
        // check if user already upvoted the post
        String query = "SELECT * FROM upvote WHERE POST_ID = ? AND ACC_UNAME = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, postid);
        ps.setString(2, uname);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }

    public static void toggleUpVote(Connection conn, int postid, String uname) throws SQLException {
        if (!postUp(conn, postid, uname)) {
            System.out.println("UPVOTING POST");
            String query = "INSERT INTO upvote (POST_ID, ACC_UNAME) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, postid);
            ps.setString(2, uname);
            ps.executeUpdate();
        }
        else {
            System.out.println("REMOVING UPVOTE FROM POST");
            String query = "DELETE FROM upvote WHERE POST_ID = ? AND ACC_UNAME = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, postid);
            ps.setString(2, uname);
            ps.executeUpdate();
        }
    }
}

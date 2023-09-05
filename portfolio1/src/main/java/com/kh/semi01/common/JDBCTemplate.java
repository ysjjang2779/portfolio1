package com.kh.semi01.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTemplate {
   
   public static Connection getConnection() {
      
      Connection conn = null;
      
      Properties prop = new Properties();
      
      try {

         prop.load(new FileInputStream(JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath()));

      } catch (IOException e) {
         e.printStackTrace();
      }
      
      try {
         
         Class.forName(prop.getProperty("driver"));
         
         conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password"));
         
         conn.setAutoCommit(false);
         conn.setAutoCommit(false);
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return conn;
      
   }
   
   // commit 메소드
   public static void commit(Connection conn) {
      
      try {
         if(conn != null && !conn.isClosed()) {
            conn.commit();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
   }
   
   // rollback 메소드
   public static void rollback(Connection conn) {
      
      try {
         if(conn != null && !conn.isClosed()) {
            conn.rollback();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
   }
   
   // Connection close 메소드
   public static void close(Connection conn) {
      
      try {
         if(conn != null && !conn.isClosed()) {
            conn.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
   }
   
   // Statement close 메소드
   public static void close(PreparedStatement pstmt) {
      
      try {
         if(pstmt != null && !pstmt.isClosed()) {
            pstmt.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
   }
   
   // ResultSet close 메소드
   public static void close(ResultSet rset) {
      
      try {
         if(rset != null && !rset.isClosed()) {
            rset.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
   }

}

package com.kh.semi01.manager.model.dao;

import static com.kh.semi01.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi01.manager.model.vo.Select;
import com.kh.semi01.product.model.vo.Product;
import com.kh.semi01.product.model.vo.ProductIMG;

public class RegistDao {
	private Properties prop = new Properties();
	
	public RegistDao(){
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/sql/regist-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Select> getMovieSelectBoxList(Connection conn) {
		ArrayList<Select> sel = new ArrayList<Select>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMovieSelectBoxList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				sel.add(new Select(rset.getInt("category_type"),rset.getString("category_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sel;
	}
	
	public ArrayList<Select> getDisplaySelectBoxList(Connection conn){
		ArrayList<Select> sel = new ArrayList<Select>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getDisplaySelectBoxList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				sel.add(new Select(rset.getInt("category_type"),rset.getString("category_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sel;
	}
	
	public ArrayList<Select> getShowSelectBoxList(Connection conn){
		ArrayList<Select> sel = new ArrayList<Select>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getShowSelectBoxList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				sel.add(new Select(rset.getInt("category_type"),rset.getString("category_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sel;
	}
	
	public int insertProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct");
		
		int year1 = Integer.parseInt(p.getStartPeriod().substring(0, 4));
        int month1 = Integer.parseInt(p.getStartPeriod().substring(5, 7));
        int day1 = Integer.parseInt(p.getStartPeriod().substring(8, 10));
        
        int year2 = Integer.parseInt(p.getEndPeriod().substring(0, 4));
        int month2 = Integer.parseInt(p.getEndPeriod().substring(5, 7));
        int day2 = Integer.parseInt(p.getEndPeriod().substring(8, 10));
        
        month1--;
        month2--;

        Date start = new Date(year1 - 1900, month1, day1);
        Date end = new Date(year2 - 1900, month2, day2);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(p.getCategory()));
			pstmt.setString(2, p.getProductTitle());
			pstmt.setInt(3, Integer.parseInt(p.getLocal()));
			pstmt.setString(4, p.getAddress());
			pstmt.setDate(5, start);
			pstmt.setDate(6, end);
			pstmt.setInt(7, Integer.parseInt(p.getProductLevel()));
			pstmt.setInt(8, p.getRunTime());
			pstmt.setInt(9, p.getPrice());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertScreenInfo(Connection conn, String[] dateArray, String dayOrNight, int seatsNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLastPno");
		int num1 = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				num1 = rset.getInt("NUM");				
			}
			for(int i=0; i<dateArray.length; i++) {
				sql = prop.getProperty("insertScreenInfo");
				String date1 = dateArray[i];
				int year1 = Integer.parseInt(date1.substring(0, 4));
		        int month1 = Integer.parseInt(date1.substring(5, 7));
		        int day1 = Integer.parseInt(date1.substring(8, 10));
		        
		        month1--;

		        Date date = new Date(year1 - 1900, month1, day1);
		        
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, num1);
	            pstmt.setDate(2, date);
	            if(dayOrNight.equals("오전")) {
	            	pstmt.setString(3, "Y");
	            	pstmt.setString(4, "N");
	            	pstmt.setInt(5, seatsNum);
	            	pstmt.setInt(6, 0);
	            }else if(dayOrNight.equals("오후")) {
	            	pstmt.setString(3, "N");
	            	pstmt.setString(4, "Y");
	            	pstmt.setInt(5, 0);
	            	pstmt.setInt(6, seatsNum);
	            }else {
	            	pstmt.setString(3, "Y");
	            	pstmt.setString(4, "Y");
	            	pstmt.setInt(5, seatsNum);
	            	pstmt.setInt(6, seatsNum);
	            }
	            result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertImg(Connection conn, ProductIMG img) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLastPno");
		int num1 = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				num1 = rset.getInt("NUM");				
			}
			
			sql = prop.getProperty("insertImg");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num1);
			pstmt.setString(2, img.getPosterName());
			pstmt.setString(3, img.getDetail1Name());
			pstmt.setString(4, img.getDetail2Name());
			pstmt.setString(5, img.getDetail3Name());
			pstmt.setString(6, img.getDetail4Name());
			pstmt.setString(7, img.getDetail5Name());
			pstmt.setString(8, img.getImagePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
}

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

import com.kh.semi01.manager.common.model.vo.PageInfo;
import com.kh.semi01.manager.model.vo.Review;
import com.kh.semi01.manager.model.vo.Screening;
import com.kh.semi01.product.model.vo.Product;
import com.kh.semi01.product.model.vo.ProductIMG;

public class SearchDao {
private Properties prop = new Properties();
	
	public SearchDao(){
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/sql/search-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectProductListCountByLocal(Connection conn, String value) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductListCountByLocal");
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + value + "%");
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return result;
	}
	
	public int selectProductListCountByName(Connection conn, String value) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductListCountByName");
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + value + "%");
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return result;
	}
	
	public int selectProductListCountByNo(Connection conn, int value) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductListCountByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int selectListCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> searchProductByLocal(Connection conn, String local, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchProductByLocal");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + local + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> searchProductByName(Connection conn, String name, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchProductByName");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> searchProductByNo(Connection conn, int num, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchProductByNo");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> selectList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int getProductMovieCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getProductMovieCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int getProductDisplayCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getProductDisplayCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int getProductShowCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getProductShowCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> getMovieList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMovieList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> getDisplayList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getDisplayList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> getShowList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getShowList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Product selectManagerProduct(Connection conn, int productNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectManagerProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategory(rset.getString("category_name"));
				p.setProductTitle(rset.getString("product_title"));
				p.setLocal(rset.getString("local_title"));
				p.setAddress(rset.getString("address"));
				p.setStartPeriod(String.valueOf(rset.getDate("start_period")));
				p.setEndPeriod(String.valueOf(rset.getDate("end_period")));
				p.setProductLevel(rset.getString("level_name"));
				p.setRunTime(rset.getInt("run_time"));
				p.setPrice(rset.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public ProductIMG selectManagerProductImg(Connection conn, int productNo) {
		ProductIMG img = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectManagerProductImg");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new ProductIMG();
				img.setProductNo(productNo);
				img.setPosterName(rset.getString("poster_name"));
				img.setDetail1Name(rset.getString("detail1_name"));
				img.setDetail2Name(rset.getString("detail2_name"));
				img.setDetail3Name(rset.getString("detail3_name"));
				img.setDetail4Name(rset.getString("detail4_name"));
				img.setDetail5Name(rset.getString("detail5_name"));
				img.setImagePath(rset.getString("image_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;
	}
	
	public ArrayList<Screening> selectManagerScreenInfo(Connection conn, int productNo){
		ArrayList<Screening> list = new ArrayList<Screening>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectManagerScreenInfo");
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Screening s = new Screening();
				s.setProduct_no(productNo);
				s.setScreeningDate(String.valueOf(rset.getDate("screening_date")));
				s.setDayTime(rset.getString("screening_day_time"));
				s.setNightTime(rset.getString("screening_night_time"));
				s.setDaySeat(rset.getInt("screening_day_seat"));
				s.setNightSeat(rset.getInt("screening_night_seat"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(p.getCategory()));
			pstmt.setString(2, p.getProductTitle());
			pstmt.setInt(3, Integer.parseInt(p.getLocal()));
			pstmt.setString(4, p.getAddress());
			pstmt.setInt(5, Integer.parseInt(p.getProductLevel()));
			pstmt.setInt(6, p.getRunTime());
			pstmt.setInt(7, p.getPrice());
			pstmt.setInt(8, p.getProductNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertProductImg(Connection conn, ProductIMG img) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProductImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, img.getProductNo());
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
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProductImg(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProductImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public String[] selectImgFileList(Connection conn, int productNo) {
		String[] arr = new String[6];
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				arr[0] = rset.getString("poster_name");
				arr[1] = rset.getString("detail1_name");
				arr[2] = rset.getString("detail2_name");
				arr[3] = rset.getString("detail3_name");
				arr[4] = rset.getString("detail4_name");
				arr[5] = rset.getString("detail5_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return arr;
	}
	
	public int selectReviewCount(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Review> selectReviewList(Connection conn, int productNo, PageInfo pi){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setRno(rset.getInt("review_no"));
				r.setPno(rset.getInt("product_no"));
				r.setContent(rset.getString("review_content"));
				r.setUserNo(rset.getInt("user_no"));
				r.setReviewDate(String.valueOf(rset.getDate("review_date")));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int searchFileNameExist(Connection conn, String fileName) {
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		int count5 = 0;
		int count6 = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		try {
			String sql = prop.getProperty("searchFileNameExist1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count1 = rset.getInt("count");
			}
			
			sql = prop.getProperty("searchFileNameExist2");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count2 = rset.getInt("count");
			}
			
			sql = prop.getProperty("searchFileNameExist3");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count3 = rset.getInt("count");
			}
			
			sql = prop.getProperty("searchFileNameExist4");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count4 = rset.getInt("count");
			}
			
			sql = prop.getProperty("searchFileNameExist5");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count5 = rset.getInt("count");
			}
			
			sql = prop.getProperty("searchFileNameExist6");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count6 = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		int total = count1 + count2 + count3 + count4 + count5 + count6;
		
		return total;
	}
	
	public int selectReviewCountByUserNo(Connection conn, int productNo, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewCountByUserNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, Integer.parseInt(content));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int selectReviewCountByDate(Connection conn,int productNo, Date sqlDate) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewCountByDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setDate(2, sqlDate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Review> selectReviewListByUserNo(Connection conn,int productNo, String content, PageInfo pi){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewListByUserNo");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, Integer.parseInt(content));
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setRno(rset.getInt("review_no"));
				r.setPno(rset.getInt("product_no"));
				r.setContent(rset.getString("review_content"));
				r.setUserNo(rset.getInt("user_no"));
				r.setReviewDate(String.valueOf(rset.getDate("review_date")));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Review> selectReviewByReviewNo(Connection conn, int productNo, String content){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewByReviewNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, Integer.parseInt(content));
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setRno(rset.getInt("review_no"));
				r.setPno(rset.getInt("product_no"));
				r.setContent(rset.getString("review_content"));
				r.setUserNo(rset.getInt("user_no"));
				r.setReviewDate(String.valueOf(rset.getDate("review_date")));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Review> selectReviewListByDate(Connection conn,int productNo,Date sqldate,PageInfo pi){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewListByDate");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setDate(2, sqldate);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setRno(rset.getInt("review_no"));
				r.setPno(rset.getInt("product_no"));
				r.setContent(rset.getString("review_content"));
				r.setUserNo(rset.getInt("user_no"));
				r.setReviewDate(String.valueOf(rset.getDate("review_date")));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int deleteReview(Connection conn, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectReviewCountByRno(Connection conn, int productNo, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewCountByRno");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(content));
			pstmt.setInt(2, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProductReview(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProductReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProduct(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProductScreenInfo(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProductScreenInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int countImgFile(Connection conn, String fileName) {
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		int count5 = 0;
		int count6 = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String sql = prop.getProperty("countImgFile1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count1 = rset.getInt("count");
			}
			
			sql = prop.getProperty("countImgFile2");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count2 = rset.getInt("count");
			}
			
			sql = prop.getProperty("countImgFile3");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count3 = rset.getInt("count");
			}
			
			sql = prop.getProperty("countImgFile4");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count4 = rset.getInt("count");
			}
			
			sql = prop.getProperty("countImgFile5");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count5 = rset.getInt("count");
			}
			
			sql = prop.getProperty("countImgFile6");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count6 = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count1 + count2 + count3 + count4 + count5 + count6;
	}
}

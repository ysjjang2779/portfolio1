package com.kh.semi01.manager.model.service;

import static com.kh.semi01.common.JDBCTemplate.close;
import static com.kh.semi01.common.JDBCTemplate.commit;
import static com.kh.semi01.common.JDBCTemplate.getConnection;
import static com.kh.semi01.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.kh.semi01.manager.common.model.vo.PageInfo;
import com.kh.semi01.manager.model.dao.SearchDao;
import com.kh.semi01.manager.model.vo.Review;
import com.kh.semi01.manager.model.vo.Screening;
import com.kh.semi01.product.model.vo.Product;
import com.kh.semi01.product.model.vo.ProductIMG;

public class SearchService {

	public int selectProductListCountByLocal(String value) {
		Connection conn = getConnection();
		
		int count = new SearchDao().selectProductListCountByLocal(conn, value);
		
		close(conn);
		
		return count;
	}
	
	public int selectProductListCountByName(String value) {
		Connection conn = getConnection();
		
		int count = new SearchDao().selectProductListCountByName(conn, value);
		
		close(conn);
		
		return count;
	}
	
	public int selectProductListCountByNo(int value) {
		Connection conn = getConnection();
		
		int count = new SearchDao().selectProductListCountByNo(conn, value);
		
		close(conn);
		
		return count;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int count = new SearchDao().selectListCount(conn);
		
		close(conn);
		
		return count;
	}
	
	public ArrayList<Product> searchProductByLocal(String local, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new SearchDao().searchProductByLocal(conn, local, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> searchProductByName(String name, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new SearchDao().searchProductByName(conn, name, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> searchProductByNo(int num, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new SearchDao().searchProductByNo(conn, num, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new SearchDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int getProductMovieCount() {
		Connection conn = getConnection();
		
		int count = new SearchDao().getProductMovieCount(conn);
		
		close(conn);
		
		return count;
	}
	
	public int getProductDisplayCount() {
		Connection conn = getConnection();
		
		int count = new SearchDao().getProductDisplayCount(conn);
		
		close(conn);
		
		return count;
	}
	
	public int getProductShowCount() {
		Connection conn = getConnection();
		
		int count = new SearchDao().getProductShowCount(conn);
		
		close(conn);
		
		return count;
	}
	
	public ArrayList<Product> getMovieList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new SearchDao().getMovieList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> getDisplayList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new SearchDao().getDisplayList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> getShowList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new SearchDao().getShowList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Product selectManagerProduct(int productNo) {
		Connection conn = getConnection();
		
		Product p = new SearchDao().selectManagerProduct(conn, productNo);
		
		close(conn);
		
		return p;
	}
	
	public ProductIMG selectManagerProductImg(int productNo) {
		Connection conn = getConnection();
		
		ProductIMG img = new SearchDao().selectManagerProductImg(conn, productNo);
		
		close(conn);
		
		return img;
	}
	
	public ArrayList<Screening> selectManagerScreenInfo(int productNo){
		Connection conn = getConnection();
		
		ArrayList<Screening> list = new SearchDao().selectManagerScreenInfo(conn, productNo);
		
		close(conn);
		
		return list;
	}
	
	public int updateProduct(Product p, ProductIMG img) {
		Connection conn = getConnection();
		
		int result1 = new SearchDao().updateProduct(conn, p);
		int result2 = new SearchDao().deleteProductImg(conn, p.getProductNo());
		int result3 = new SearchDao().insertProductImg(conn, img);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 * result3;
	}
	
	public String[] selectImgFileList(int productNo) {
		Connection conn = getConnection();
		
		String[] arr = new SearchDao().selectImgFileList(conn, productNo);
		
		close(conn);
		
		return arr;
	}
	
	public int selectReviewCount(int productNo) {
		Connection conn = getConnection();
		
		int count = new SearchDao().selectReviewCount(conn, productNo);
		
		close(conn);
		
		return count;
	}
	
	public ArrayList<Review> selectReviewList(int productNo, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Review> list = new SearchDao().selectReviewList(conn, productNo, pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectFileNameExist(String fileName) {
		Connection conn = getConnection();
		
		int count = new SearchDao().searchFileNameExist(conn, fileName);
		
		close(conn);
		
		return count;
	}
	
	public int selectReviewCountByUserNo(int productNo, String content) {
		Connection conn = getConnection();
		
		int count = new SearchDao().selectReviewCountByUserNo(conn, productNo, content);
		
		close(conn);
		
		return count;
	}
	
	public int selectReviewCountByDate(int productNo, String content) {
		Connection conn = getConnection();
		Date sqlDate = null;
		try {
            // SimpleDateFormat을 사용하여 문자열을 java.util.Date 객체로 파싱합니다.
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            java.util.Date utilDate = sdf.parse(content);
            
            // java.util.Date 객체를 java.sql.Date 객체로 변환합니다.
            sqlDate = new Date(utilDate.getTime());
            
            System.out.println("SQL Date: " + sqlDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
		
		int count = new SearchDao().selectReviewCountByDate(conn,productNo, sqlDate);
		
		close(conn);
		
		return count;
	}
	
	public ArrayList<Review> selectReviewListByUserNo(int productNo, String content, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Review> list = new SearchDao().selectReviewListByUserNo(conn,productNo , content, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Review> selectReviewByReviewNo(int productNo, String content){
		Connection conn = getConnection();
		
		ArrayList<Review> list = new SearchDao().selectReviewByReviewNo(conn, productNo, content);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Review> selectReviewListByDate(int productNo,String content,PageInfo pi){
		Connection conn = getConnection();
		
		Date sqlDate = null;
		try {
            // SimpleDateFormat을 사용하여 문자열을 java.util.Date 객체로 파싱합니다.
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            java.util.Date utilDate = sdf.parse(content);
            
            // java.util.Date 객체를 java.sql.Date 객체로 변환합니다.
            sqlDate = new Date(utilDate.getTime());
            
            System.out.println("SQL Date: " + sqlDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
		
		ArrayList<Review> list = new SearchDao().selectReviewListByDate(conn, productNo, sqlDate, pi);
		
		close(conn);
		
		return list;
	}
	
	public int deleteReview(int rno) {
		Connection conn = getConnection();
		
		int result = new SearchDao().deleteReview(conn, rno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int selectReviewCountByRno(int productNo, String content) {
		Connection conn = getConnection();
		
		int count = new SearchDao().selectReviewCountByRno(conn, productNo, content);
		
		close(conn);
		
		return count;
	}
	
	public int deleteProduct(int productNo) {
		Connection conn = getConnection();
		
		int result1 = new SearchDao().deleteProductImg(conn, productNo);
		int result2 = new SearchDao().deleteProductReview(conn, productNo);
		int result3 = new SearchDao().deleteProductScreenInfo(conn, productNo);
		int result4 = new SearchDao().deleteProduct(conn, productNo);
		
		if(result4 > 0) {
			commit(conn);			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result4;
	}
	
	public int countImgFile(String fileName) {
		Connection conn = getConnection();
		
		int count = new SearchDao().countImgFile(conn, fileName);
		
		close(conn);
		
		return count;
	}
}

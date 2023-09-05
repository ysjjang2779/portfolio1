package com.kh.semi01.manager.model.service;

import static com.kh.semi01.common.JDBCTemplate.close;
import static com.kh.semi01.common.JDBCTemplate.commit;
import static com.kh.semi01.common.JDBCTemplate.getConnection;
import static com.kh.semi01.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi01.manager.model.dao.RegistDao;
import com.kh.semi01.manager.model.dao.SearchDao;
import com.kh.semi01.manager.model.vo.DataClass;
import com.kh.semi01.manager.model.vo.Select;
import com.kh.semi01.product.model.vo.Product;
import com.kh.semi01.product.model.vo.ProductIMG;

public class RegistService {

	public ArrayList<Select> getMovieSelectBoxList() {
		Connection conn = getConnection();
		
		ArrayList<Select> sel = new RegistDao().getMovieSelectBoxList(conn);
		
		close(conn);
		
		return sel;
	}
	
	public ArrayList<Select> getDisplaySelectBoxList(){
		Connection conn = getConnection();
		
		ArrayList<Select> sel = new RegistDao().getDisplaySelectBoxList(conn);
		
		close(conn);
		
		return sel;
	}
	
	public ArrayList<Select> getShowSelectBoxList(){
		Connection conn = getConnection();
		
		ArrayList<Select> sel = new RegistDao().getShowSelectBoxList(conn);
		
		close(conn);
		
		return sel;
	}
	
	public int insertProduct(Product p, ProductIMG img, String dayOrNight, int seatsNum) {
		Connection conn = getConnection();
		
		int result1 = new RegistDao().insertProduct(conn, p);
		int result2 = new RegistDao().insertImg(conn, img);
		
		LocalDate startDate = LocalDate.parse(p.getStartPeriod());
        LocalDate endDate = LocalDate.parse(p.getEndPeriod());

        List<String> dateList = new ArrayList<>();
        while (!startDate.isAfter(endDate)) {
            dateList.add(startDate.toString());
            startDate = startDate.plusDays(1);
        }

        String[] dateArray = dateList.toArray(new String[0]);
        
        int result3 = new RegistDao().insertScreenInfo(conn, dateArray, dayOrNight, seatsNum);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 * result3;
	}
}

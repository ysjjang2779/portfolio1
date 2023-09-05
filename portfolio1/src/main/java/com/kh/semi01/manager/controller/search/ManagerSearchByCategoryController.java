package com.kh.semi01.manager.controller.search;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi01.manager.common.model.vo.PageInfo;
import com.kh.semi01.manager.model.service.SearchService;
import com.kh.semi01.product.model.vo.Product;

/**
 * Servlet implementation class ManagerSearchByCategoryController
 */
@WebServlet("/manager-search-bycategory.do")
public class ManagerSearchByCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSearchByCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int listCount = 0;
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		
		int maxPage; 
		int startPage; 
		int endPage; 
		
		String category = request.getParameter("category");	
		if(category.equals("영화")){
			listCount = new SearchService().getProductMovieCount();
		}else if(category.equals("전시")){
			listCount = new SearchService().getProductDisplayCount();
		}else if(category.equals("공연")) {
			listCount = new SearchService().getProductShowCount();
		}else {
			listCount = new SearchService().selectListCount();
		}
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 25;
		
		maxPage = (int)Math.ceil((float)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Product> list = null;
		if(category.equals("영화")){
			list = new SearchService().getMovieList(pi);
		}else if(category.equals("전시")){
			list = new SearchService().getDisplayList(pi);
		}else if(category.equals("공연")) {
			list = new SearchService().getShowList(pi);
		}else {
			list = new SearchService().selectList(pi);
		}
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
	
		request.getRequestDispatcher("views/manager/manager-search.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

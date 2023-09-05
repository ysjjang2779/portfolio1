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
 * Servlet implementation class ManagerSearchController
 */
@WebServlet("/manager-search.do")
public class ManagerSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount = 0;
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		
		int maxPage; 
		int startPage; 
		int endPage; 
		String value = "";
		int number = 0;
		if(request.getParameter("searchType1") != null && request.getParameter("searchType1").equals("지역")) {
			value = request.getParameter("searchVal");
		}else if(request.getParameter("searchType1") != null && request.getParameter("searchType1").equals("상품이름")){
			value = request.getParameter("searchVal");
		}else if(request.getParameter("searchType1") != null && request.getParameter("searchType1").equals("상품번호")) {
			number = Integer.parseInt(request.getParameter("searchVal"));			
		}
		if(request.getParameter("searchType1") != null)
		{
			if(request.getParameter("searchType1").equals("지역")) {
				listCount = new SearchService().selectProductListCountByLocal(value);			
			}else if(request.getParameter("searchType1").equals("상품이름")){
				listCount = new SearchService().selectProductListCountByName(value);
			}else if(request.getParameter("searchType1").equals("상품번호")) {
				listCount = new SearchService().selectProductListCountByNo(number);
			}
		}else{
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
		if(request.getParameter("searchType1") != null)
		{
			if(request.getParameter("searchType1").equals("지역")) {
				list = new SearchService().searchProductByLocal(value, pi);
			}else if(request.getParameter("searchType1").equals("상품이름")){
				list = new SearchService().searchProductByName(value, pi);
			}else if(request.getParameter("searchType1").equals("상품번호")) {
				list = new SearchService().searchProductByNo(number, pi);
			}
		}else {
			list = new SearchService().selectList(pi);
			request.setAttribute("isfirst", "1");
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

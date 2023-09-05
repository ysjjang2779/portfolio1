package com.kh.semi01.manager.controller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi01.manager.common.model.vo.PageInfo;
import com.kh.semi01.manager.model.service.MemberService;
import com.kh.semi01.user.model.vo.User;

/**
 * Servlet implementation class ManagerMemberSearchController
 */
@WebServlet("/manager-member-search.do")
public class ManagerMemberSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		
		int maxPage; 
		int startPage; 
		int endPage; 
		
		String select = request.getParameter("select");
		if(select.equals("user_no")) {
			int userNo = Integer.parseInt(request.getParameter("val"));
			listCount = new MemberService().selectListCountByUserNo(userNo);
			currentPage = Integer.parseInt(request.getParameter("cpage"));
			pageLimit = 10;
			boardLimit = 23;
			
			maxPage = (int)Math.ceil((float)listCount / boardLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			ArrayList<User> list = new MemberService().searchMemberByUserNo(userNo, pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		}else if(select.equals("user_id")){
			String userId = request.getParameter("val");
			listCount = new MemberService().selectListCountByUserId(userId);
			currentPage = Integer.parseInt(request.getParameter("cpage"));
			pageLimit = 10;
			boardLimit = 23;
			
			maxPage = (int)Math.ceil((float)listCount / boardLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			ArrayList<User> list = new MemberService().searchMemberByUserId(userId, pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		}else {
			String userName = request.getParameter("val");
			listCount = new MemberService().selectListCountByUserName(userName);
			currentPage = Integer.parseInt(request.getParameter("cpage"));
			pageLimit = 10;
			boardLimit = 23;
			
			maxPage = (int)Math.ceil((float)listCount / boardLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			ArrayList<User> list = new MemberService().searchMemberByUserName(userName, pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		}
		request.getRequestDispatcher("views/manager/manager-member.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

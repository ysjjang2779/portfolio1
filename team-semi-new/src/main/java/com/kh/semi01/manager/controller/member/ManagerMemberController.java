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
 * Servlet implementation class ManagerMemberController
 */
@WebServlet("/manager-member.do")
public class ManagerMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberController() {
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
		String value = request.getParameter("searchKey");
		if(request.getParameter("searchType") != null)
		{
			if(request.getParameter("searchType").equals("회원아이디")) {
				listCount = new MemberService().selectListCountByUserId(value);			
			}else if(request.getParameter("searchType").equals("회원명")){
				listCount = new MemberService().selectListCountByUserName(value);
			}else if(request.getParameter("searchType").equals("회원번호")) {
				listCount = new MemberService().selectListCountByUserNo(Integer.parseInt(value));
			}
		}else {
			listCount = new MemberService().selectListCount();
		}
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
		ArrayList<User> list = null;
		if(request.getParameter("searchType") != null)
		{
			if(request.getParameter("searchType").equals("회원아이디")) {
				list = new MemberService().searchMemberByUserId(value, pi);
			}else if(request.getParameter("searchType").equals("회원명")){
				list = new MemberService().searchMemberByUserName(value, pi);
			}else if(request.getParameter("searchType").equals("회원번호")) {
				list = new MemberService().searchMemberByUserNo(Integer.parseInt(value), pi);
			}
		}else {
			list = new MemberService().selectList(pi);
			request.setAttribute("isfirst", "1");
		}
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
	
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

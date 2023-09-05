package com.kh.semi01.manager.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.semi01.manager.model.service.MemberService;
import com.kh.semi01.user.model.vo.User;

/**
 * Servlet implementation class ManagerMemberReadController
 */
@WebServlet("/manager-member-read.do")
public class ManagerMemberReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNum"));
		User u = new MemberService().selectManagerMember(userNo);
		
		JSONObject jObj = new JSONObject(); 
		jObj.put("userNo", u.getUserNo()); 
		jObj.put("userId", u.getUserId()); 
		jObj.put("userPwd", u.getUserPwd());
		jObj.put("userName", u.getUserName());
		jObj.put("userBirth", u.getUserBirth());
		jObj.put("interestMovie", u.getInterestMovie());
		jObj.put("interestDisplay", u.getInterestDisplay());
		jObj.put("interestShow", u.getInterestShow());
		jObj.put("email", u.getEmail());
		jObj.put("phone", u.getPhone());
		jObj.put("gradeNo", u.getGrade());
		jObj.put("status", u.getStatus());
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

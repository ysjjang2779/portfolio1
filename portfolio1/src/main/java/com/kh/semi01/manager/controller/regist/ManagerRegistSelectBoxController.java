package com.kh.semi01.manager.controller.regist;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi01.manager.model.service.RegistService;
import com.kh.semi01.manager.model.vo.Select;

/**
 * Servlet implementation class ManagerRegistSelectBoxController
 */
@WebServlet("/manager-regist-selectbox.do")
public class ManagerRegistSelectBoxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerRegistSelectBoxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String selectedValue = request.getParameter("selectedValue");
		ArrayList<Select> sel = null;
		if(selectedValue.equals("movie")) {
			sel = new RegistService().getMovieSelectBoxList();
		}else if(selectedValue.equals("display")) {
			sel = new RegistService().getDisplaySelectBoxList();
		}else if(selectedValue.equals("show")) {
			sel = new RegistService().getShowSelectBoxList();
		}
		
		response.setContentType("application/json"); 
		Gson gson = new Gson();
        String json = gson.toJson(sel);

        response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

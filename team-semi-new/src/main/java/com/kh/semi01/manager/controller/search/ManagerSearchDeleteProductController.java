package com.kh.semi01.manager.controller.search;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi01.manager.model.service.SearchService;

/**
 * Servlet implementation class ManagerSearchDeleteProductController
 */
@WebServlet("/manager-delete.do")
public class ManagerSearchDeleteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSearchDeleteProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		String[] arr = new SearchService().selectImgFileList(pno);
		int[] count = new int[arr.length];
		for(int i=0; i<count.length; i++) {
			count[i] = new SearchService().countImgFile(arr[i]);
		}
		
		for(int i=0; i<arr.length; i++) {
			if(arr[i] != null && count[i] < 2) {
				String savePath = "C:\\Users\\mjkim\\Desktop\\portfolio1\\team-semi-new\\src\\main\\webapp\\resources\\product_upfiles";
		        String filePath = savePath + File.separator + arr[i];
		        File file = new File(filePath);

		        if (file.exists()) {
		            if (file.delete()) {
		                System.out.println("파일 삭제 성공");
		            } else {
		                System.out.println("파일 삭제 실패");
		            }
		        } else {
		            System.out.println("파일이 존재하지 않습니다.");
		        }
			} 
		} 
		
		int result = new SearchService().deleteProduct(pno);
		if(result > 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/manager-search.do?cpage=1");
	        dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

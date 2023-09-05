package com.kh.semi01.manager.controller.regist;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi01.manager.model.service.RegistService;
import com.kh.semi01.product.model.vo.Product;
import com.kh.semi01.product.model.vo.ProductIMG;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ManagerRegistProductController
 */
@WebServlet("/manager-regist-product.do")
public class ManagerRegistProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerRegistProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");

        //String savePath = request.getSession().getServletContext().getContext("/resources").getRealPath("");
        String savePath = "C:\\Users\\mjkim\\Desktop\\portfolio1\\team-semi-new\\src\\main\\webapp\\resources\\product_upfiles";
        int maxSize = 10 * 1024 * 1024; 

        MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8");
        Product p = new Product();
        ProductIMG img = new ProductIMG();

        String[] inputNames = {"customFile1", "customFile2", "customFile3", "customFile4", "customFile5", "customFile6"};
        // int count = 0;
        for (String inputName : inputNames) {
            if (multiRequest.getFile(inputName) != null) {
                String originalFileName = multiRequest.getOriginalFileName(inputName);
                String savedFileName = multiRequest.getFilesystemName(inputName);
                /*
                count++;
                if(count == 1) {
                	img.setPosterName(savedFileName);
                	p.setPosterName(savedFileName);
                }else if(count == 2) {
                	img.setDetail1Name(savedFileName);
                }else if(count == 3) {
                	img.setDetail2Name(savedFileName);
                }else if(count == 4) {
                	img.setDetail3Name(savedFileName);
                }else if(count == 5) {
                	img.setDetail4Name(savedFileName);
                }else if(count == 6) {
                	img.setDetail5Name(savedFileName);
                }
                img.setImagePath(savePath);
                */
                if(inputName.equals("customFile1")) {
                	img.setPosterName(savedFileName);
                	p.setPosterName(savePath);
                }else if(inputName.equals("customFile2")) {
                	img.setDetail1Name(savedFileName);
                }else if(inputName.equals("customFile3")) {
                	img.setDetail2Name(savedFileName);
                }else if(inputName.equals("customFile4")) {
                	img.setDetail3Name(savedFileName);
                }else if(inputName.equals("customFile5")) {
                	img.setDetail4Name(savedFileName);
                }else if(inputName.equals("customFile6")) {
                	img.setDetail5Name(savedFileName);
                }
            }
        }
        
        img.setImagePath(savePath);
        
        String smallCategory = multiRequest.getParameter("salsa2");
        String title = multiRequest.getParameter("title");
        String local = multiRequest.getParameter("salsa3");
        String address = multiRequest.getParameter("place");
        int time = Integer.parseInt(multiRequest.getParameter("time"));
        
        String startDate = multiRequest.getParameter("date1");
        String endDate = multiRequest.getParameter("date2");
        
	    String dayOrNight = multiRequest.getParameter("salsa4");
	    String possibleAge = multiRequest.getParameter("salsa5");
	    int price = Integer.parseInt(multiRequest.getParameter("price"));
	    int seatsNum = Integer.parseInt(multiRequest.getParameter("seatsNum"));
	    
	    p.setCategory(smallCategory);
	    p.setProductTitle(title);
	    p.setLocal(local);
	    p.setAddress(address);
	    p.setStartPeriod(startDate);
	    p.setEndPeriod(endDate);
	    p.setProductLevel(possibleAge);
	    p.setRunTime(time);
	    p.setPrice(price);
	    p.setImage(savePath);
	    int result = new RegistService().insertProduct(p, img, dayOrNight, seatsNum);
	    if(result > 0) {
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/manager-search.do?cpage=1");
	    	dispatcher.forward(request, response);
	    }else {
	    	System.out.println("상품등록 실패 FAILED");
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

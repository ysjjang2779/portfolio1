package com.kh.semi01.manager.controller.search;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.semi01.manager.model.service.SearchService;
import com.kh.semi01.manager.model.vo.Screening;
import com.kh.semi01.product.model.vo.Product;
import com.kh.semi01.product.model.vo.ProductIMG;

/**
 * Servlet implementation class ManagerSearchReadController
 */
@WebServlet("/manager-search-read.do")
public class ManagerSearchReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSearchReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int productNo = Integer.parseInt(request.getParameter("productNum"));
		Product p = new SearchService().selectManagerProduct(productNo);
		ProductIMG img = new SearchService().selectManagerProductImg(productNo);
		ArrayList<Screening> screenList = new SearchService().selectManagerScreenInfo(productNo);
		String dayTime = screenList.get(0).getDayTime();
		String noonTime = screenList.get(0).getNightTime();
		JSONObject jObj = new JSONObject(); 
		jObj.put("productNo", p.getProductNo()); 
		jObj.put("category", p.getCategory());
		jObj.put("title", p.getProductTitle());
		jObj.put("local", p.getLocal());
		jObj.put("address", p.getAddress());
		jObj.put("start", p.getStartPeriod());
		jObj.put("end", p.getEndPeriod());
		jObj.put("level", p.getProductLevel());
		jObj.put("runtime", p.getRunTime());
		jObj.put("price", p.getPrice());
		jObj.put("posterName", img.getPosterName());
		jObj.put("detail1Name", img.getDetail1Name());
		jObj.put("detail2Name", img.getDetail2Name());
		jObj.put("detail3Name", img.getDetail3Name());
		jObj.put("detail4Name", img.getDetail4Name());
		jObj.put("detail5Name", img.getDetail5Name());
		jObj.put("imagePath", img.getImagePath());
		jObj.put("dayTime", dayTime);
		jObj.put("noonTime", noonTime);
		if(dayTime.equals("Y") && noonTime.equals("Y")) {
			jObj.put("daySeats", screenList.get(0).getDaySeat());
			jObj.put("noonSeats", screenList.get(0).getNightSeat());
		}else if(dayTime.equals("N") && noonTime.equals("Y")) {
			jObj.put("daySeats", 0);
			jObj.put("noonSeats", screenList.get(0).getNightSeat());
		}else {
			jObj.put("daySeats", screenList.get(0).getDaySeat());
			jObj.put("noonSeats", 0);
		}
		String posterPath = img.getImagePath() + File.separator + img.getPosterName();
	    String posterBase64 = encodeImageToBase64(posterPath);
	    jObj.put("posterImage", posterBase64);
	    if(img.getDetail1Name() != null) {
	    	String detail1Path = img.getImagePath() + File.separator + img.getDetail1Name();
	    	String detail1Base64 =encodeImageToBase64(detail1Path);
	    	jObj.put("detail1Image", detail1Base64);
	    }
	    if(img.getDetail2Name() != null) {
	    	String detail2Path = img.getImagePath() + File.separator + img.getDetail2Name();
	    	String detail2Base64 =encodeImageToBase64(detail2Path);
	    	jObj.put("detail2Image", detail2Base64);
	    }
	    if(img.getDetail3Name() != null) {
	    	String detail3Path = img.getImagePath() + File.separator + img.getDetail3Name();
	    	String detail3Base64 =encodeImageToBase64(detail3Path);
	    	jObj.put("detail3Image", detail3Base64);
	    }
	    if(img.getDetail4Name() != null) {
	    	String detail4Path = img.getImagePath() + File.separator + img.getDetail4Name();
	    	String detail4Base64 =encodeImageToBase64(detail4Path);
	    	jObj.put("detail4Image", detail4Base64);
	    }
	    if(img.getDetail5Name() != null) {
	    	String detail5Path = img.getImagePath() + File.separator + img.getDetail5Name();
	    	String detail5Base64 =encodeImageToBase64(detail5Path);
	    	jObj.put("detail5Image", detail5Base64);
	    }
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
	}
	
	private String encodeImageToBase64(String imagePath) throws IOException {
	    Path path = Paths.get(imagePath);
	    byte[] imageData = Files.readAllBytes(path);
	    return Base64.getEncoder().encodeToString(imageData);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

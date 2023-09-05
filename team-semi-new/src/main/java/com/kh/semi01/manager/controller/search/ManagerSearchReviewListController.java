package com.kh.semi01.manager.controller.search;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.semi01.manager.common.model.vo.PageInfo;
import com.kh.semi01.manager.model.service.SearchService;
import com.kh.semi01.manager.model.vo.Review;

/**
 * Servlet implementation class ManagerSearchReviewListController
 */
@WebServlet("/manager-search-reviewList.do")
public class ManagerSearchReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSearchReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int productNo = Integer.parseInt(request.getParameter("pno"));
		String type = request.getParameter("reviewSearchType");
		String content = request.getParameter("reviewSearchContent");
		int listCount = 0; // 현재 총 게시글 개수
		int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대개수(몇개 단위씩)
		int boardLimit; // 한 페이지내에 보여질 게시글 최대 개수(몇개 단위씩)
		
		// 위의 4개를 가지고 아래 3개의 값을 구해낼꺼임
		int maxPage; // 가장 마지막페이지 (총 페이지 수)
		int startPage; // 페이징바의 시작수
		int endPage; // 페이징바의 끝수
		
		// * listCount : 총 게시글 개수
		
		if(!type.equals("") && !content.equals("")) {
			if(type.equals("회원번호")) {
				listCount = new SearchService().selectReviewCountByUserNo(productNo ,content);
			}else if(type.equals("리뷰번호")) {
				listCount = new SearchService().selectReviewCountByRno(productNo, content);
			}else if(type.equals("리뷰작성날짜")) {
				listCount = new SearchService().selectReviewCountByDate(productNo ,content);
			}
		}else {
			listCount = new SearchService().selectReviewCount(productNo);	
		}
		
		// * currentPage : 현재 페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		// * pageLimit : 페이징바의 페이지 최대 개수
		pageLimit = 5;
		// * boardLimit : 게시글 최대 개수
		boardLimit = 10;
		
		maxPage = (int) Math.ceil((float)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		// * 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 boardLimit 수만큼 조회해가기
		ArrayList<Review> list = new ArrayList<Review>();
		
		if(!type.equals("") && !content.equals("")) {
			if(type.equals("회원번호")) {
				list = new SearchService().selectReviewListByUserNo(productNo, content, pi);
			}else if(type.equals("리뷰번호")) {
				list = new SearchService().selectReviewByReviewNo(productNo, content);
			}else if(type.equals("리뷰작성날짜")) {
				list = new SearchService().selectReviewListByDate(productNo, content, pi);
			}
		}else {
			list = new SearchService().selectReviewList(productNo, pi);	
		}
				
		JSONObject json = new JSONObject();
	    json.put("pi", pi);
	    
	    JSONArray reviewArray = new JSONArray();
	    for (Review review : list) {
	        JSONObject reviewJson = new JSONObject();
	        reviewJson.put("rno", review.getRno());
	        reviewJson.put("pno", review.getPno());
	        reviewJson.put("content", review.getContent());
	        reviewJson.put("userNo", review.getUserNo());
	        reviewJson.put("reviewDate", review.getReviewDate());
	        reviewArray.add(reviewJson);
	    }
	    json.put("reviews", reviewArray);

	    // JSON 데이터를 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonData = objectMapper.writeValueAsString(json);

	    // 응답 설정
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // JSON 데이터를 응답으로 보내기
	    response.getWriter().write(jsonData);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

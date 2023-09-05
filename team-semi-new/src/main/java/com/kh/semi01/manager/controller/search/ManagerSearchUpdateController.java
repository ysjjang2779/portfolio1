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
import com.kh.semi01.product.model.vo.Product;
import com.kh.semi01.product.model.vo.ProductIMG;


/**
 * Servlet implementation class ManagerSearchUpdateController
 */
@WebServlet("/manager-search-update.do")
public class ManagerSearchUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSearchUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

        //String savePath = request.getSession().getServletContext().getContext("/resources").getRealPath("");
        String savePath = "C:\\Users\\mjkim\\Desktop\\team-semi-new\\team-semi-new\\src\\main\\webapp\\resources\\product_upfiles";
        int maxSize = 10 * 1024 * 1024; 
                
        MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8");
        
        String fileName1 = multiRequest.getParameter("fileName1");
        String fileName2 = multiRequest.getParameter("fileName2");
        String fileName3 = multiRequest.getParameter("fileName3");
        String fileName4 = multiRequest.getParameter("fileName4");
        String fileName5 = multiRequest.getParameter("fileName5");
        String fileName6 = multiRequest.getParameter("fileName6");
        
        if(!fileName1.equals("")) {
        	int count = new SearchService().selectFileNameExist(fileName1);
        	if(count == 1) {
        		deleteUploadedFile(fileName1);        		
        	}
        }
        if(!fileName2.equals("")) {
        	int count = new SearchService().selectFileNameExist(fileName2);
        	if(count == 1) {
        		deleteUploadedFile(fileName2);        		
        	}
        }
        if(!fileName3.equals("")) {
        	int count = new SearchService().selectFileNameExist(fileName3);
        	if(count == 1) {
        		deleteUploadedFile(fileName3);
        	}
        }
        if(!fileName4.equals("")) {
        	int count = new SearchService().selectFileNameExist(fileName4);
        	if(count == 1) {
        		deleteUploadedFile(fileName4);
        	}
        }
        if(!fileName5.equals("")) {
        	int count = new SearchService().selectFileNameExist(fileName5);
        	if(count == 1) {
        		deleteUploadedFile(fileName5);        		
        	}
        }
        if(!fileName6.equals("")) {
        	int count = new SearchService().selectFileNameExist(fileName6);
        	if(count == 1) {
        		deleteUploadedFile(fileName6);
        	}
        }
        
        int pno = Integer.parseInt(multiRequest.getParameter("apno"));
        String category = multiRequest.getParameter("acategory");
        String title = multiRequest.getParameter("atitle");
        String local = multiRequest.getParameter("alocal");
        String address = multiRequest.getParameter("aaddress");
        String level = multiRequest.getParameter("alevel");
        int runtime = Integer.parseInt(multiRequest.getParameter("aruntime"));
        int price = Integer.parseInt(multiRequest.getParameter("aprice"));
        
        Product p = new Product();
        p.setProductNo(pno);
        p.setCategory(category);
        p.setProductTitle(title);
        p.setLocal(local);
        p.setAddress(address);
        p.setProductLevel(level);
        p.setRunTime(runtime);
        p.setPrice(price);
        
        ProductIMG img = new ProductIMG();
        img.setProductNo(pno);
        img.setImagePath(savePath);
        int count = 0;
        String[] arr = new SearchService().selectImgFileList(pno);
        img.setPosterName(arr[0]);
        img.setDetail1Name(arr[1]);
        img.setDetail2Name(arr[2]);
        img.setDetail3Name(arr[3]);
        img.setDetail4Name(arr[4]);
        img.setDetail5Name(arr[5]);
      
        String[] inputNames = {"customFile1", "customFile2", "customFile3", "customFile4", "customFile5", "customFile6"};
        for (String inputName : inputNames) {
            if (multiRequest.getFile(inputName) != null) {
                String originalFileName = multiRequest.getOriginalFileName(inputName);
                String savedFileName = multiRequest.getFilesystemName(inputName);      
                
                if(inputName.equals("customFile1")) {
                	if(img.getPosterName() != savedFileName) {
                		img.setPosterName(savedFileName);
                	}
                }else if(inputName.equals("customFile2")) {
                	if(img.getDetail1Name() != savedFileName) {
                		img.setDetail1Name(savedFileName);
                	}
                }else if(inputName.equals("customFile3")) {
                	if(img.getDetail2Name() != savedFileName) {
                		img.setDetail2Name(savedFileName);
                	}
                }else if(inputName.equals("customFile4")) {
                	if(img.getDetail3Name() != savedFileName) {
                		img.setDetail3Name(savedFileName);
                	}
                }else if(inputName.equals("customFile5")) {
                	if(img.getDetail4Name() != savedFileName) {
                		img.setDetail4Name(savedFileName);
                	}
                }else if(inputName.equals("customFile6")) {
                	if(img.getDetail5Name() != savedFileName) {
                		img.setDetail5Name(savedFileName);
                	}
                }
          
            }
        }
        
        int result = new SearchService().updateProduct(p, img);
        if(result > 0) {
        	System.out.println("수정 성공");
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/manager-search.do?cpage=1");
        	dispatcher.forward(request, response);
        }else {
        	System.out.println("수정 실패");
        }
	}
	
	private void deleteUploadedFile(String fileName) {
        String savePath = "C:\\Users\\mjkim\\Desktop\\team-semi-new\\team-semi-new\\src\\main\\webapp\\resources\\product_upfiles";
        String filePath = savePath + File.separator + fileName;
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

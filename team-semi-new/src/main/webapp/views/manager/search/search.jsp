<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.kh.semi01.manager.common.model.vo.PageInfo" %>
<%@page import="com.kh.semi01.product.model.vo.Product" %>
<%@page import="java.util.ArrayList" %>

<%
	String contextPath = request.getContextPath();
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <title>Document</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>
      div{box-sizing: border-box;}
      body{
      font-family: 'Jua', sans-serif;
      }
      #tb1{
        width: 100%;
        table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
        width: 100%; /* 테이블 전체 너비 설정 */
      }
      td {
        max-height: 1.5em;
        /*overflow: hidden;*/
        white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
        text-overflow: ellipsis; /* ...으로 텍스트 표시 */
      }
      #tb1 tr:last-child{
        border-bottom: none;
      }
      #tb1 tr{
        text-align: center;
        display: block;
        border-bottom: 2px solid #ABBBC7;
        width: 100%;
        display: flex;
      }
      #tb1 tr:not(:first-child){
        cursor: pointer;
      }
      #tb1 tr th:not(:last-child){
        border-right: 2px solid #ABBBC7;
        display: block;
      }
      #tb1 tr td:not(:last-child){
        border-right: 2px solid #ABBBC7;
        display: block;
      }
      #td1{
        width: 10%;
      }
      #td2{
        width: 39%;
      }
      #td3{
        width: 13%;
      }
      #td4{
        width: 13%;
      }
      #td5{
        width: 10%;
        border-right: none;
      }
      #td6{
        width: 8%;
      }
      #td7{
        width: 5%;
      }
      #td8{
        width: 5%;
      }
      #buttondiv{
        width: 396px;
        margin: auto;
        margin-top: 28px;
        display: flex;
      }
      #buttondiv>.btn2{
        width: 31px;
        height: 31px;
        display: block;
        margin-right: 2px;
        border-radius: 5px;
        border: none;
        background-color: #ABBBC7;
        font-weight: bold;
        cursor: pointer;
      }
      #buttondiv>.btn2:hover{
        background-color: darkgray;
      }
      #tb1 tr:not(:first-child):hover{
        background-color: darkgray;
        font-weight: bold;
      }
      #tb1 button{
        border: none;
        border-radius: 5px;
        width: 100%;
        height: 100%;
      }
      #tb1 button:hover{
        cursor: pointer;
        background-color: darkgray;
        font-weight: bold;
        color: black;
      }
      .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
      align-items: center;
      justify-content: center;
    }
    .modal1{
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
      align-items: center;
      justify-content: center;
    }
    .modal2{
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
      align-items: center;
      justify-content: center;
    }
    .modal-content {
    background-color: #C9D9E6;
    padding: 5px;
    border: 1px solid #888;
    width: 658px;
    height: 657px;
    margin: auto;
    margin-top: 4px;
    border-radius: 10px;
    }
    .modal-content1{
      background-color: #C9D9E6;
      padding: 5px;
      border: 1px solid #888;
      width: 750px;
      height: 380px;
      margin: auto;
      margin-top: 132px;
      border-radius: 10px;
    }
    .modal-content2{
      background-color: #C9D9E6;
      padding: 5px;
      border: 1px solid #888;
      width: 647px;
      height: 577px;
      margin: auto;
      margin-top: 39px;
      border-radius: 10px;
    }
    .close {
    color: black;
    font-size: 28px;
    font-weight: bold;
    display: block;
    width: 20px;
    height: 29px;
    text-align: center;
    margin-left: 625px;
    margin-top: -7px;
    margin-bottom: 2px;
    }
    .close1{
      color: black;
      font-size: 28px;
      font-weight: bold;
      display: block;
      width: 20px;
      height: 29px;
      text-align: center;
      margin-left: 716px;
      margin-top: -7px;
      margin-bottom: 2px;
    }
    .close2{
      color: black;
      font-size: 28px;
      font-weight: bold;
      display: block;
      width: 20px;
      height: 29px;
      text-align: center;
      margin-left: 615px;
      margin-top: -7px;
      margin-bottom: 6px;
    }
  .close:hover,
  .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
  }
  .close1:hover,
  .close1:focus{
    color: black;
    text-decoration: none;
    cursor: pointer;
  }
  .close2:hover,
  .close2:focus{
    color: black;
    text-decoration: none;
    cursor: pointer;
  }
  #table2{
    font-weight: bold;
  }
  #table2 .god1{
    border: none;
    border-radius: 5px;
    height: 23px;
    width: 250px;
  }
  .tb2-btn{
    font-weight: bold;
    border: none;
    background-color: white;
    border-radius: 5px;
    width: 71px;
    height: 26px;
    cursor: pointer;
  }
  .tb2-btn:hover{
    background-color: darkgray;
  }
  #table2 tr{
    height: 32px;
  }
  .gta1{
    border: none;
    border-radius: 5px;
    width: 64px;
    height: 26px;
    margin-top: 3px;
    cursor: pointer;
    font-weight: bold;
    background-color: white;
  }
  .gta1:hover{
    background-color: darkgray;
  }
  #table2{
  font-weight: bold;
  }
  #table2 .god1{
  border: none;
  border-radius: 5px;
  height: 23px;
  width: 250px;
  }
  .tb2-btn{
  font-weight: bold;
  border: none;
  background-color: white;
  border-radius: 5px;
  width: 71px;
  height: 26px;
  cursor: pointer;
  }
  .tb2-btn:hover{
  background-color: darkgray;
  }
  #table2 tr{
  height: 32px;
  }
  .gta1{
  border: none;
  border-radius: 5px;
  width: 64px;
  height: 26px;
  margin-top: 3px;
  cursor: pointer;
  font-weight: bold;
  background-color: white;
  }
  .gta1:hover{
  background-color: darkgray;
  }
  .custom-file-input {
      visibility: hidden; /* 기본 파일 선택 버튼 숨김 */
      display: none;
      width: 0;
      height: 0;
  }
  .custom-file-label {
      background-color:#ABBBC7;
      display: block;
      width: 50px;
      border:none;
      padding: 6px 12px;
      cursor: pointer;
      font-weight: bold;
      border-radius: 5px;
      margin-top: 2px;
      height: 21px;
      text-align: center;
      line-height: 1.5;
  }
  #table3 input[type="text"]{
      border: none;
      border-radius: 5px;
      height: 30px;
      margin-top: 2px;
      margin-left: 10px;
  }
  #table2 input{
    font-weight: bold;
  }
  #table2 select{
    font-weight: bold;
  }
  #table3 input{
    font-weight: bold;
  }
  .popup {
    width: 100%;
    height: 100%;
    background-color: darkgray;
    padding: 20px;
    text-align: center;
    box-sizing: border-box;
  }
  #selectbox1{
      border: none;
      height: 25px;
      border-radius: 5px;
      font-weight: bold;
      margin-right: 4px;
    }
    #searchArea1{
      border: none;
      height: 23px;
      border-radius: 5px;
      margin-right: 4px;
    }
    #searchBtn1{
      border: none;
      border-radius: 5px;
      height: 25px;
      font-weight: bold;
    }
    #searchBtn1:hover{
      background-color: darkgray;
      cursor: pointer;
    }
    #textarea1{
      width: 600px;
      border: none;
      border-bottom: 2px solid darkgray;
      border-radius: 5px;
    }
    #tables4{
      font-weight: bold;
      text-align: left;
    }
    #delBtn1, #delBtn2, #delBtn3, #delBtn4, #delBtn5, #delBtn6, #delBtn7, #delBtn8, #delBtn9, #delBtn10{
      border: none;
      border-radius: 5px;
      font-weight: bold;
      height: 25px;
      background-color: white;
    }
    #delBtn:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn1:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn2:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn3:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn4:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn5:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn6:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn7:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn8:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn9:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #delBtn10:hover{
      cursor: pointer;
      background-color: darkgray;
    }
    #tables4 tr{
      width: 400px;
    }
    #tables5{
      font-weight: bold;
      text-align: left;
      width: 600px;
    }
    #tables5 tr{
      display: flex;
    }
    #tables4Div{
      width: 635px;
      height: 417px;
      overflow-y: scroll; /* 수직 스크롤바는 항상 표시 */
 	  overflow-x: hidden; /* 가로 스크롤바는 숨김 */
    }
    #buttondiv{
      /* margin: auto;
      margin-top: 22px;
      display: flex; */
      display: inline-flex;
      flex-wrap: wrap; /* 버튼들을 여러 줄로 묶음 */
      justify-content: center; /* 가운데 정렬 */
      align-items: center; /* 세로 중앙 정렬 */
      margin-top: 13px;
      border: none;
      width: 100%; /* 전체 너비 활용 */
    }
    #buttondiv>.btn2{
      width: 31px;
      height: 31px;
      display: block;
      margin-right: 2px;
      border-radius: 5px;
      border: none;
      background-color: #ABBBC7;
      font-weight: bold;
      cursor: pointer;
    }
    #buttondiv>.btn2:hover{
      background-color: darkgray;
    }
    .modal-trigger td{
		height: 22px;
	}
	#content1, #content2, #content3, #content4, #content5, #content6, #content7, #content8, #content9, #content10{
		border: none;
		width: 609px;
		border-radius: 5px;
		font-weight: bold;
	}
	#before, #after{
		display: none;
	}
	#grand1, #grand2, #grand3, #grand4, #grand5{
		display: none;
	}
	#buttondiv>.btn3{
      width: 31px;
      height: 31px;
      margin-right: 2px;
      border-radius: 5px;
      border: none;
      background-color: #ABBBC7;
      font-weight: bold;
      cursor: pointer;
    }
    #buttondiv>.btn3:hover{
    	background-color: darkgray;
    }
    tr, th, td{
     	box-sizing: border-box;
    }
    #dxdy1, #dxdy2{
    	border: none;
    	border-radius: 5px;
    	margin-right: 5px;
    }
    #dsearchArea1{
    	border: none;
    	border-radius: 5px;
    	margin-right: 5px;
    }
    #searchBtn11{
    	border: none;
    	border-radius: 5px;
    }
    #searchBtn11:hover{
    	background-color: darkgray;
    	cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="outer">
    <table id="tb1">
      <tr style="width: 100%;">
        <th style="width: 10%;">상품번호</th>
        <th style="width: 41%;">상품이름</th>
        <th style="width: 13%">시작날짜</th>
        <th style="width: 13%">종료날짜</th>
        <th style="width: 10%">지역</th>
        <th style="border-right: none; width: 8%;">
        	<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        </th>
        <th style="width: 5%">
        	<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        </th>
      </tr>
      <%for(int i=0; i<list.size(); i++){ %>
      <tr class="modal-trigger">
        <td id="td1" style="width: 10%;"><%=list.get(i).getProductNo() %></td>
        <td id="td2" style="width: 41%;"><%=list.get(i).getProductTitle() %></td>
        <td id="td3" style="width: 13%"><%=list.get(i).getStartPeriod() %></td>
        <td id="td4" style="width: 13%"><%=list.get(i).getEndPeriod() %></td>
        <td id="td5" style="width: 10%"><%=list.get(i).getLocal() %></td>
        <td id="td6" style="width: 8%;"><button class="reviewbtn" style="font-family: 'Jua', sans-serif;">리뷰보기</button></td>
        <td id="td7" style="width: 5%"><button class="riska" style="font-family: 'Jua', sans-serif;">삭제</button></td>
      </tr>
      <%} %>
    </table>
    <div>
      <div id="buttondiv" style="border: none;margin: auto; margin-top: 8px;">
		<%if(currentPage != 1){ %>
	    	<button class="btn2" style="font-family: 'Jua', sans-serif;" onclick="funcx41(<%=currentPage - 1 %>);">&lt;</button>
        <%} %>
        <%for(int p=startPage; p<=endPage; p++){ %>
	        <%if(p == currentPage){ %>
	        	<button class="btn2" style="font-family: 'Jua', sans-serif;" disabled><%=p %></button>
	        <%} else{%>
	        	<button class="btn2" style="font-family: 'Jua', sans-serif;" onclick="funcx31(<%=p %>);"><%=p %></button>
	        <%} %>
        <%} %>
        <%if(currentPage != maxPage){ %>
        	<button class="btn2" style="font-family: 'Jua', sans-serif;" onclick="funcx41(<%=currentPage + 1 %>);">&gt;</button>
       	<%} %>
    </div>
    </div>
  </div>
  <div class="modal" id="modal" style="width: 1016px; height: 674.391px; position: absolute; box-sizing: border-box; left: 0; top: 0;">
    <div class="modal-content" style="width: 478px;">
      <div class="close" id="closeButton" style="border:none; margin-left: 446px;">
        &times;
      </div>
      <p id="modalText" style="margin-top: 0;"></p>
    </div>
  </div>
  <div class="modal1" id="modal1" style="width: 1016px; height: 674.391px; position: absolute; box-sizing: border-box; left: 0; top: 0;">
    <div class="modal-content1">
      <div class="close1" id="closeButton1">
        &times;
      </div>
      <p id="modalText1" style="margin-top: 0;"></p>
    </div>
  </div>
  <div class="modal2" id="modal2" style="width: 1016px; height: 674.391px; position: absolute; box-sizing: border-box; left: 0; top: 0;">
    <div class="modal-content2">
      <div class="close2" id="closeButton2">
        &times;
      </div>
      <div style="display: flex;">
	    <select id="dxdy1" style="margin-left: 309px; font-family: 'Jua', sans-serif;">
	      <option>리뷰번호</option>
	      <option>회원번호</option>
	      <option>리뷰작성날짜</option>
	    </select>
	    <input type="text" id="dsearchArea1">
	    <button id="searchBtn11" style="font-family: 'Jua', sans-serif;">검색</button>
      </div>
      <p id="modalText2" style="margin-top: 0;"></p>
      <div id="buttondiv" style="border: none;margin: auto; margin-top: -3px;">
	      <button class="btn3" id="before" style="font-family: 'Jua', sans-serif;"><</button>
	      <button class="btn3" id="grand1" style="font-family: 'Jua', sans-serif;">1</button>
	      <button class="btn3" id="grand2" style="font-family: 'Jua', sans-serif;">2</button>
	      <button class="btn3" id="grand3" style="font-family: 'Jua', sans-serif;">3</button>
	      <button class="btn3" id="grand4" style="font-family: 'Jua', sans-serif;">4</button>
	      <button class="btn3" id="grand5" style="font-family: 'Jua', sans-serif;">5</button>
	      <button class="btn3" id="after" style="font-family: 'Jua', sans-serif;">></button>
	</div>
    </div>
  </div>

  <script>
  var upno = null;
  var productNo = null;
  var firstpage = 0;
  $("#grand1").click(function(){ cx_call(productNo, 1); });
  $("#grand2").click(function(){ cx_call(productNo, 2); });
  $("#grand3").click(function(){ cx_call(productNo, 3); });
  $("#grand4").click(function(){ cx_call(productNo, 4); });
  $("#grand5").click(function(){ cx_call(productNo, 5); });

  $("#before").click(function(){ cx_prev(productNo); });
  $("#after").click(function(){ cx_next(productNo); }); 
  
  $("#searchBtn11").click(function(){
	  var reviewSearchType = $("#dxdy1").val();
	  var reviewSearchContent = $("#dsearchArea1").val();
	  
	 cx(upno, 1, reviewSearchType, reviewSearchContent);
  });
  
  $(".riska").click(function() {
	  var trElement = $(this).closest("tr");
	    
	  var productNoText = trElement.find("#td1").text();
	    
	  event.stopPropagation();
	  
	  var form = $("<form>", {
          action: "manager-delete.do", // 서블릿의 URL
          method: "get",
          style: "display: none;" // 폼을 안보이도록 스타일링
      });
	  
	  form.append($("<input>", {
		    type: "hidden",
		    name: "pno",
		    value: productNoText
      }));
	  
      form.appendTo("body").submit();
    });
  
  function deleteReview(button, i){
	    var tr = button.parentNode.parentNode;

	    var rno = tr.querySelector('#rno' + i).textContent;

	    $.ajax({
            type: 'POST', 
            url: 'manager-search-review-delete.do',
            data: { rno: rno }, 
            success: function (response) {
            	$("#dsearchArea1").val("");
                cx(productNo, 1, "", "");
            },
            error: function (xhr, status, error) {
                console.error('댓글 삭제 중 오류 발생: ' + error);
            }
        });
  }
  
  function cx(productNo, pages, reviewSearchType, reviewSearchContent){
	  var nume = parseInt(pages);
	  modalText2.innerHTML = `
	  <hr>
	  <div>
	    <table id="tables5">
	      <tr style="width: 600px;">
	        <td style="width: 152px;">리뷰번호</td>
	        <td style="width: 157px;">회원번호</td>
	        <td style="width: 150px;">작성날짜</td>
	        <td></td>
	      </tr>
	    </table>
	    <div id="tables4Div" style="background-color: #EDEDED;">
	      <table id="tables4">
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno1"></td>
	          <td style="width: 150px;" id="userNo1"></td>
	          <td style="width: 150px;" id="reviewDate1"></td>
	          <td style="width: 150px;">
	            <button id="delBtn1" onclick="deleteReview(this, 1);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content1"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno2"></td>
	          <td style="width: 150px;" id="userNo2"></td>
	          <td style="width: 150px;" id="reviewDate2"></td>
	          <td style="width: 150px;">
	            <button id="delBtn2" onclick="deleteReview(this, 2);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content2"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno3"></td>
	          <td style="width: 150px;" id="userNo3"></td>
	          <td style="width: 150px;" id="reviewDate3"></td>
	          <td style="width: 150px;">
	            <button id="delBtn3" onclick="deleteReview(this, 3);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content3"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno4"></td>
	          <td style="width: 150px;" id="userNo4"></td>
	          <td style="width: 150px;" id="reviewDate4"></td>
	          <td style="width: 150px;">
	            <button id="delBtn4" onclick="deleteReview(this, 4);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content4"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno5"></td>
	          <td style="width: 150px;" id="userNo5"></td>
	          <td style="width: 150px;" id="reviewDate5"></td>
	          <td style="width: 150px;">
	            <button id="delBtn5" onclick="deleteReview(this, 5);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content5"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno6"></td>
	          <td style="width: 150px;" id="userNo6"></td>
	          <td style="width: 150px;" id="reviewDate6"></td>
	          <td style="width: 150px;">
	            <button id="delBtn6" onclick="deleteReview(this, 6);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content6"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno7"></td>
	          <td style="width: 150px;" id="userNo7"></td>
	          <td style="width: 150px;" id="reviewDate7"></td>
	          <td style="width: 150px;">
	            <button id="delBtn7" onclick="deleteReview(this, 7);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content7"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno8"></td>
	          <td style="width: 150px;" id="userNo8"></td>
	          <td style="width: 150px;" id="reviewDate8"></td>
	          <td style="width: 150px;">
	            <button id="delBtn8" onclick="deleteReview(this, 8);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content8"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno9"></td>
	          <td style="width: 150px;" id="userNo9"></td>
	          <td style="width: 150px;" id="reviewDate9"></td>
	          <td style="width: 150px;">
	            <button id="delBtn9" onclick="deleteReview(this, 9);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content9"></textarea>
	          </td>
	        </tr>
	        <tr style="width: 600px;">
	          <td style="width: 150px;" id="rno10"></td>
	          <td style="width: 150px;" id="userNo10"></td>
	          <td style="width: 150px;" id="reviewDate10"></td>
	          <td style="width: 150px;">
	            <button id="delBtn10" onclick="deleteReview(this, 10);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <textarea cols="30" rows="5" style="resize: none;" id="content10"></textarea>
	          </td>
	        </tr>
	      </table>
	    </div>
	  </div>
	      `;
	  
	  $.ajax({
          type: "GET",
          url: "manager-search-reviewList.do", // 여기에 서블릿 URL을 입력하세요
          data: { 
          	pno: productNo,
          	cpage: nume,
          	reviewSearchType: reviewSearchType,
        	reviewSearchContent: reviewSearchContent
          },
          success: function (r) {
        	 if(r.reviews[0]) 	$("#rno1").text(r.reviews[0].rno);	 else  	$("#rno1").text("");
        	 if(r.reviews[1])   $("#rno2").text(r.reviews[1].rno);	 else  	$("#rno2").text("");
        	 if(r.reviews[2])   $("#rno3").text(r.reviews[2].rno);	 else  	$("#rno3").text("");
        	 if(r.reviews[3])   $("#rno4").text(r.reviews[3].rno);	 else  	$("#rno4").text("");
        	 if(r.reviews[4])   $("#rno5").text(r.reviews[4].rno);	 else  	$("#rno5").text("");
        	 if(r.reviews[5])   $("#rno6").text(r.reviews[5].rno);	 else  	$("#rno6").text("");
        	 if(r.reviews[6])   $("#rno7").text(r.reviews[6].rno);	 else  	$("#rno7").text("");
        	 if(r.reviews[7])   $("#rno8").text(r.reviews[7].rno);	 else  	$("#rno8").text("");
        	 if(r.reviews[8])   $("#rno9").text(r.reviews[8].rno);	 else  	$("#rno9").text("");
         	 if(r.reviews[9])   $("#rno10").text(r.reviews[9].rno);	 else  	$("#rno10").text("");
        	 
         	 if(r.reviews[0])   $("#userNo1").text(r.reviews[0].userNo);	 else  	$("#userNo1").text("");
         	 if(r.reviews[1])   $("#userNo2").text(r.reviews[1].userNo);	 else  	$("#userNo2").text("");
         	 if(r.reviews[2])   $("#userNo3").text(r.reviews[2].userNo);	 else  	$("#userNo3").text("");
         	 if(r.reviews[3])   $("#userNo4").text(r.reviews[3].userNo);	 else  	$("#userNo4").text("");
         	 if(r.reviews[4])   $("#userNo5").text(r.reviews[4].userNo);	 else  	$("#userNo5").text("");
         	 if(r.reviews[5])   $("#userNo6").text(r.reviews[5].userNo);	 else  	$("#userNo6").text("");
         	 if(r.reviews[6])   $("#userNo7").text(r.reviews[6].userNo);	 else  	$("#userNo7").text("");
         	 if(r.reviews[7])   $("#userNo8").text(r.reviews[7].userNo);	 else  	$("#userNo8").text("");
         	 if(r.reviews[8])   $("#userNo9").text(r.reviews[8].userNo);	 else  	$("#userNo9").text("");
         	 if(r.reviews[9])   $("#userNo10").text(r.reviews[9].userNo);	 else  	$("#userNo10").text("");
         	 
         	 if(r.reviews[0])   $("#reviewDate1").text(r.reviews[0].reviewDate);	 else  	$("#reviewDate1").text("");
         	 if(r.reviews[1])   $("#reviewDate2").text(r.reviews[1].reviewDate);	 else  	$("#reviewDate2").text("");
         	 if(r.reviews[2])   $("#reviewDate3").text(r.reviews[2].reviewDate);	 else  	$("#reviewDate3").text("");
         	 if(r.reviews[3])   $("#reviewDate4").text(r.reviews[3].reviewDate);	 else  	$("#reviewDate4").text("");
         	 if(r.reviews[4])   $("#reviewDate5").text(r.reviews[4].reviewDate);	 else  	$("#reviewDate5").text("");
         	 if(r.reviews[5])   $("#reviewDate6").text(r.reviews[5].reviewDate);	 else  	$("#reviewDate6").text("");
         	 if(r.reviews[6])   $("#reviewDate7").text(r.reviews[6].reviewDate);	 else  	$("#reviewDate7").text("");
         	 if(r.reviews[7])   $("#reviewDate8").text(r.reviews[7].reviewDate);	 else  	$("#reviewDate8").text("");
         	 if(r.reviews[8])   $("#reviewDate9").text(r.reviews[8].reviewDate);	 else  	$("#reviewDate9").text("");
         	 if(r.reviews[9])   $("#reviewDate10").text(r.reviews[9].reviewDate);	 else  	$("#reviewDate10").text("");
         	 
         	 if(r.reviews[0])   $("#content1").text(r.reviews[0].content);	 else  	$("#content1").text("");
         	 if(r.reviews[1])   $("#content2").text(r.reviews[1].content);	 else  	$("#content2").text("");
         	 if(r.reviews[2])   $("#content3").text(r.reviews[2].content);	 else  	$("#content3").text("");
         	 if(r.reviews[3])   $("#content4").text(r.reviews[3].content);	 else  	$("#content4").text("");
         	 if(r.reviews[4])   $("#content5").text(r.reviews[4].content);	 else  	$("#content5").text("");
         	 if(r.reviews[5])   $("#content6").text(r.reviews[5].content);	 else  	$("#content6").text("");
         	 if(r.reviews[6])   $("#content7").text(r.reviews[6].content);	 else  	$("#content7").text("");
         	 if(r.reviews[7])   $("#content8").text(r.reviews[7].content);	 else  	$("#content8").text("");
         	 if(r.reviews[8])   $("#content9").text(r.reviews[8].content);	 else  	$("#content9").text("");
         	 if(r.reviews[9])   $("#content10").text(r.reviews[9].content);	 else  	$("#content10").text("");
         	 
		     for(var i=1; i<=10; i++){
		    	 $("#content" + i).css("display", "none");
		    	 $("#delBtn" + i).css("display", "none");
		     }         	 
		     var reviewsNum = parseInt(r.pi.listCount);
		     var currfpage = parseInt(r.pi.currentPage);
		     var pageNjk = 10 - (currfpage * 10 - reviewsNum);
		     
		     for(var i=1; i<=pageNjk; i++){
		    	 $("#content" + i).css("display", "block");
		    	 $("#delBtn" + i).css("display", "block");
		     }
         	 
             var count = 1;
             var nui = parseInt(r.pi.currentPage) % 5;
             if(nui == 0){
            	 $("#grand5").prop("disabled", true);
             }
             $("#grand" + nui).prop("disabled", true);
             
             firstpage = parseInt(r.pi.startPage);
             
             for(var i=1; i<=5; i++){
            	 $("#grand" + i).css("display", "none");
             } 
             
             $("#before").css("display", "none");
             $("#after").css("display", "none");
             
             for(var i=r.pi.startPage; i<=r.pi.endPage; i++){
               if(i != parseInt(r.pi.currentPage)){
            	   $("#grand" + count).prop("disabled", false);
               }
          	   $("#grand" + count).css("display", "block");
          	   $("#grand" + count).text(i);
          	   count++;
             }
             
             if(r.pi.startPage != 1){
          	   $("#before").css("display", "block");
             }
             
             if(r.pi.endPage < r.pi.maxPage){
          	   $("#after").css("display", "block");
             }
     
          },
          error: function () {
              alert("요청 실패");
          }
      });
  }
  
  
  function cx_prev(productNo){
	  	firstpage -= 5;
	    if(firstpage < 1)
	    	firstpage = 1;
	    var reviewSearchType = $("#dxdy1").val();
	    var reviewSearchContent = $("#dsearchArea1").val();
	    	
	    cx(productNo, firstpage, reviewSearchType, reviewSearchContent);
	  }
	  
  function cx_next(productNo){
  	firstpage += 5;

  	var reviewSearchType = $("#dxdy1").val();
    var reviewSearchContent = $("#dsearchArea1").val();
    	
    cx(productNo, firstpage, reviewSearchType, reviewSearchContent);
  }
  
  function cx_call(productNo, btnindex){
	  var reviewSearchType = $("#dxdy1").val();
	  var reviewSearchContent = $("#dsearchArea1").val();
	  
	   cx(productNo, firstpage + btnindex - 1, reviewSearchType, reviewSearchContent);
	 }
  
  function getCookie(name) {
	  var nameEQ = name + "=";
	  var cookies = document.cookie.split(';');
	  for (var i = 0; i < cookies.length; i++) {
	    var cookie = cookies[i];
	    while (cookie.charAt(0) === ' ') {
	      cookie = cookie.substring(1, cookie.length);
	    }
	    if (cookie.indexOf(nameEQ) === 0) {
	      return cookie.substring(nameEQ.length, cookie.length);
	    }
	  }
	  return null;
	}    
    var searchVal = getCookie("searchval");
    var searchType1 = getCookie("searchtype1");
    var searchType2 = getCookie("searchtype2");
      
	  function funcx41(p){
			if(searchType2 == null && (searchVal != null && searchType1 != null)){
				location.href='<%=contextPath %>/manager-search.do?cpage=' + p + '&searchType1=' + searchType1 + '&searchVal=' + searchVal;		
			}else if(searchType2 != null && (searchVal == null && searchType1 == null)){
				location.href='<%=contextPath %>/manager-search-bycategory.do?cpage=' + p + '&category=' + searchType2;				
			}else if(searchType2 == null && searchVal == null && searchType1 == null){
				location.href='<%=contextPath %>/manager-search.do?cpage=' + p;	
			}
		}
	  function funcx31(p){
		  if(searchType2 == null && (searchVal != null && searchType1 != null)){
				location.href='<%=contextPath %>/manager-search.do?cpage=' + p + '&searchType1=' + searchType1 + '&searchVal=' + searchVal;		
			}else if(searchType2 != null && (searchVal == null && searchType1 == null)){
				location.href='<%=contextPath %>/manager-search-bycategory.do?cpage=' + p + '&category=' + searchType2;				
			}else if(searchType2 == null && searchVal == null && searchType1 == null){
				location.href='<%=contextPath %>/manager-search.do?cpage=' + p;	
			}
		}
    $(function(){
      $("#tb1 tr:not(:first-child)").hover(function(){
        $(this).css("background-color", "darkgray");
        $(this).find("td:not(:last-child)").css("border-right", "2px solid darkgray");
        $(this).css("font-weight", "bold");
      },
      function(){
        $(this).css("background-color", "#EDEDED");
        $(this).find("td:not(:last-child)").css("border-right", "2px solid #ABBBC7");
        $(this).css("font-weight", "normal");
      });
    });

    const modalTriggerElements = document.querySelectorAll(".modal-trigger");
    const modal = document.getElementById("modal");
    const closeButton = document.getElementById("closeButton");
    const modalText = document.getElementById("modalText");

    const modal1 = document.getElementById("modal1");
    const closeButton1 = document.getElementById("closeButton1");
    const modalText1 = document.getElementById("modalText1");

    const modal2 = document.getElementById("modal2");
    const closeButton2 = document.getElementById("closeButton2");
    const modalText2 = document.getElementById("modalText2");
    
    var categoryTypo = null;
    var pno = null;
    var bigCategory = null;
    var smallCategory = null;
    var totalCategory = null;
    
    var title = null;
  	var local = null;
  	var address = null;
  	var start = null;
  	var end = null;
  	var level = null;
  	var runtime = null;
  	var price = null;
  	var dayTime = null;
  	var noonTime = null;
  	var daySeats = null;
  	var noonSeats = null;
  	var imagePath = null;
  	
  	var olevel = null;
    
    var poster = null;
    var detail1 = null;
    var detail2 = null;
    var detail3 = null;
    var detail4 = null;
    var detail5 = null;
    
	var img1 = null;
	var img2 = null;
	var img3 = null;
	var img4 = null;
	var img5 = null;
	var img6 = null;
	
	var reviewButtons = document.querySelectorAll(".reviewbtn");

	  for (var i = 0; i < reviewButtons.length; i++) {
	    reviewButtons[i].addEventListener("click", function (event) {
	      event.stopPropagation();
	    });
	  }
	
	function canc(){
	    modal.style.display = "none";
	  }
	
	function canc2(){
		modal1.style.display = "none";
	}
	
	function funcx2(){
		  
		  const imageInput1 = document.getElementById('customFile1');
		    const imagePathInput1 = document.getElementById('filePath1');

		    imageInput1.addEventListener('change', function(event) {
		    const selectedFile = event.target.files[0]; // 선택한 파일의 정보 가져오기
		        if (selectedFile) {
		            const fileName = selectedFile.name;
		            imagePathInput1.value = fileName; // 입력란에 경로 설정
		        }
		    });

		    const imageInput2 = document.getElementById('customFile2');
		    const imagePathInput2 = document.getElementById('filePath2');

		    imageInput2.addEventListener('change', function(event) {
		    const selectedFile = event.target.files[0]; // 선택한 파일의 정보 가져오기
		        if (selectedFile) {
		            const fileName = selectedFile.name;
		            imagePathInput2.value = fileName; // 입력란에 경로 설정
		        }
		    });

		    const imageInput3 = document.getElementById('customFile3');
		    const imagePathInput3 = document.getElementById('filePath3');

		    imageInput3.addEventListener('change', function(event) {
		    const selectedFile = event.target.files[0]; // 선택한 파일의 정보 가져오기
		        if (selectedFile) {
		            const fileName = selectedFile.name;
		            imagePathInput3.value = fileName; // 입력란에 경로 설정
		        }
		    });

		    const imageInput4 = document.getElementById('customFile4');
		    const imagePathInput4 = document.getElementById('filePath4');

		    imageInput4.addEventListener('change', function(event) {
		    const selectedFile = event.target.files[0]; // 선택한 파일의 정보 가져오기
		        if (selectedFile) {
		            const fileName = selectedFile.name;
		            imagePathInput4.value = fileName; // 입력란에 경로 설정
		        }
		    });

		    const imageInput5 = document.getElementById('customFile5');
		    const imagePathInput5 = document.getElementById('filePath5');

		    imageInput5.addEventListener('change', function(event) {
		    const selectedFile = event.target.files[0]; // 선택한 파일의 정보 가져오기
		        if (selectedFile) {
		            const fileName = selectedFile.name;
		            imagePathInput5.value = fileName; // 입력란에 경로 설정
		        }
		    });

		    const imageInput6 = document.getElementById('customFile6');
		    const imagePathInput6 = document.getElementById('filePath6');

		    imageInput6.addEventListener('change', function(event) {
		    const selectedFile = event.target.files[0]; // 선택한 파일의 정보 가져오기
		        if (selectedFile) {
		            const fileName = selectedFile.name;
		            imagePathInput6.value = fileName; // 입력란에 경로 설정
		        }
		    });
		  }
	
	function funcx3(val){
		// 새 창을 전체 화면으로 열기 위한 옵션 설정
        var windowOptions = "fullscreen=yes";
		
		if(val == 2 && detail1 == null){
			return;
		}else if(val == 3 && detail2 == null){
			return;
		}else if(val == 4 && detail3 == null){
			return;
		}else if(val == 5 && detail4 == null){
			return;
		}else if(val == 6 && detail5 == null){
			return;
		}
		
        var image = "";
        if(val == 1){
        	image = img1;
        }else if(val == 2){
        	image = img2;
        }else if(val == 3){
        	image = img3;
        }else if(val == 4){
        	image = img4;
        }else if(val == 5){
        	image = img5;
        }else if(val == 6){
        	image = img6;
        }

        // 새 창 열기
        var popupWindow = window.open("", "_blank", windowOptions);

        // 새로 열린 창에 콘텐츠 추가 (DIV와 이미지)
        if (popupWindow) {
          popupWindow.document.title = "상품사진";
          var popupContent = document.createElement("div");
          popupContent.className = "popup";
          popupContent.style.display = "flex";
          popupContent.style.justifyContent = "center";
          popupContent.style.alignItems = "center";
          popupContent.style.padding = "20px";
          popupContent.style.textAlign = "center";
          popupContent.style.boxSizing = "border-box";
          popupContent.style.width = "100%";
          popupContent.style.height = "100%";

          popupContent.appendChild(image);
          popupWindow.document.body.appendChild(popupContent);

          popupWindow.scrollTo(0, 0);
        } else {
          alert("팝업 창이 차단되었거나 열 수 없습니다.");
        }
	  }
	
	function funx1(){
	      modal.style.display = "none";
	      modal1.style.display = "block";
	      modalText1.innerHTML = `
	      <form action="<%=contextPath %>/manager-search-update.do" method="post" enctype="multipart/form-data">
	      <input type="hidden" name="fileName1" id="hiddenInputId1" value="">
	      <input type="hidden" name="fileName2" id="hiddenInputId2" value="">
	      <input type="hidden" name="fileName3" id="hiddenInputId3" value="">
	      <input type="hidden" name="fileName4" id="hiddenInputId4" value="">
	      <input type="hidden" name="fileName5" id="hiddenInputId5" value="">
	      <input type="hidden" name="fileName6" id="hiddenInputId6" value="">
	      <input type="hidden" name="pNo" id="pNo" value="">
	      <div style="display: flex;">
	    <div class="outer" style="margin-left: 44px;">
	      <table id="table2" align="center">
	        <tr>
	          <td>상품번호</td>
	          <td colspan="3"><input type="text" name="apno" id="xpno" class="god1"></td>
	        </tr>
	        <tr>
	          <td>카테고리</td>
	          <td colspan="3" style="display: flex;">
	            <select class="god1" id="scx1" style="width: 48.5%; height: 26px; margin-right: 5px; margin-top: 2.5px; font-family: 'Jua', sans-serif;">
	              <option value="movie">영화</option>
	              <option value="display">전시</option>
	              <option value="show">공연</option>
	            </select>
	            <select class="god1" id="scx2" name="acategory" style="width: 49%; height: 26px; margin-top: 2.5px; font-family: 'Jua', sans-serif;">
		            <option value="1">로맨스</option>
	                <option value="2">공포/스릴러</option>
	                <option value="3">코미디</option>
	                <option value="4">액션</option>
	            </select>
	          </td>
	        </tr>
	        <tr>
	          <td>상품명</td>
	          <td colspan="3"><input type="text" name="atitle" id="xtitle" class="god1"></td>
	        </tr>
	        <tr>
	          <td>지역</td>
	          <td colspan="3">
	            <select class="god1" id="xlocal" name="alocal" style="width: 254px; height: 26px; font-family: 'Jua', sans-serif;">
		            <option value="1">서울</option>
	                <option value="2">경기/인천</option>
	                <option value="3">충청/강원</option>
	                <option value="4">대구/경북</option>
	                <option value="5">광주/전라</option>
	                <option value="6">제주</option>
	            </select>
	          </td>
	        </tr>
	        <tr>
	          <td>상세장소</td>
	          <td colspan="3"><input type="text" name="aaddress" id="xaddress" class="god1"></td>
	        </tr>
	        <tr>
	          <td>관람등급</td>
	          <td colspan="3">
	            <select class="god1" id="xlevel" name="alevel" style="width: 254px; height: 26px; font-family: 'Jua', sans-serif;">
		            <option value="1">전체</option>
	                <option value="2">7</option>
	                <option value="3">12</option>
	                <option value="4">15</option>
	                <option value="5">19</option>
	          </select>
	          </td>
	        </tr>
	        <tr>
	          <td>상영시간(분)</td>
	          <td colspan="3"><input type="text" name="aruntime" id="xruntime" class="god1"></td>
	        </tr>
	        <tr>
	          <td>가격</td>
	          <td colspan="3"><input type="text" name="aprice" id="xprice" class="god1"></td>
	        </tr>
	      </table>
	    </div>
	    <div>
	      <table id="table3">
	        <tr>
	          <td>
	            <div style="display: flex;">
	                <label class="custom-file-label" for="customFile1" style="margin-left: 1px;">
	                    포스터
	                </label>
	                <input type="file" name="customFile1" id="customFile1" class="custom-file-input">
	                <input type="text" id="filePath1" placeholder="사진을 선택하시오" style="width: 200px; font-family: 'Jua', sans-serif;">
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <td>
	            <div style="display: flex; margin-top: 0px;">
	                <label class="custom-file-label" for="customFile2" style="margin-left: 1px;">
	                    상세1
	                </label>
	                <input type="file" name="customFile2" id="customFile2" class="custom-file-input">
	                <input type="text" id="filePath2" placeholder="사진을 선택하시오" style="width: 200px; font-family: 'Jua', sans-serif;">
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <td>
	            <div style="display: flex; margin-top: 0px;">
	                <label class="custom-file-label" for="customFile3" style="margin-left: 1px;">
	                    상세2
	                </label>
	                <input type="file" name="customFile3" id="customFile3" class="custom-file-input">
	                <input type="text" id="filePath3" placeholder="사진을 선택하시오" style="width: 200px; font-family: 'Jua', sans-serif;">
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <td>
	            <div style="display: flex; margin-top: 0px;">
	                <label class="custom-file-label" for="customFile4" style="margin-left: 1px;">
	                    상세3
	                </label>
	                <input type="file" name="customFile4" id="customFile4" class="custom-file-input">
	                <input type="text" id="filePath4" placeholder="사진을 선택하시오" style="width: 200px; font-family: 'Jua', sans-serif;">
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <td>
	            <div style="display: flex; margin-top: 0px;">
	                <label class="custom-file-label" for="customFile5" style="margin-left: 1px;">
	                    상세4
	                </label>
	                <input type="file" name="customFile5" id="customFile5" class="custom-file-input">
	                <input type="text" id="filePath5" placeholder="사진을 선택하시오" style="width: 200px; font-family: 'Jua', sans-serif;">
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <td>
	            <div style="display: flex; margin-top: 0px;">
	                <label class="custom-file-label" for="customFile6" style="margin-left: 1px;">
	                    상세5
	                </label>
	                <input type="file" name="customFile6" id="customFile6" class="custom-file-input">
	                <input type="text" id="filePath6" placeholder="사진을 선택하시오" style="width: 200px; font-family: 'Jua', sans-serif;">
	            </div>
	          </td>
	        </tr>
	      </table>
	    </div>
	</div>
	<div align="center" style="margin-top: 30px;">
	  <button type="submit" class="tb2-btn" style="font-family: 'Jua', sans-serif; line-height: 2">수정완료</button>
	  <button class="tb2-btn" onclick="canc2();" style="font-family: 'Jua', sans-serif; line-height: 2">취소</button>
	</div>
	</form>
	`;
	funcx2();
	document.getElementById("pNo").value = pno;
	$("#xpno").val(pno);
	$("#xtitle").val(title);
	
	$("#xlocal option").each(function() {
	    if ($(this).text() === local) {
	      // 일치하는 option을 선택된 상태로 설정합니다.
	      $(this).prop("selected", true);
	      return false; // 순회 중단
	    }
	  });
	
	$("#xaddress").val(address);
      
      if(level === "전체 관람가"){
    	  olevel = "전체";
      }else if(level === "7세 관람가"){
    	  olevel = "7";
      }else if(level === "12세 관람가"){
    	  olevel = "12";
      }else if(level === "15세 관람가"){
    	  olevel = "15";
      }else if(level === "19세 관람가"){
    	  olevel = "19";
      }
      
      $("#xlevel option").each(function() {
  	    if ($(this).text() === olevel) {
  	      $(this).prop("selected", true);
  	      return false;
  	    }
  	  });
      
      $("#xruntime").val(runtime);
      $("#xprice").val(price);
      $("#filePath1").val(poster);
      $("#filePath2").val(detail1);
      $("#filePath3").val(detail2);
      $("#filePath4").val(detail3);
      $("#filePath5").val(detail4);
      $("#filePath6").val(detail5);
      
      /*
      document.getElementById("hiddenInputId1").value = poster;
      document.getElementById("hiddenInputId2").value = detail1;
      document.getElementById("hiddenInputId3").value = detail2;
      document.getElementById("hiddenInputId4").value = detail3;
      document.getElementById("hiddenInputId5").value = detail4;
      document.getElementById("hiddenInputId6").value = detail5;
      */
      
      /*
      if (poster != null) {
    	  var fileInput = document.getElementById('customFile1');

    	  var onChangeFunction = function(event) {
    		  document.getElementById("hiddenInputId1").value = poster;
    	  };

    	  fileInput.addEventListener('change', onChangeFunction);
    	}
      
      
      if (detail1 != null) {
    	  var fileInput = document.getElementById('customFile2');

    	  var onChangeFunction = function(event) {
    		  document.getElementById("hiddenInputId2").value = detail1;
    	  };

    	  fileInput.addEventListener('change', onChangeFunction);
    	}
      
      if (detail2 != null) {
    	  var fileInput = document.getElementById('customFile3');

    	  var onChangeFunction = function(event) {
    		  document.getElementById("hiddenInputId3").value = detail2;
    	  };

    	  fileInput.addEventListener('change', onChangeFunction);
    	}
      
      if (detail3 != null) {
    	  var fileInput = document.getElementById('customFile4');

    	  var onChangeFunction = function(event) {
    		  document.getElementById("hiddenInputId4").value = detail3;
    	  };

    	  fileInput.addEventListener('change', onChangeFunction);
    	}
      
      if (detail4 != null) {
    	  var fileInput = document.getElementById('customFile5');

    	  var onChangeFunction = function(event) {
    		  document.getElementById("hiddenInputId5").value = detail4;
    	  };

    	  fileInput.addEventListener('change', onChangeFunction);
    	}
      
      if (detail5 != null) {
    	  var fileInput = document.getElementById('customFile6');

    	  var onChangeFunction = function(event) {
    		  document.getElementById("hiddenInputId6").value = detail5;
    	  };

    	  fileInput.addEventListener('change', onChangeFunction);
    	}
      */
      
      if (poster != null) {
    	    var fileInput1 = document.getElementById('customFile1');
    	    
    	    var onChangeFunction1 = function(event) {
    	        var selectedFile = fileInput1.files[0]; // 선택된 파일 가져오기
    	        var selectedFileName = selectedFile ? selectedFile.name : "null"; // 선택된 파일의 이름

    	        if (selectedFileName && selectedFileName != poster) {
    	            document.getElementById("hiddenInputId1").value = poster;
    	        }
    	    };

    	    fileInput1.addEventListener('change', onChangeFunction1);
    	}
      
      if (detail1 != null) {
    	    var fileInput2 = document.getElementById('customFile2');

    	    var onChangeFunction2 = function(event) {
    	        var selectedFile = fileInput2.files[0]; // 선택된 파일 가져오기
    	        var selectedFileName = selectedFile ? selectedFile.name : null; // 선택된 파일의 이름

    	        if (selectedFileName && selectedFileName != detail1) {
    	            document.getElementById("hiddenInputId2").value = detail1;
    	        }
    	    };

    	    fileInput2.addEventListener('change', onChangeFunction2);
    	}
      
      if (detail2 != null) {
    	    var fileInput3 = document.getElementById('customFile3');

    	    var onChangeFunction3 = function(event) {
    	        var selectedFile = fileInput3.files[0]; // 선택된 파일 가져오기
    	        var selectedFileName = selectedFile ? selectedFile.name : null; // 선택된 파일의 이름

    	        if (selectedFileName && selectedFileName != detail2) {
    	            document.getElementById("hiddenInputId3").value = detail2;
    	        }
    	    };

    	    fileInput3.addEventListener('change', onChangeFunction3);
    	}
      
      if (detail3 != null) {
    	    var fileInput4 = document.getElementById('customFile4');

    	    var onChangeFunction4 = function(event) {
    	        var selectedFile = fileInput4.files[0]; // 선택된 파일 가져오기
    	        var selectedFileName = selectedFile ? selectedFile.name : null; // 선택된 파일의 이름

    	        if (selectedFileName && selectedFileName != detail3) {
    	            document.getElementById("hiddenInputId4").value = detail3;
    	        }
    	    };

    	    fileInput4.addEventListener('change', onChangeFunction4);
    	}
      
      if (detail4 != null) {
    	    var fileInput5 = document.getElementById('customFile5');

    	    var onChangeFunction5 = function(event) {
    	        var selectedFile = fileInput5.files[0]; // 선택된 파일 가져오기
    	        var selectedFileName = selectedFile ? selectedFile.name : null; // 선택된 파일의 이름

    	        if (selectedFileName && selectedFileName != detail4) {
    	            document.getElementById("hiddenInputId5").value = detail4;
    	        }
    	    };

    	    fileInput5.addEventListener('change', onChangeFunction5);
    	}
      
      if (detail5 != null) {
    	    var fileInput6 = document.getElementById('customFile6');

    	    var onChangeFunction6 = function(event) {
    	        var selectedFile = fileInput6.files[0]; // 선택된 파일 가져오기
    	        var selectedFileName = selectedFile ? selectedFile.name : null; // 선택된 파일의 이름

    	        if (selectedFileName && selectedFileName != detail5) {
    	            document.getElementById("hiddenInputId6").value = detail5;
    	        }
    	    };

    	    fileInput6.addEventListener('change', onChangeFunction6);
    	}
      
	if(bigCategory === "영화"){
		categoryTypo = "movie";
	}else if(bigCategory === "전시"){
		categoryTypo = "display";
	}else if(bigCategory === "공연"){
		categoryTypo = "show";
	}
	
	$("#scx1 option").each(function() {
	    if ($(this).text() === bigCategory) {
	      $(this).prop("selected", true);
	      return false;
	    }
	  });

	$.ajax({
           url: "manager-regist-selectbox.do",
           type: 'GET',
           data: {selectedValue:categoryTypo},
           dataType: 'json',
           success: function(response) 
           {
              $("#scx2").empty();
	          response.forEach(item => {
	            	$('#scx2').append($('<option>', {
	                  value: item.categoryType,
	                  text: item.categoryName
	              }));
	          });
	          
	          $("#scx2 option").each(function() {
	      	    if ($(this).text() === totalCategory) {
	      	      $(this).prop("selected", true);
	      	      return false;
	      	    }
	      	  });
           },
           error: function() {
               console.log("에러");
           }
       });
	
	$('#scx1').on('change', function() {
	        var selectedValue = $(this).val();
	        $.ajax({
	            url: "manager-regist-selectbox.do",
	            type: 'GET',
	            data: {selectedValue:selectedValue},
	            dataType: 'json',
	            success: function(response) {
	            $("#scx2").empty();
	             response.forEach(item => {
	            	$('#scx2').append($('<option>', {
	                  value: item.categoryType,
	                  text: item.categoryName
	              }));
	          });
	                
	            },
	            error: function() {
	                console.log("에러");
	            }
	        });
	    });
	}
	
	$(function(){
		
		$(".modal-trigger").click(function(){
			var productNo = $(this).find("#td1").text();
			
	 	      $.ajax({
				// 요청 보내기
				url:"manager-search-read.do", // 어느 url로 보낼것인지
				data:{productNum:productNo}, // 보낼 데이터, 키:벨류 세트로 보내야함
				type:"get", // 요청 방식 지정
				// 응답을 받아 주기
				success:function(result){ // 성공시 응답 데이터가 자동으로 매개변수로 넘어옴
				
					pno = result.productNo;
					var inputString1 = result.category;
					var regex = /(.*?)\((.*?)\)/; // (그림)과 (전시) 사이의 문자열을 추출하는 정규식
					var match = inputString1.match(regex);

				    bigCategory = match[2];
				    smallCategory = match[1];
				    totalCategory = match[1] + "(" + match[2] + ")";
				    
				  	title = result.title;
				  	local = result.local;
				  	address = result.address;
				  	start = result.start;
				  	end = result.end;
				  	level = result.level;
				  	runtime = result.runtime;
				  	price = result.price;
				  	dayTime = result.dayTime;
				  	noonTime = result.noonTime;
				  	daySeats = result.daySeats;
				  	noonSeats = result.noonSeats;
				  	imagePath = result.imagePath;
				  	
					poster = result.posterName;
					detail1 = result.detail1Name;
					detail2 = result.detail2Name;
					detail3 = result.detail3Name;
					detail4 = result.detail4Name;
					detail5 = result.detail5Name;
										
					var image1 = document.createElement("img");
		            image1.src = "data:image/jpeg;base64," + result.posterImage; 
		            image1.alt = "Poster Image";
		            img1 = image1;
		            
		            if(detail1 != null){
		            	var image2 = document.createElement("img");
			            image2.src = "data:image/jpeg;base64," + result.detail1Image; 
			            image2.alt = "Detail1 Image";
						img2 = image2;
		            }
		            
		            if(detail2 != null){
		            	var image3 = document.createElement("img");
			            image3.src = "data:image/jpeg;base64," + result.detail2Image; 
			            image3.alt = "Detail2 Image";
						img3 = image3;
		            }
		            
					if(detail3 != null){
						var image4 = document.createElement("img");
			            image4.src = "data:image/jpeg;base64," + result.detail3Image; 
			            image4.alt = "Detail3 Image";
						img4 = image4;
					}
					
					if(detail4 != null){
						var image5 = document.createElement("img");
			            image5.src = "data:image/jpeg;base64," + result.detail4Image; 
			            image5.alt = "Detail4 Image";
						img5 = image5;
					}
					
					if(detail5 != null){
						var image6 = document.createElement("img");
			            image6.src = "data:image/jpeg;base64," + result.detail5Image; 
			            image6.alt = "Detail5 Image";
						img6 = image6;
					}
					
					/*
					var image1 = document.createElement("img");
		            image1.src = "data:image/jpeg;base64," + result.posterImage; 
		            image1.alt = "Poster Image";
		            img1 = image1;
		            
		            var image2 = document.createElement("img");
		            image2.src = "data:image/jpeg;base64," + result.detail1Image; 
		            image2.alt = "Detail1 Image";
					img2 = image2;
					
					var image3 = document.createElement("img");
		            image3.src = "data:image/jpeg;base64," + result.detail2Image; 
		            image3.alt = "Detail2 Image";
					img3 = image3;
					
					var image4 = document.createElement("img");
		            image4.src = "data:image/jpeg;base64," + result.detail3Image; 
		            image4.alt = "Detail3 Image";
					img4 = image4;
					
					var image5 = document.createElement("img");
		            image5.src = "data:image/jpeg;base64," + result.detail4Image; 
		            image5.alt = "Detail4 Image";
					img5 = image5;
					
					var image6 = document.createElement("img");
		            image6.src = "data:image/jpeg;base64," + result.detail5Image; 
		            image6.alt = "Detail5 Image";
					img6 = image6;
					*/
										
					var inputString2 = result.category;
					var extractedPart = inputString2.match(/\((.*?)\)/)[1];
					modal.style.display = "block";
			        modalText.innerHTML = `
			        <div style="display: flex;">
			    <div class="outer" style="margin-left: 31px;">
			      <table id="table2" align="center">
			        <tr>
			          <td>상품번호</td>
			          <td colspan="3"><input type="text" id="pno" class="god1"></td>
			        </tr>
			        <tr>
			          <td>카테고리</td>
			          <td colspan="3"><input type="text" id="bigCategory" class="god1"></td>
			        </tr>
			        <tr>
			          <td>상품명</td>
			          <td colspan="3"><input type="text" id="ptitle" class="god1"></td>
			        </tr>
			        <tr>
			          <td>지역</td>
			          <td colspan="3"><input type="text" id="plocal" class="god1"></td>
			        </tr>
			        <tr>
			          <td>상세장소</td>
			          <td colspan="3"><input type="text" id="paddress" class="god1"></td>
			        </tr>
			        <tr>
			          <td>시작날짜</td>
			          <td colspan="3"><input type="text" id="startdate" class="god1"></td>
			        </tr>
			        <tr>
			          <td>종료날짜</td>
			          <td colspan="3"><input type="text" id="enddate" class="god1"></td>
			        </tr>
			        <tr>
			          <td>관람등급</td>
			          <td colspan="3"><input type="text" id="level" class="god1"></td>
			        </tr>
			        <tr>
			          <td>상영시간</td>
			          <td colspan="3"><input type="text" id="runtime" class="god1"></td>
			        </tr>
			        <tr>
			          <td>가격</td>
			          <td colspan="3"><input type="text" id="pprice" class="god1"></td>
			        </tr>
			        <tr>
			          <td colspan="4">
			            <hr>
			          </td>
			        </tr>
			        <tr>
			          <td>오전</td>
			          <td colspan="3"><input type="text" id="day" class="god1"></td>
			        </tr>
			        <tr>
			          <td>오후</td>
			          <td colspan="3"><input type="text" id="noon" class="god1"></td>
			        </tr>
			        <tr>
			          <td colspan="4">
			            <hr>
			          </td>
			        </tr>
			        <tr>
			          <td>오전 좌석수</td>
			          <td colspan="3"><input type="text" id="dayseat" class="god1"></td>
			        </tr>
			        <tr>
			          <td>오후 좌석수</td>
			          <td colspan="3"><input type="text" id="noonseat" class="god1"></td>
			        </tr>
			        <tr>
			          <td colspan="4">
			            <hr>
			          </td>
			        </tr>
			        <tr>
			          <td colspan="4" align="center">
			            <button id="modbtn1" class="tb2-btn" style="margin-left: 75px; font-family: 'Jua', sans-serif;" onclick="funx1();">수정</button>
			            <button class="tb2-btn" onclick="canc();" style="font-family: 'Jua', sans-serif;">취소</button>
			          </td>
			        </tr>
			      </table>
			    </div>
			    <div>
			      <table id="table3">
			        <tr>
			          <td><button class="gta1 poster" style="font-family: 'Jua', sans-serif;" onclick="funcx3(1);">포스터</button></td>
			        </tr>
			        <tr>
			          <td><button class="gta1 poster" style="font-family: 'Jua', sans-serif;" onclick="funcx3(2);">상세1</button></td>
			        </tr>
			        <tr>
			          <td><button class="gta1 poster" style="font-family: 'Jua', sans-serif;" onclick="funcx3(3);">상세2</button></td>
			        </tr>
			        <tr>
			          <td><button class="gta1 poster" style="font-family: 'Jua', sans-serif;" onclick="funcx3(4);">상세3</button></td>
			        </tr>
			        <tr>
			          <td><button class="gta1 poster" style="font-family: 'Jua', sans-serif;" onclick="funcx3(5);">상세4</button></td>
			        </tr>
			        <tr>
			          <td><button class="gta1 poster" style="font-family: 'Jua', sans-serif;" onclick="funcx3(6);">상세5</button></td>
			        </tr>
			      </table>
			    </div>
			  </div>`;
			  $("#pno").val(result.productNo);
			  $("#bigCategory").val(extractedPart);
			  $("#ptitle").val(result.title);
			  $("#plocal").val(result.local);
			  $("#paddress").val(result.address);
			  $("#startdate").val(result.start);
			  $("#enddate").val(result.end);
			  $("#level").val(result.level);
			  $("#runtime").val(result.runtime);
			  $("#pprice").val(result.price);
			  $("#day").val(result.dayTime);
			  $("#noon").val(result.noonTime);
			  $("#dayseat").val(result.daySeats);
			  $("#noonseat").val(result.noonSeats);
				},
				error:function(){
					console.log("통신실패");
				}
			});
		}); 

		    closeButton.addEventListener("click", function() {
		      modal.style.display = "none";
		    });

		    window.addEventListener("click", function(event) {
		      if (event.target === modal) {
		        modal.style.display = "none";
		      }
		    });

		    closeButton1.addEventListener("click", function() {
		      modal1.style.display = "none";
		    });

		    window.addEventListener("click", function(event) {
		      if (event.target === modal1) {
		        modal1.style.display = "none";
		      }
		    });
		    
		    // 페이지 로딩 후 모달을 숨기는 부분 추가
		    modal.style.display = "none";
		    
		    var reviewbtn = document.querySelectorAll(".reviewbtn");

		  reviewbtn.forEach(function(button) {
		    button.addEventListener("click", function() {
		    	var $row = $(this).closest("tr");

		        // 선택된 행에서 각각의 td 요소의 내용을 가져옵니다.
		        var no = $row.find("#td1").text();
		        upno = no;
		        productNo = no;
		        $("#dsearchArea1").val("");
		        $("#dxdy1").val("리뷰번호");
		        
		        for(var i=1; i<=5; i++){
		        	$("#grand" + i).css("display", "none");
		        }
		        
		        $("#before").css("display", "none");
		        $("#after").css("display", "none");

		        $.ajax({
                    type: "GET",
                    url: "manager-search-reviewList.do", // 여기에 서블릿 URL을 입력하세요
                    data: { 
                    	pno: no,
                    	cpage: 1,
                    	reviewSearchType: null,
                    	reviewSearchContent: null
                    },
                    success: function (r) {
                     if(r.reviews[0]) 	$("#rno1").text(r.reviews[0].rno);	 else  	$("#rno1").text("");
                   	 if(r.reviews[1])   $("#rno2").text(r.reviews[1].rno);	 else  	$("#rno2").text("");
                   	 if(r.reviews[2])   $("#rno3").text(r.reviews[2].rno);	 else  	$("#rno3").text("");
                   	 if(r.reviews[3])   $("#rno4").text(r.reviews[3].rno);	 else  	$("#rno4").text("");
                   	 if(r.reviews[4])   $("#rno5").text(r.reviews[4].rno);	 else  	$("#rno5").text("");
                   	 if(r.reviews[5])   $("#rno6").text(r.reviews[5].rno);	 else  	$("#rno6").text("");
                   	 if(r.reviews[6])   $("#rno7").text(r.reviews[6].rno);	 else  	$("#rno7").text("");
                   	 if(r.reviews[7])   $("#rno8").text(r.reviews[7].rno);	 else  	$("#rno8").text("");
                   	 if(r.reviews[8])   $("#rno9").text(r.reviews[8].rno);	 else  	$("#rno9").text("");
                   	 if(r.reviews[9])   $("#rno10").text(r.reviews[9].rno);	 else  	$("#rno10").text("");
                  	 
                   	 if(r.reviews[0])   $("#userNo1").text(r.reviews[0].userNo);	 else  	$("#userNo1").text("");
                   	 if(r.reviews[1])   $("#userNo2").text(r.reviews[1].userNo);	 else  	$("#userNo2").text("");
                   	 if(r.reviews[2])   $("#userNo3").text(r.reviews[2].userNo);	 else  	$("#userNo3").text("");
                   	 if(r.reviews[3])   $("#userNo4").text(r.reviews[3].userNo);	 else  	$("#userNo4").text("");
                   	 if(r.reviews[4])   $("#userNo5").text(r.reviews[4].userNo);	 else  	$("#userNo5").text("");
                   	 if(r.reviews[5])   $("#userNo6").text(r.reviews[5].userNo);	 else  	$("#userNo6").text("");
                   	 if(r.reviews[6])   $("#userNo7").text(r.reviews[6].userNo);	 else  	$("#userNo7").text("");
                   	 if(r.reviews[7])   $("#userNo8").text(r.reviews[7].userNo);	 else  	$("#userNo8").text("");
                   	 if(r.reviews[8])   $("#userNo9").text(r.reviews[8].userNo);	 else  	$("#userNo9").text("");
                   	 if(r.reviews[9])   $("#userNo10").text(r.reviews[9].userNo);	 else  	$("#userNo10").text("");
                   	 
                   	 if(r.reviews[0])   $("#reviewDate1").text(r.reviews[0].reviewDate);	 else  	$("#reviewDate1").text("");
                   	 if(r.reviews[1])   $("#reviewDate2").text(r.reviews[1].reviewDate);	 else  	$("#reviewDate2").text("");
                   	 if(r.reviews[2])   $("#reviewDate3").text(r.reviews[2].reviewDate);	 else  	$("#reviewDate3").text("");
                   	 if(r.reviews[3])   $("#reviewDate4").text(r.reviews[3].reviewDate);	 else  	$("#reviewDate4").text("");
                   	 if(r.reviews[4])   $("#reviewDate5").text(r.reviews[4].reviewDate);	 else  	$("#reviewDate5").text("");
                   	 if(r.reviews[5])   $("#reviewDate6").text(r.reviews[5].reviewDate);	 else  	$("#reviewDate6").text("");
                   	 if(r.reviews[6])   $("#reviewDate7").text(r.reviews[6].reviewDate);	 else  	$("#reviewDate7").text("");
                   	 if(r.reviews[7])   $("#reviewDate8").text(r.reviews[7].reviewDate);	 else  	$("#reviewDate8").text("");
                   	 if(r.reviews[8])   $("#reviewDate9").text(r.reviews[8].reviewDate);	 else  	$("#reviewDate9").text("");
                   	 if(r.reviews[9])   $("#reviewDate10").text(r.reviews[9].reviewDate);	 else  	$("#reviewDate10").text("");
                   	 
                   	 if(r.reviews[0])   $("#content1").text(r.reviews[0].content);	 else  	$("#content1").text("");
                   	 if(r.reviews[1])   $("#content2").text(r.reviews[1].content);	 else  	$("#content2").text("");
                   	 if(r.reviews[2])   $("#content3").text(r.reviews[2].content);	 else  	$("#content3").text("");
                   	 if(r.reviews[3])   $("#content4").text(r.reviews[3].content);	 else  	$("#content4").text("");
                   	 if(r.reviews[4])   $("#content5").text(r.reviews[4].content);	 else  	$("#content5").text("");
                   	 if(r.reviews[5])   $("#content6").text(r.reviews[5].content);	 else  	$("#content6").text("");
                   	 if(r.reviews[6])   $("#content7").text(r.reviews[6].content);	 else  	$("#content7").text("");
                   	 if(r.reviews[7])   $("#content8").text(r.reviews[7].content);	 else  	$("#content8").text("");
                   	 if(r.reviews[8])   $("#content9").text(r.reviews[8].content);	 else  	$("#content9").text("");
                   	 if(r.reviews[9])   $("#content10").text(r.reviews[9].content);	 else  	$("#content10").text("");
                       
                   	for(var i=1; i<=10; i++){
	       		    	 $("#content" + i).css("display", "none");
	       		    	 $("#delBtn" + i).css("display", "none");
	       		     }         	 
	       		     var reviewsNum = parseInt(r.pi.listCount);
	       		     var currfpage = parseInt(r.pi.currentPage);
	       		     
	       		     var pageNjk = 10 - (currfpage * 10 - reviewsNum);
	       		     
	       		     for(var i=1; i<=pageNjk; i++){
	       		    	 $("#content" + i).css("display", "block");
	       		    	 $("#delBtn" + i).css("display", "block");
	       		     }
                   	 
                       var count = 1;
                       
                       for(var i=1; i<=5; i++){
                    	   $("#grand" + i).prop("disabled", false);
                       }
                     
                       $("#grand" + r.pi.currentPage).prop("disabled", true);
                       curpagee = r.pi.currentPage;
                       firstpage = parseInt(r.pi.startPage);
                       for(var i=r.pi.startPage; i<=r.pi.endPage; i++){
                    	   $("#grand" + count).css("display", "block");
                    	   $("#grand" + count).text(i);
                    	   count++;
                       }
                       
                       if(r.pi.startPage != 1){
                    	   $("#before").css("display", "block");
                       }
                       
                       if(r.pi.endPage < r.pi.maxPage){
                    	   $("#after").css("display", "block");
                       } 
                    },
                    error: function () {
                        alert("요청 실패");
                    }
                });
		        
		      modal2.style.display = "block";
		      modalText2.innerHTML = `
		  <hr>
		  <div>
		    <table id="tables5">
		      <tr style="width: 600px;">
		        <td style="width: 152px;">리뷰번호</td>
		        <td style="width: 157px;">회원번호</td>
		        <td style="width: 150px;">작성날짜</td>
		        <td></td>
		      </tr>
		    </table>
		    <div id="tables4Div" style="background-color: #EDEDED;">
		      <table id="tables4">
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno1"></td>
		          <td style="width: 150px;" id="userNo1"></td>
		          <td style="width: 150px;" id="reviewDate1"></td>
		          <td style="width: 150px;">
		            <button id="delBtn1" onclick="deleteReview(this, 1);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content1"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno2"></td>
		          <td style="width: 150px;" id="userNo2"></td>
		          <td style="width: 150px;" id="reviewDate2"></td>
		          <td style="width: 150px;">
		            <button id="delBtn2" onclick="deleteReview(this, 2);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content2"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno3"></td>
		          <td style="width: 150px;" id="userNo3"></td>
		          <td style="width: 150px;" id="reviewDate3"></td>
		          <td style="width: 150px;">
		            <button id="delBtn3" onclick="deleteReview(this, 3);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content3"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno4"></td>
		          <td style="width: 150px;" id="userNo4"></td>
		          <td style="width: 150px;" id="reviewDate4"></td>
		          <td style="width: 150px;">
		            <button id="delBtn4" onclick="deleteReview(this, 4);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content4"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno5"></td>
		          <td style="width: 150px;" id="userNo5"></td>
		          <td style="width: 150px;" id="reviewDate5"></td>
		          <td style="width: 150px;">
		            <button id="delBtn5" onclick="deleteReview(this, 5);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content5"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno6"></td>
		          <td style="width: 150px;" id="userNo6"></td>
		          <td style="width: 150px;" id="reviewDate6"></td>
		          <td style="width: 150px;">
		            <button id="delBtn6" onclick="deleteReview(this, 6);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content6"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno7"></td>
		          <td style="width: 150px;" id="userNo7"></td>
		          <td style="width: 150px;" id="reviewDate7"></td>
		          <td style="width: 150px;">
		            <button id="delBtn7" onclick="deleteReview(this, 7);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content7"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno8"></td>
		          <td style="width: 150px;" id="userNo8"></td>
		          <td style="width: 150px;" id="reviewDate8"></td>
		          <td style="width: 150px;">
		            <button id="delBtn8" onclick="deleteReview(this, 8);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content8"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno9"></td>
		          <td style="width: 150px;" id="userNo9"></td>
		          <td style="width: 150px;" id="reviewDate9"></td>
		          <td style="width: 150px;">
		            <button id="delBtn9" onclick="deleteReview(this, 9);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content9"></textarea>
		          </td>
		        </tr>
		        <tr style="width: 600px;">
		          <td style="width: 150px;" id="rno10"></td>
		          <td style="width: 150px;" id="userNo10"></td>
		          <td style="width: 150px;" id="reviewDate10"></td>
		          <td style="width: 150px;">
		            <button id="delBtn10" onclick="deleteReview(this, 10);" style="margin-left: 114px; font-family: 'Jua', sans-serif;">삭제</button>
		          </td>
		        </tr>
		        <tr>
		          <td colspan="4">
		            <textarea cols="30" rows="5" style="resize: none;" id="content10"></textarea>
		          </td>
		        </tr>
		      </table>
		    </div>
		  </div>
		      `;
		    });
		  });

		  closeButton2.addEventListener("click", function() {
		      modal2.style.display = "none";
		    });

		  window.addEventListener("click", function(event) {
		    if (event.target === modal2) {
		      modal2.style.display = "none";
		    }
		  });

	});
  </script>
</body>
</html>
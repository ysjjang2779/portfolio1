<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.kh.semi01.manager.common.model.vo.PageInfo" %>
<%@page import="com.kh.semi01.user.model.vo.User" %>
<%@page import="java.util.ArrayList" %>

<%
	String contextPath = request.getContextPath();
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
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
    body{
      font-family: 'Jua', sans-serif;
    }
    div{box-sizing: border-box;}
    #tb1{
      width: 100%;
      table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
    }
    td {
      max-height: 1.5em;
      overflow: hidden;
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
      width: 20%;
    }
    #td3{
      width: 15%;
    }
    #td4{
      width: 30%;
    }
    #td5{
      width: 25%;
      border-right: none;
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
  .modal-content {
  background-color: #C9D9E6;
  padding: 5px;
  border: 1px solid #888;
  width: 585px;
  height: 540px;
  margin: auto;
  margin-top: 64px;
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
  margin-left: 550px;
  margin-top: -7px;
  margin-bottom: 2px;
  }
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
#tb2{
  margin: auto;
  text-align: left;
  margin-top: 25px;
}
#tb2 tr{
  height: 20px;
  height: 33px;
}
#tb2 input{
  border-radius: 5px;
  border: none;
  width: 275px;
  height: 28px;
  margin-top: 14px;
  margin-left: 21px;
}
#tb2 button{
  border: none;
  display: block;
  width: 70px;
  height: 30px;
  border-radius: 5px;
  font-weight: bold;
  margin-top: 54px;
}
#divs{
  display: flex;
  margin-bottom: 10px;
}
#bts1{
  margin-left: 130px;
}
#bts2{
  margin-left: 10px;
}
.hovered {
  background-color: darkgray;
  font-weight: bold;
}
.hovered1{
  background-color: black;
  font-weight: bold;
}
#divs button{
  cursor: pointer;
}
.interest{
  border-radius: 5px;
  border: none;
  width: 279px;
  height: 28px;
  margin-top: 3px;
  margin-left: 21px;
}
#tb2 button:hover{
  background-color: darkgray;
  cursor: pointer;
}
#bta1, #bta2, #bta3{
  background-color: white;
}
.scroll-container {
  background-color: white;
  width: 100%;
  height: 435px;
  overflow: auto; /* 스크롤바를 표시하도록 설정 */
  border: 1px solid #ccc;
  overflow-y: scroll;
}
#modalText #att1{
  border-radius: 5px;
  border: none;
  width: 248px;
  height: 28px;
  margin-top: 9px;
  margin-left: 4px;
  margin-right: 5px;
}
#modalText button{
  border: none;
  display: block;
  width: 70px;
  height: 30px;
  border-radius: 5px;
  font-weight: bold;
  margin-top: 9px;
  margin-right: 5px;
}
#modalText button:hover{
  background-color: darkgray;
  cursor: pointer;
}
#table5{
  width: 100%;
}
#th5{
  border-right: 2px solid #ABBBC7;
  width: 210px;
}
#th6{
  border-right: 2px solid #ABBBC7;
  width: 129px;
}
#th7{
  border-right: 2px solid #ABBBC7;
  width: 77px;
}
#th8{
  padding-right: 18px;
}
#table6{
  width: 100%;
}
#table6 tr{
  border-bottom: 2px solid #ABBBC7;
  display: block;
}
#th9{
  width: 207px;
  border-right: 2px solid #ABBBC7;
  font-weight: normal;
}
#th10{
  width: 129px;
  border-right: 2px solid #ABBBC7;
  font-weight: normal;
}
#th11{
  border-right: 2px solid #ABBBC7;
  font-weight: normal;
  width: 77px;
}
#th12{
  font-weight: normal;
  width: 113px;
}
#selectbox1{
  border-radius: 5px;
  border: none;
  width: 85px;
  height: 30px;
  margin-top: 9px;
  margin-left: 40px;
  font-weight: bold;
}
#sel10{
  border-radius: 5px;
  border: none;
  width: 279px;
  height: 28px;
  margin-top: 14px;
  margin-left: 21px;
  font-weight: bold;
}
#divs div{
	boder: none;
}
.modal-trigger td{
	height: 22px;
}
</style>
</head>
<body>
  <div class="outer" style="border: none;">
    <table id="tb1">
      <tr>
        <th id="td1">회원번호</th>
        <th id="td2">회원아이디</th>
        <th id="td3">회원명</th>
        <th id="td4">이메일</th>
        <th id="td5">전화번호</th>
      </tr>
      <%for(int i=0; i<list.size(); i++){ %>
	      <tr class="modal-trigger">
	        <td id="td1"><%=list.get(i).getUserNo() %></td>
	        <td id="td2"><%=list.get(i).getUserId() %></td>
	        <td id="td3"><%=list.get(i).getUserName() %></td>
	        <td id="td4"><%=list.get(i).getEmail() %></td>
	        <td id="td5"><%=list.get(i).getPhone() %></td>
	      </tr>
      <%} %>
    </table>
    <div>
      <div id="buttondiv" style="border: none;margin: auto; margin-top: 13px;">
		<%if(currentPage != 1){ %>
	    	<button class="btn2" style="font-family: 'Jua', sans-serif;" onclick="funcx4(<%=currentPage - 1 %>);">&lt;</button>
        <%} %>
        <%for(int p=startPage; p<=endPage; p++){ %>
	        <%if(p == currentPage){ %>
	        	<button class="btn2" style="font-family: 'Jua', sans-serif;" disabled><%=p %></button>
	        <%} else{%>
	        	<button class="btn2" style="font-family: 'Jua', sans-serif;" onclick="funcx3(<%=p %>);"><%=p %></button>
	        <%} %>
        <%} %>
        <%if(currentPage != maxPage){ %>
        	<button class="btn2" style="font-family: 'Jua', sans-serif;" onclick="funcx4(<%=currentPage + 1 %>);">&gt;</button>
       	<%} %>
    </div>
    </div>
  </div>
  <div class="modal" id="modal" style="width: 1016px; height: 674.391px; position: absolute; box-sizing: border-box; left: 0; top: 0;">
    <div class="modal-content">
      <div class="close" id="closeButton" style="border:none;">
        &times;
      </div>
      <p id="modalText" style="margin-top: 0;"></p>
    </div>
  </div>
  <script>
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
    var searchKey = getCookie("searchkey");
    var searchType = getCookie("searchtype");
	function funcx4(p){
		if(searchType == null || searchKey == null){
			location.href='<%=contextPath %>/manager-member.do?cpage=' + p;			
		}else{
			location.href='<%=contextPath %>/manager-member.do?cpage=' + p + '&searchType=' + searchType + '&searchKey=' + searchKey;			
		}
	}
    function funcx3(p){
		if(searchType == null || searchKey == null){
	    	location.href='<%=contextPath%>/manager-member.do?cpage=' + p;			
		}
		else{
	    	location.href='<%=contextPath%>/manager-member.do?cpage=' + p + '&searchType=' + searchType + '&searchKey=' + searchKey;			
		}
  	}
	var userResult;
  	$(function(){
  		$(".modal-trigger").click(function(){
  			var userNo = $(this).find("#td1").text();
  	        
	 	      $.ajax({
				// 요청 보내기
				url:"manager-member-read.do", // 어느 url로 보낼것인지
				data:{userNum:userNo}, // 보낼 데이터, 키:벨류 세트로 보내야함
				type:"get", // 요청 방식 지정
				// 응답을 받아 주기
				success:function(result){ // 성공시 응답 데이터가 자동으로 매개변수로 넘어옴
					userResult = result;
					modal.style.display = "block";
			        modalText.innerHTML = `
			        <div style="border:none;">
			    <table id="tb2">
			      <tr>
			        <th style="padding-top: 13px;">회원번호</th>
			        <td><input type="number" id="memNum"></td>
			      </tr>
			      <tr>
			        <th style="padding-top: 13px;">회원아이디</th>
			        <td><input type="text" id="memId"></td>
			      </tr>
			      <tr>
			        <th style="padding-top: 13px;">회원명</th>
			        <td><input type="text" id="memName"></td>
			      </tr>
			      <tr>
			        <th style="padding-top: 13px;">생년월일</th>
			        <td><input type="text" id="memBirth"></td>
			      </tr>
			      <tr>
			        <th style="padding-top: 13px;">관심태그</th>
			        <td>
			          <div style="display: flex; margin-left: 21px; border: none;">
			            <button id="bta1" style="margin-top: 13px; margin-right: 5px; width: 90px; background-color: white; cursor: auto; font-family: 'Jua', sans-serif;">로맨스</button>
			            <button id="bta2" style="margin-top: 13px; margin-right: 5px; width: 90px; background-color: white; cursor: auto; font-family: 'Jua', sans-serif;">작품전시</button>
			            <button id="bta3" style="margin-top: 13px; width: 89px; background-color: white; cursor: auto; font-family: 'Jua', sans-serif;">클래식</button>
			          </div>
			        </td>
			      </tr>
			      <tr>
			        <th style="padding-top: 13px;">이메일</th>
			        <td><input type="text" id="memEmail"></td>
			      </tr>
			      <tr>
			        <th style="padding-top: 13px;">전화번호</th>
			        <td><input type="text" id="memPhone"></td>
			      </tr>
			      <tr>
			        <th style="padding-top: 13px;">회원등급</th>
			        <td><input type="text" id="memGrade"></td>
			      </tr>
			      <tr>
			        <td colspan="2" align="center">
			          <div id="divs" style="border: none;">
			            <button id="bts1" onclick="func1();" style="margin-top: 46px; margin-left: 132px; margin-right: 5px; font-family: 'Jua', sans-serif;">회원수정</button>
			            <button id="bts2" onclick="funcx5();" style="margin-top: 46px; margin-left: 0; font-family: 'Jua', sans-serif;">회원삭제</button>
			          </div>
			        </td>
			      </tr>
			    </table>
			  </div>
			  `;
			  const originalString1 = result.interestMovie;
			  const originalString2 = result.interestDisplay;
			  const originalString3 = result.interestShow;
			  
			  const startIndex = 0;
			  const endIndex1 = originalString1.indexOf("(");
			  const endIndex2 = originalString2.indexOf("(");
			  const endIndex3 = originalString3.indexOf("(");
			
			  const substring1 = originalString1.substring(startIndex, endIndex1);
			  const substring2 = originalString2.substring(startIndex, endIndex2);
			  const substring3 = originalString3.substring(startIndex, endIndex3);
			  $("#memNum").val(result.userNo);
			  $("#memId").val(result.userId);
			  $("#memName").val(result.userName);
			  $("#memBirth").val(result.userBirth);
			  $("#bta1").text(substring1);
			  $("#bta2").text(substring2);
			  $("#bta3").text(substring3);
			  $("#memEmail").val(result.email);
			  $("#memPhone").val(result.phone);
			  $("#memGrade").val(result.gradeNo);
				},
				error:function(){
					console.log("통신실패");
				}
			});
  		});
  	});
 
    const modalTriggerElements = document.querySelectorAll(".modal-trigger");
    const modal = document.getElementById("modal");
    const closeButton = document.getElementById("closeButton");
    const modalText = document.getElementById("modalText");

    closeButton.addEventListener("click", function() {
      modal.style.display = "none";
    });

    window.addEventListener("click", function(event) {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    });
    
    // 페이지 로딩 후 모달을 숨기는 부분 추가
    modal.style.display = "none";

    function changeBackgroundColor(element) {
      element.classList.add('hovered');
    }

    function restoreBackgroundColor(element) {
      element.classList.remove('hovered');
    }

    function func1(){
    	console.log(userResult);
		modal.style.display = "block";
		modalText.innerHTML = `
	        <div>
	    <table id="tb2">
	      <tr>
	        <th style="padding-top: 13px;">회원번호</th>
	        <td><input type="number" id="memNum1"></td>
	      </tr>
	      <tr>
	        <th style="padding-top: 13px;">회원아이디</th>
	        <td><input type="text" id="memId1"></td>
	      </tr>
	      <tr>
	        <th style="padding-top: 13px;">비밀번호</th>
	        <td><input type="password" id="memPwd1"></td>
	      </tr>
	      <tr>
	        <th style="padding-top: 13px;">회원명</th>
	        <td><input type="text" id="memName1"></td>
	      </tr>
	      <tr>
	        <th style="padding-top: 13px;">생년월일</th>
	        <td><input type="text" id="memBirth1"></td>
	      </tr>
	      <tr>
	        <th style="padding-top: 13px;">이메일</th>
	        <td><input type="text" id="memEmail1"></td>
	      </tr>
	      <tr>
	        <th style="padding-top: 13px;">전화번호</th>
	        <td><input type="text" id="memPhone1"></td>
	      </tr>
	      <tr>
	        <th style="padding-top: 13px;">회원등급</th>
	        <td>
	          <select id="sel10" style="font-family: 'Jua', sans-serif;">
	            <option value="1">아이언</option>
	            <option value="2">브론즈</option>
	            <option value="3">실버</option>
	            <option value="4">골드</option>
	            <option value="5">마스터</option>
	          </select>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2" align="center">
	          <div id="divs">
	            <button id="bts1" onclick="func5();" style="margin-top: 46px; margin-left: 132px; margin-right: 5px; font-family: 'Jua', sans-serif;">수정완료</button>
	            <button id="bts2" onclick="func2();" style="margin-top: 46px; margin-left: 0; font-family: 'Jua', sans-serif;">취소</button>
	          <div>
	        </td>
	      </tr>
	    </table>
	  </div>
	  `;
		  $("#memNum1").val(userResult.userNo);
		  $("#memId1").val(userResult.userId);
		  $("#memPwd1").val(userResult.userPwd);
		  $("#memName1").val(userResult.userName);
		  $("#memBirth1").val(userResult.userBirth);
		  $("#memEmail1").val(userResult.email);
		  $("#memPhone1").val(userResult.phone);
		  var selectBox = document.getElementById("sel10");

			// 옵션 값으로 "마스터" 옵션 찾기
			for (var i = 0; i < selectBox.options.length; i++) {
			  if (selectBox.options[i].text === userResult.gradeNo) {
			    selectBox.selectedIndex = i; // 해당 옵션 선택
			    break;
			  }
			}
			
    }
    
    function funcx5(){
    	var userNum = userResult.userNo;
    	$.ajax({
			url:"manager-member-delete.do",
			data:{
				userNo:userNum
			},
			type:"post",
			success:function(result){
				var form = $("<form>", {
	                  action: "manager-member.do", // 서블릿의 URL
	                  method: "get",
	                  style: "display: none;" // 폼을 안보이도록 스타일링
	              });
	        	  
	        	  form.append($("<input>", {
	        		    type: "hidden",
	        		    name: "cpage",
	        		    value: "1"
	              }));
	        	  
	              form.appendTo("body").submit();
			},
			error:function(){
				console.log("ajax 통신 실패!");
			}
		});
    }
    
    function func5(){
    	$.ajax({
			url:"manager-member-update.do",
			data:{
				userNo:$("#memNum1").val(),
				userId:$("#memId1").val(),
				userPwd:$("#memPwd1").val(),
				userName:$("#memName1").val(),
				userBirth:$("#memBirth1").val(),
				userEmail:$("#memEmail1").val(),
				userPhone:$("#memPhone1").val(),
				userGrade:$("#sel10").val()
			},
			type:"post",
			success:function(result){
				var form = $("<form>", {
	                  action: "manager-member.do", // 서블릿의 URL
	                  method: "get",
	                  style: "display: none;" // 폼을 안보이도록 스타일링
	              });
	        	  
	        	  form.append($("<input>", {
	        		    type: "hidden",
	        		    name: "cpage",
	        		    value: "1"
	              }));
	        	  
	              form.appendTo("body").submit();
			},
			error:function(){
				console.log("ajax 통신 실패!");
			}
		});
    }

    function func2(){
    	modal.style.display = "none";
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
  </script>
</body>
</html>
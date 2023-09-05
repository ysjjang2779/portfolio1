<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String isFirst = (String)request.getAttribute("isfirst"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>
    body{
      font-family: 'Jua', sans-serif;
    }
     #list{
      display: flex;
      height: 60px;
    }
    #select1{
        border: none;
        display: block;
        width: 100px;
        height: 30px;
        border-radius: 5px;
        font-weight: bold;
        margin-right: 5px;
        margin-top: 19.920px;
        font-family: 'Jua', sans-serif;
    }
    #inputs{
      border-radius: 5px;
      border: none;
      width: 180px;
      height: 28px;
      margin-top: 19.920px;
    }
    #button1{
      border: none;
      margin-left: 5px;
      display: block;
      width: 70px;
      height: 30px;
      border-radius: 5px;
      font-weight: bold;
      margin-right: 5px;
      margin-top: 19.920px;
      cursor: pointer;
      font-family: 'Jua', sans-serif;
      line-height: 2.4;
    }
  </style>
</head>
<body>
  <div id="list" style="height: 83px;">
    <h2 style="margin-right: 54%; margin-top:30px; margin-left: 4px;">회원목록</h2>
    <select id="select1" style="margin-top:30px;">
      <option>회원번호</option>
      <option>회원아이디</option>
      <option>회원명</option>
    </select>
    <div style="border: none;">
      <input type="text" id="inputs" style="margin-top:30px;">
    </div>
    <div style="border: none;">
      <button id="button1" style="margin-top:30px;">검색</button>
    </div>
  </div>
  
  <script> 
  <% if(isFirst != null){%>
  	deleteCookie("searchkey");
  	deleteCookie("searchtype");
  <%}%>

  function isNumber(input) {
  	return !isNaN(input);
  }
  
  function setCookie(name, value, days) {
	  var expires = "";
	  if (days) {
	    var date = new Date();
	    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	    expires = "; expires=" + date.toUTCString();
	  }
	  document.cookie = name + "=" + value + expires + "; path=/";
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
  
  function deleteCookie(name) {
	  setCookie(name, "", -1); // 쿠키 만료일을 과거로 설정하여 삭제
	}
  
  var searchKey = getCookie("searchkey");
  var searchType = getCookie("searchtype");
  if (searchKey) {
    $("#inputs").val(searchKey);
  }
  if(searchType){
	  $("#select1").val(searchType).prop("selected", true);
  }
  
  $(function(){	  
	  $("#button1").click(function(){
		  
		  setCookie("searchkey", $("#inputs").val(), 1);
		  setCookie("searchtype", $("#select1").val(), 1);
		  
		  var form = $("<form>", {
              action: "manager-member-search.do", // 서블릿의 URL
              method: "get",
              style: "display: none;" // 폼을 안보이도록 스타일링
          });
		  
		  var selectedValue = $("#select1").val(); // 선택된 옵션의 값 가져오기
		  var inputsVal = $("#inputs").val();
		  if (selectedValue === '회원번호') {
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "cpage",
	    		    value: "1"
	          }));
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "select",
	    		    value: "user_no"
	          }));
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "val",
	    		    value: inputsVal
	          }));
		  } else if (selectedValue === '회원아이디') {
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "cpage",
	    		    value: "1"
	          }));
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "select",
	    		    value: "user_id"
	          }));
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "val",
	    		    value: inputsVal
	          }));
		  } else if (selectedValue === '회원명') {
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "cpage",
	    		    value: "1"
	          }));
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "select",
	    		    value: "user_name"
	          }));
			  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "val",
	    		    value: inputsVal
	          }));
		  } 
    	  
          form.appendTo("body").submit();
	  });     
  });
  </script>
</body>
</html>
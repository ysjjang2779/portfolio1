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
    }
    #select31{
    	border: none;
        display: block;
        width: 100px;
        height: 30px;
        border-radius: 5px;
        font-weight: bold;
        margin-right: 5px;
        margin-top: 19.920px;
       }
    #select32{
    	border: none;
        display: block;
        width: 100px;
        height: 30px;
        border-radius: 5px;
        font-weight: bold;
        margin-right: 5px;
        margin-top: 19.920px;
       }
    #inputs{
      border-radius: 5px;
      border: none;
      width: 180px;
      height: 28px;
      margin-top: 19.920px;
    }
    #inputs9{
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
      line-height: 2.5;
    }
    #button98{
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
      line-height: 2.5;
    }
  </style>
</head>
<body>
  <div id="list">
    <h2 style="margin-right: 6px; margin-top: 30px; margin-left: 4px;">상품목록</h2>
    <select id="select31" style="margin-right: 442px; margin-top: 28px; font-family: 'Jua', sans-serif;">
      <option>전체</option>
      <option>영화</option>
      <option>전시</option>
      <option>공연</option>
    </select>
    <select id="select32" style="margin-top: 28px; font-family: 'Jua', sans-serif;">
      <option>상품번호</option>
      <option>상품이름</option>
      <option>지역</option>
    </select>
    <div>
      <input type="text" id="inputs9" style="margin-top: 28px;">
    </div>
    <div>
      <button type="submit" id="button98" style="margin-top: 28px; font-family: 'Jua', sans-serif;">검색</button>
    </div>
  </div>
</body>
<script>
<% if(isFirst != null){%>
	deleteCookie("searchval");
	deleteCookie("searchtype1");
	deleteCookie("searchtype2")
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

var searchVal = getCookie("searchval");
var searchType1 = getCookie("searchtype1");
var searchType2 = getCookie("searchtype2");

if (searchVal) {
	$("#inputs9").val(searchVal);
}

if(searchType1){
	$("#select32").val(searchType1).prop("selected", true);
}

if(searchType2){
	$("#select31").val(searchType2).prop("selected", true);
}

$(function(){	  
	
	$("#select31").on("change", function() {
	  setCookie("searchtype2", $("#select31").val(), 1);
	  deleteCookie("searchval");
	  deleteCookie("searchtype1");
	  var selectedValue = $(this).val();
	  
	  if (selectedValue === "영화") {
		  var form = $("<form>", {
              action: "manager-search-bycategory.do", // 서블릿의 URL
              method: "get",
              style: "display: none;" // 폼을 안보이도록 스타일링
          });
		  
		  form.append($("<input>", {
  		    type: "hidden",
  		    name: "cpage",
  		    value: "1"
        }));
    	  
    	  form.append($("<input>", {
    		    type: "hidden",
    		    name: "category",
    		    value: "영화"
          }));
    	  
          form.appendTo("body").submit();
	    } else if (selectedValue === "전시") {
	    	var form = $("<form>", {
	              action: "manager-search-bycategory.do", // 서블릿의 URL
	              method: "get",
	              style: "display: none;" // 폼을 안보이도록 스타일링
	          });
			  
			  form.append($("<input>", {
	  		    type: "hidden",
	  		    name: "cpage",
	  		    value: "1"
	        }));
	    	  
	    	  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "category",
	    		    value: "전시"
	          }));
	    	  
	          form.appendTo("body").submit();
	    } else if (selectedValue === "공연") {
	    	var form = $("<form>", {
	              action: "manager-search-bycategory.do", // 서블릿의 URL
	              method: "get",
	              style: "display: none;" // 폼을 안보이도록 스타일링
	          });
			  
			  form.append($("<input>", {
	  		    type: "hidden",
	  		    name: "cpage",
	  		    value: "1"
	        }));
	    	  
	    	  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "category",
	    		    value: "공연"
	          }));
	    	  
	          form.appendTo("body").submit();
	    } else {
	    	var form = $("<form>", {
	              action: "manager-search-bycategory.do", // 서블릿의 URL
	              method: "get",
	              style: "display: none;" // 폼을 안보이도록 스타일링
	          });
			  
			  form.append($("<input>", {
	  		    type: "hidden",
	  		    name: "cpage",
	  		    value: "1"
	        }));
	    	  
	    	  form.append($("<input>", {
	    		    type: "hidden",
	    		    name: "category",
	    		    value: "전체"
	          }));
	    	  
	          form.appendTo("body").submit();
	    }
	});
	
	  $("#button98").click(function(){
		  
		  setCookie("searchval", $("#inputs9").val(), 1);
		  setCookie("searchtype1", $("#select32").val(), 1);
		  deleteCookie("searchtype2");
		  var form = $("<form>", {
            action: "/manager-search.do", // 서블릿의 URL
            method: "get",
            style: "display: none;" // 폼을 안보이도록 스타일링
        });
		  
		  var selectedValue = $("#select32").val(); // 선택된 옵션의 값 가져오기
		  var inputsVal = $("#inputs9").val();
		  
		  form.append($("<input>", {
  		    type: "hidden",
  		    name: "cpage",
  		    value: "1"
        }));
		  form.append($("<input>", {
  		    type: "hidden",
  		    name: "searchType1",
  		    value: selectedValue
        }));
		  form.append($("<input>", {
  		    type: "hidden",
  		    name: "searchVal",
  		    value: inputsVal
        }));
		  
		  form.appendTo("body").submit();
		  
	  });     
});
</script>
</html>
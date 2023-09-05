<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    div{box-sizing: border-box;}
    body{
      font-family: 'Jua', sans-serif;
    }
    #goodsform input[type="text"], #goodsform input[type="number"]{
        border: none;
        border-radius: 5px;
        height: 30px;
        width: 89%;
    }
    #bts3{
        display: block;
        width: 20%;
        height: 50px;
        margin-top: 55px;
        background-color: rgb(171, 187, 199);
        border: none;
        border-radius: 5px;
        font-size: 15px;
        font-weight: bold;
        margin: auto;
        margin-top: 62px;
    }
    #bts3:hover{
        background-color: darkgray;
        cursor: pointer;
    }
    tr{
        height: 50px;
    }
    td{
        padding: 0px;
        font-size: 15px;
        font-weight: bold;
    }
    table{
        width: 50%;
    }
    #container{
        display: flex;
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
    width: 10%;
    border:none;
    padding: 6px 12px;
    cursor: pointer;
    font-weight: bold;
    border-radius: 5px;
    margin-top: 11px;
    height: 21px;
    text-align: center;
    line-height: 1.5;
    }
    #filePath1, #filePath2, #filePath3, #filePath4, #filePath5, #filePath6{
        display: block;
        width: 56%;
        margin-top: 11px;
        margin-left: 14px;
    }
    #imageDisplay{
        margin-left: 76px;
        margin-top: 20px;
        width: 300px;
        height: 292px;
        background-color: white;
        position: relative;
        border-radius: 5px;
    }
    img{
        display: block;
        width: 300px;
        height: 292px;
        border-radius: 5px;
    }
    #text{
        text-align: center;
        top:109px;
        left:110px;
        position:absolute;
    }
    #date1, #span1, #date2{
        display: block;
    }
    input[type="date"]{
        width: 144px;
        border: none;
        border-radius: 5px;
        height: 30px;
        width: 42%;
        font-weight: bold;
    }
    .labels{
        font-size: 13px;
    }
    .sel101{
        border: none;
        display: block;
        width: 100px;
        height: 30px;
        border-radius: 5px;
        font-weight: bold;
    }
    #tb9 td{
    	text-align: left;
    }
  </style>
</head>
<body>
  <form action="/manager-regist-product.do" method="post" id="goodsform" style="margin-left: 38px;" enctype="multipart/form-data">
    <div id="container" style="margin-top: 13px;">
        <table id="tb9">
            <tr>
                <td>카테고리</td>
                <td style="display: flex; margin-top: 10px;">
                    <select id="selects1" name="salsa1" class="sel101" style="margin-right: 13px; font-family: 'Jua', sans-serif;">
                        <option value="movie">영화</option>
                        <option value="display">전시</option>
                        <option value="show">공연</option>
                    </select>
                    <select id="selects2" name="salsa2" class="sel101" style="font-family: 'Jua', sans-serif;">
                        <option value="1">로맨스</option>
                        <option value="2">공포/스릴러</option>
                        <option value="3">코미디</option>
                        <option value="4">액션</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="width: 23%;">제목</td>
                <td>
                    <input type="text" name="title" id="title" placeholder="제목을 입력하시오" style="font-family: 'Jua', sans-serif;">
                </td>
            </tr>
            <tr>
                <td>지역</td>
                <td>
                    <select id="selects3" name="salsa3" class="sel101" style="font-family: 'Jua', sans-serif;">
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
                <td>상세주소</td>
                <td>
                    <input type="text" name="place" id="place" placeholder="상세주소를 입력하시오" style="font-family: 'Jua', sans-serif;">
                </td>
            </tr>
            <tr>
                <td>관람시간(분)</td>
                <td>
                    <input type="number" name="time" id="time" placeholder="관람시간을 입력하시오" style="width: 150px; font-family: 'Jua', sans-serif;">
                </td>
            </tr>
            <tr>
                <td>기간</td>
                <td style="display: flex; margin-top: 9px;">
                    <input type="date" name="date1" id="date1" style="font-family: 'Jua', sans-serif;">
                    <span id="span1" style="line-height: 2.5;">&nbsp;~&nbsp;</span>
                    <input type="date" name="date2" id="date2" style="font-family: 'Jua', sans-serif;">
                </td>
            </tr>
            <tr>
                <td>시간</td>
                <td>
                    <select id="select1" name="salsa4" class="sel101" style="font-family: 'Jua', sans-serif;">
                        <option value="오전">오전</option>
                        <option value="오후">오후</option>
                        <option value="전체">전체</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>관람등급</td>
                <td>
                    <select id="select1" name="salsa5" class="sel101" style="font-family: 'Jua', sans-serif;">
                        <option value="1">전체</option>
                        <option value="2">7</option>
                        <option value="3">12</option>
                        <option value="4">15</option>
                        <option value="5">19</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>가격</td>
                <td>
                    <input type="number" name="price" id="price" placeholder="가격을 입력하시오" style="width: 150px; font-family: 'Jua', sans-serif;">
                </td>
            </tr>
            <tr>
                <td>좌석수</td>
                <td>
                    <input type="number" name="seatsNum" id="price" placeholder="좌석수를 입력하시오" style="width: 150px; font-family: 'Jua', sans-serif;">
                </td>
            </tr>
        </table>
        <div style="width: 50%; margin-top: 52px;">
            <div style="display: flex;">
                <label class="custom-file-label" for="customFile1" style="margin-left: 50px;">
                    포스터
                </label>
                <input type="file" id="customFile1" name="customFile1" class="custom-file-input">
                <input type="text" id="filePath1" placeholder="사진을 선택하시오" style="width: 48%; font-family: 'Jua', sans-serif;">
            </div>
            <div style="display: flex; margin-top: 8px;">
                <label class="custom-file-label" for="customFile2" style="margin-left: 50px;">
                    상세1
                </label>
                <input type="file" id="customFile2" name="customFile2" class="custom-file-input">
                <input type="text" id="filePath2" placeholder="사진을 선택하시오" style="width: 48%; font-family: 'Jua', sans-serif;">
            </div>
            <div style="display: flex; margin-top: 8px;">
                <label class="custom-file-label" for="customFile3" style="margin-left: 50px;">
                    상세2
                </label>
                <input type="file" id="customFile3" name="customFile3" class="custom-file-input">
                <input type="text" id="filePath3" placeholder="사진을 선택하시오" style="width: 48%; font-family: 'Jua', sans-serif;">
            </div>
            <div style="display: flex; margin-top: 8px;">
                <label class="custom-file-label" for="customFile4" style="margin-left: 50px;">
                    상세3
                </label>
                <input type="file" id="customFile4" name="customFile4" class="custom-file-input">
                <input type="text" id="filePath4" placeholder="사진을 선택하시오" style="width: 48%; font-family: 'Jua', sans-serif;">
            </div>
            <div style="display: flex; margin-top: 8px;">
                <label class="custom-file-label" for="customFile5" style="margin-left: 50px;">
                    상세4
                </label>
                <input type="file" id="customFile5" name="customFile5" class="custom-file-input">
                <input type="text" id="filePath5" placeholder="사진을 선택하시오" style="width: 48%; font-family: 'Jua', sans-serif;">
            </div>
            <div style="display: flex; margin-top: 8px;">
                <label class="custom-file-label" for="customFile6" style="margin-left: 50px;">
                    상세5
                </label>
                <input type="file" id="customFile6" name="customFile6" class="custom-file-input">
                <input type="text" id="filePath6" placeholder="사진을 선택하시오" style="width: 48%; font-family: 'Jua', sans-serif;">
            </div>
        </div>
    </div>
    
    <button id="bts3" type="submit" style="margin-top: 35px; font-family: 'Jua', sans-serif;">등록</button>
</form>

<script>
    $(function(){
   	    $('#selects1').on('change', function() {
   	        var selectedValue = $(this).val();
   	        $.ajax({
   	            url: "manager-regist-selectbox.do",
   	            type: 'GET',
   	            data: {selectedValue:selectedValue},
   	            dataType: 'json',
   	            success: function(response) {
   	            $("#selects2").empty();
   	             response.forEach(item => {
   	            	$('#selects2').append($('<option>', {
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
    });
</script>
</body>
</html>
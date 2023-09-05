<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
      body{
      font-family: 'Jua', sans-serif;
    }
    div{box-sizing: border-box;}
    #tables3{
      width: 100%;
      table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
    }
    td {
      max-height: 1.5em;
      overflow: hidden;
      white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
      text-overflow: ellipsis; /* ...으로 텍스트 표시 */
    }
    #tables3 tr:last-child{
      border-bottom: none;
    }
    #tables3 tr{
      text-align: center;
      display: block;
      border-bottom: 2px solid #ABBBC7;
      width: 100%;
      display: flex;
    }
    #tables3 tr:not(:first-child){
      cursor: pointer;
    }
    #tables3 tr th:not(:last-child){
      border-right: 2px solid #ABBBC7;
      display: block;
    }
    #tables3 tr td:not(:last-child){
      border-right: 2px solid #ABBBC7;
      display: block;
    }
    #tbs1{
      width: 40%;
    }
    #tbs2{
      width: 20%;
    }
    #tbs3{
      width: 20%;
    }
    #tbs4{
      width: 10%;
    }
    #tbs5{
      width: 15%
    }
    #tbs6{
        width: 17%;
    }
    #buttondiv{
        width: 396px;
        margin: auto;
        margin-top: 23px;
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
    #tables3 tr:not(:first-child):hover{
      background-color: darkgray;
      font-weight: bold;
    }
    #category3{
      border: none;
      border-radius: 5px;
      background-color: white;
      font-weight: bold;
      display: block;
      width: 120px;
      height: 30px;
    }
    #category3:hover{
      background-color: darkgray;
      cursor: pointer;
    }
    </style>
</head>
<body>
    <div class="outer">
        <table id="tables3">
          <tr style="font-weight: bold;">
            <td id="tbs1">제품명</td>
            <td id="tbs2">대카테고리</td>
            <td id="tbs3">소카테고리</td>
            <td id="tbs4">장소번호</td>
            <td id="tbs5">좋아요</td>
            <td id="tbs6">판매량</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
          <tr>
            <td id="tbs1">분노의질주</td>
            <td id="tbs2">영화</td>
            <td id="tbs3">액션</td>
            <td id="tbs4">02</td>
            <td id="tbs5">361</td>
            <td id="tbs6">4324</td>
          </tr>
        </table>
        <div id="buttondiv" style="margin-top: 10px;">
          <button class="btn2" style="font-family: 'Jua', sans-serif;"><</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">1</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">2</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">3</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">4</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">5</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">6</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">7</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">8</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">9</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">10</button>
          <button class="btn2" style="font-family: 'Jua', sans-serif;">></button>
        </div>
      </div>

      <script>
        $(function(){
            $("#tables3 tr:not(:first-child)").hover(function(){
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
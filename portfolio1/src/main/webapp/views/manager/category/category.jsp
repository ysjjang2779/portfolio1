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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
      body{
      font-family: 'Jua', sans-serif;
      }
        div{box-sizing: border-box;}
        #tables4{
        width: 50%;
        text-align: center;
        }
        #tables4 tr:last-child{
        border-bottom: none;
        }
        #tables4 tr{
        text-align: center;
        display: block;
        border-bottom: 2px solid #ABBBC7;
        width: 100%;
        display: flex;
        }
        #tables4 tr:not(:first-child){
        cursor: pointer;
        }
        #tables4 tr th:not(:last-child){
        border-right: 2px solid #ABBBC7;
        display: block;
        }
        #tables4 tr td:not(:last-child){
        border-right: 2px solid #ABBBC7;
        display: block;
        }
        #tba1{
            width: 33%;;
        }
        #tba2{
            width: 33%;
        }
        #tba3{
            width: 33%;
        }
        .chart-container {
          width: 100%; /* 원하는 너비로 조정 */
          height: 300px; /* 원하는 높이로 조정 */
          overflow: auto; /* 필요한 경우 스크롤 생성 */
        }
    </style>
</head>
<body>
    <div class="outer1" style="margin-top: 152px;">
        <table id="tables4" align="center">
          <tr style="font-weight: bold;">
            <td id="tba1">카테고리</td>
            <td id="tba2">좋아요</td>
            <td id="tba3">판매량</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
          <tr>
            <td id="tba1">로맨스</td>
            <td id="tba2">30211</td>
            <td id="tba3">4312</td>
          </tr>
        </table>
      </div>
    <script>
      $(function(){
            $("#tables4 tr:not(:first-child)").hover(function(){
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
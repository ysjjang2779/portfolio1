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
    <style>
        body{
        font-family: 'Jua', sans-serif;
        }
        #select1{
            border: none;
            font-weight: bold;
            border-radius: 5px;
            display: block;
            height: 30px;
        }
        #search2{
            height: 29px;
            border: none;
            border-radius: 5px;
            margin-top: 21px;
            font-weight: bold;
        }
        #search2Btn{
            height: 30px;
            border: none;
            border-radius: 5px;
            margin-top: 21px;
            font-weight: bold;
        }
        #search2Btn:hover{
            background-color: darkgray;
            cursor: pointer;
        }
        #select7{
            border: none;
            border-radius: 5px;
            height: 10px;
            margin-top: 21px;
            height: 31px;
            font-weight: bold;
            margin-right: 4px;
            margin-left: 620px;
        }
    </style>
</head>
<body>
    <div style="display: flex;">
        <h2 style="height:30px;margin-left: 4px; margin-top: 26px; margin-right: 6px; margin-bottom: 0;">이용자 통계</h2>
        <select id="select7" style="font-family: 'Jua', sans-serif; margin-top: 26px;">
            <option>회원번호</option>
            <option>이름</option>
            <option>아이디</option>
        </select>
        <input type="text" id="search2" style="margin-left: 0; font-family: 'Jua', sans-serif; margin-top: 26px;">
        <input type="button" id="search2Btn" value="검색" style="margin-left: 4px; font-family: 'Jua', sans-serif; margin-top: 26px;">
    </div>
</body>
</html>
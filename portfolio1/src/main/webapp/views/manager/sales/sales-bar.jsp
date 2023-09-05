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
        #search4Btn{
            border: none;
            height: 30px;
            border-radius: 5px;
            background-color: white;
            font-weight: bold;
            margin-left: 4px;
            margin-top: 18.5px;
            font-family: 'Jua', sans-serif;
            line-height: 2.5;
        }
        #search4Btn:hover{
            background-color: darkgray;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div style="display: flex;">
        <h2 style="height:30px; margin-top: 30px; margin-right: 6px; margin-bottom: 0;margin-left: 4px;">판매통계</h2>
        <select id="select1" style="margin-right: 4px; margin-top: 27.5px; font-family: 'Jua', sans-serif;">
            <option>영화</option>
            <option>공연</option>
        </select>
        <select id="select1" style="margin-right: 0; margin-top: 27.5px; font-family: 'Jua', sans-serif;">
            <option>로맨스</option>
            <option>액션</option>
        </select>
        <input type="button" id="search4Btn" value="검색" style="margin-top: 27.5px;">
        <input type="text" id="search2" style="margin-left: 507px; width: 213px; margin-top: 27.5px; font-family: 'Jua', sans-serif;" placeholder="제품명을 입력하시오">
        <input type="button" id="search2Btn" value="검색" style="margin-left: 4px; margin-top: 27.5px; font-family: 'Jua', sans-serif; line-height: 2.5;">
    </div>
</body>
</html>
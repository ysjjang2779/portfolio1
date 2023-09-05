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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
      body{
      font-family: 'Jua', sans-serif;
      }
        div{box-sizing: border-box;}
        #tables6{
        width: 100%;
        text-align: center;
        table-layout: fixed; /* Å×ÀÌºí ·¹ÀÌ¾Æ¿ôÀ» °íÁ¤À¸·Î ¼³Á¤ */
        }
        td {
          max-height: 1.5em;
          overflow: hidden;
          white-space: nowrap; /* ÅØ½ºÆ® ÁÙ ¹Ù²Þ ¹æÁö */
          text-overflow: ellipsis; /* ...À¸·Î ÅØ½ºÆ® Ç¥½Ã */
        }
        #tables6 tr:last-child{
        border-bottom: none;
        }
        #tables6 tr{
        text-align: center;
        display: block;
        border-bottom: 2px solid #ABBBC7;
        width: 100%;
        display: flex;
        }
        #tables6 tr:not(:first-child){
        cursor: pointer;
        }
        #tables6 tr td:not(:last-child){
        border-right: 2px solid #ABBBC7;
        display: block;
        }
        #tbb1{
        width: 15%;
        }
        #tbb2{
        width: 10%;
        }
        #tbb3{
        width: 20%;
        }
        #tbb4{
        width: 20%;
        }
        #tbb5{
        width: 35%;
        border-right: none;
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
    </style>
</head>
<body>
    <div class="outer">
        <table id="tables6">
          <tr style="font-weight: bold;">
            <td id="tbb1">È¸¿ø¹øÈ£</td>
            <td id="tbb2">ÀÌ¸§</td>
            <td id="tbb3">¾ÆÀÌµð</td>
            <td id="tbb4">¿¹¸Å¼ö</td>
            <td id="tbb5">ÃÑ°áÁ¦±Ý¾×</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
          </tr>
          <tr>
            <td id="tbb1">42131</td>
            <td id="tbb2">±è½Ã¿¬</td>
            <td id="tbb3">siyeon3212</td>
            <td id="tbb4">423</td>
            <td id="tbb5">4000000¿ø</td>
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
            $("#tables6 tr:not(:first-child)").hover(function(){
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
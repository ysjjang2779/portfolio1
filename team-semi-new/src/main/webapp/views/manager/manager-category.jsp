<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <title>������ ������</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>
    body{
      font-family: 'Jua', sans-serif;
    }
    .wrapper .divd{
      box-sizing: border-box;
      border: 1px solid #ABBBC7;
      text-align: center;
    }
    .wrapper{
        width: 1200px;
        height: 762px;
        margin: auto;
        background-color: #C9D9E6;
    }  
    .container1{
      height: 100%;
      width: 15%;
    }
    .container2{
      height: 100%;
      width: 85%;
    }
    .wrapper{
      display: flex;
    }
    .content1{
      width: 100%;
      height: 11%;
    }
    .content2{
      width: 100%;
      height: 89%;
    }
    .container1>div{
      border: 1px solid #ABBBC7;
      width: 100%;
      height: 50px;
      line-height: 30px;
      text-align: center;
      border-radius: 0;
      cursor: pointer;
        }
    .container1 .box:nth-child(2){
      border-top-left-radius: 5px;
      border-top-right-radius: 5px;
    }
    .container1 .box:nth-child(19){
      border-bottom-left-radius: 5px;
      border-bottom-right-radius: 5px;
    }
    .container1>p{
      width: 100%;
      height: 20px;
      border-radius: 10px;
      margin-top: 5px;
      padding: 10px;
      box-sizing: border-box;
      text-align: left;
      }
      .wrapper{
        border-radius: 5px;
      }
      .container1{
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
      }
      .container2{
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
      }
      .content1{
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
      }
      .content2{
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
      }
      iframe{
        width: 100%;
        height: 100%;
      }
      .style1{
        font-weight: bold;
        background-color: #C9D9E6;
      }
      .p1{
        font-weight: bold;
        background-color: #C9D9E6;
        cursor: pointer;
      }
      .p1:hover{
        background-color: #ABBBC7;
      }
      .box-with-shadow {
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
      }
      #container3 {
 		position: relative;
	  }
  </style>
</head>
<body>
  <div class="wrapper box-with-shadow divd" style="margin-top: 64px;">
    <div class="container1 divd">
      <h3 style="font-size: 30px; margin-top: 42px; margin-bottom: 37px;">������</h3>
    
      <!-- ȸ�������±� ��ȸ, ȸ������, ȸ�� �������, �Ű���Ȯ�� -->
      <div class="box style1 divd" style="line-height: 3;">ȸ������</div>
      <p class="p1" style="padding-bottom: 30px; margin-bottom: 0; margin-top: 0; border-radius: 0;">ȸ����ȸ</p>
      <!--
      <p class="p1">ȸ�������±� ��ȸ</p>
      <p class="p1">ȸ������</p>
      <p class="p1">ȸ�� �������</p>
      <p class="p1">�Ű���Ȯ��</p>
      -->
      <!--
      <div class="style1" style="line-height: 3;">������ ����</div>
      <p class="p1">�������� ��ȸ</p>
      <p class="p1">�������� ����</p>
      <p class="p1">�������� ����</p>
      <p class="p1">Q&A ����</p>
      -->
      <div class="style1 divd" style="line-height: 3;">��ǰ����</div>
      <p class="p1" style="margin-top: 0; margin-bottom: 0; padding-top: 10px; padding-bottom: 30px; border-radius: 0;">��ǰ��ȸ</p>
      <p class="p1" style="margin-top: 0; margin-bottom: 0; padding-top: 10px; padding-bottom: 30px; border-radius: 0;">��ǰ���</p>
      <!--
      <p class="p1">��ǰ����</p>
      <p class="p1 p3">��ǰ����</p>
      <p class="p1 p3">������ȸ</p>
      <p class="p1 p3" style="margin: 0; padding-bottom: 30px; border-left: 1px solid #ABBBC7; border-right: 1px solid #ABBBC7; border-radius: 0;">�������</p>
      -->
      <div class="box style1 divd" style="line-height: 3; border-bottom: 2px solid #ABBBC7;">���</div>
      <p class="p1" style="padding-bottom: 32px; margin: 0; height: 35px; border-radius: 0; border-right: 1px solid #ABBBC7; border-left: 1px solid #ABBBC7; border-radius: 0;">�Ǹ����</p>
      <p class="p1" style="margin: 0; height: 35px; border-radius: 0; border-right: 1px solid #ABBBC7; border-left: 1px solid #ABBBC7; padding-bottom: 32px; border-radius: 0;">�̿��� ���</p>
      <p class="p1" style="margin: 0; height: 35px; border-radius: 0; border-right: 1px solid #ABBBC7; border-left: 1px solid #ABBBC7; border-bottom: 1px solid #ABBBC7; padding-bottom: 32px; border-radius: 0;">ī�װ� ���</p>
      <!--
      <p class="p1" style="margin: 0; height: 35px; border-right: 1px solid #ABBBC7; border-left: 1px solid #ABBBC7; border-bottom: 1px solid #ABBBC7; padding-bottom: 32px; border-radius: 0;">��ǰ�� ���ƿ� ���</p>
      -->
    </div>
    <div class="container2 divd">
      <div class="content1 divd" id="bar" style="border-bottom-right-radius: 0;">
      	<%@include file="category/category-bar.jsp" %>
        <!-- <iframe src="member-bar.html" frameborder="0"></iframe> -->
        <!-- <iframe src="regist-bar.html" frameborder="0"></iframe> -->
        <!-- <iframe src="goodsList-bar.html" frameborder="0"></iframe> -->
        <!-- <iframe src="salesStatitics-bar.html" frameborder="0"></iframe> -->
        <!-- <iframe src="userStatitics-bar.html" frameborder="0"></iframe> -->
        <!-- <iframe src="categoryStatitics-bar.html" frameborder="0"></iframe> -->
      </div>
      <div class="content2 divd" style="background-color: rgb(237, 237, 237); border-top-right-radius: 0;" id="container3">
      	<%@include file="category/category.jsp" %>
        <!-- <iframe src="regist.html" frameborder="0"></iframe> -->
        <!-- <iframe src="member.html" frameborder="0"></iframe> -->
        <!-- <iframe src="goodsList.html" frameborder="0"></iframe> -->
        <!-- <iframe src="salesStatitics-1.html" frameborder="0"></iframe> -->
        <!-- <iframe src="salesStatitics-2.html" frameborder="0"></iframe> -->
        <!-- <iframe src="userStatitics.html" frameborder="0"></iframe> -->
      </div>
    </div>
  </div>

  <script>
    $(function(){
        $(".p1").click(function(){
          var p1content = $(this).text();
          console.log(p1content);
          
          if(p1content == "ȸ����ȸ"){
        	  var form = $("<form>", {
                  action: "manager-member.do", // ������ URL
                  method: "get",
                  style: "display: none;" // ���� �Ⱥ��̵��� ��Ÿ�ϸ�
              });
        	  
        	  form.append($("<input>", {
        		    type: "hidden",
        		    name: "cpage",
        		    value: "1"
              }));
        	  
              form.appendTo("body").submit();
          }else if(p1content == "��ǰ���"){
        	  var form = $("<form>", {
                  action: "manager-regist.do", // ������ URL
                  method: "get",
                  style: "display: none;" // ���� �Ⱥ��̵��� ��Ÿ�ϸ�
              });
              form.appendTo("body").submit();
          }else if(p1content == "��ǰ��ȸ"){
        	  var form = $("<form>", {
                  action: "manager-search.do", // ������ URL
                  method: "get",
                  style: "display: none;" // ���� �Ⱥ��̵��� ��Ÿ�ϸ�
              });
        	  
        	  form.append($("<input>", {
      		    type: "hidden",
      		    name: "cpage",
      		    value: "1"
            }));
        	  
              form.appendTo("body").submit();
          }else if(p1content == "�Ǹ����"){
        	  var form = $("<form>", {
                  action: "manager-sales.do", // ������ URL
                  method: "get",
                  style: "display: none;" // ���� �Ⱥ��̵��� ��Ÿ�ϸ�
              });
              form.appendTo("body").submit();
          }else if(p1content == "�̿��� ���"){
        	  var form = $("<form>", {
                  action: "manager-user.do", // ������ URL
                  method: "get",
                  style: "display: none;" // ���� �Ⱥ��̵��� ��Ÿ�ϸ�
              });
              form.appendTo("body").submit();
          }else if(p1content == "ī�װ� ���"){
        	  var form = $("<form>", {
                  action: "manager-category.do", // ������ URL
                  method: "get",
                  style: "display: none;" // ���� �Ⱥ��̵��� ��Ÿ�ϸ�
              });
              form.appendTo("body").submit();
          }
          
        });
    });
  </script>
</body>
</html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<style>
    /* header */
  </style>
  <style>    
    /* messageBox */
    table,  td, th{
	    border-top: 1px solid black;            
      font-family: 'IBM Plex Sans KR', sans-serif;
      /* font-family: 'Nanum Pen Script', cursive; */
	  }
    #container {
      position: relative;
      width: 100%;      
      height: 700px;      
    }
    #main_content {            
      width: 900px;
      height: 650px;
      margin: 0 auto;
    }
    #title_wrap {
      height: 90px;
      margin-top: 70px;
    }
    #title_wrap > #title {
      font-size: 36px;
      font-weight: bold;      
      color: #444c57;
    }
    #title_wrap > #caption {      
      font-size: 15px;  
      font-weight: 2.0em;
      color: #444c57;
      padding-top: 40px;
    }

    #message_list {                              
      margin-top: 110px;
      width: 850px;          
      height: 80px;
      font-size: 13px;
      line-height: 40px;
      text-align: center;
    }   

    #message_list tr th {      
      font-size: 15px;            
    }   

    #message_list td:not(:first-of-type) {
      text-align: center;    
      line-height: 1rem;      
    }    
    #modal_wrap {
      display: none;
      border: 1px solid #ccc;
      position: absolute;
      top: 0;
      left: 40%;

      width: 450px;
      height: 550px;
      
      background-color: white;
    }
    #modal_title {      
      font-size: 25px;
      color: #444c57;
      padding-top: 50px;
      padding-left: 25px;
    }
    #modal_content {
      border: 1px solid #9bbfd9;
      border-radius: 5px;
      width: 370px;
      height: 300px;
      margin: 30px auto;
      padding: 20px;
            
      color: #444c57;
      font-size: 13px;
      line-height: 1.7em;
    }
    #model_cancel {
      position: absolute;
      left: 170px;
      width: 110px;
      height: 40px;
      font-size: 14px;
      background-color: #b6e0d6;
      border: 1px solid #9bbfd9;
      border-radius: 5px;
      color: white;
    }
  </style>
</head>
<body>
  <header style="height: 100px; background: #ccc">헤더 영역</header>
  <div id="container">
    <div id="main_content">
      <div id="title_wrap">
        <p id="title">메시지</p>
        <p id="caption">메시지는 실시간 채팅이 아닙니다. 주기적으로 페이지를 새로고침하세요.</p>
      </div>
      <table id="message_list">
        <thead>
        <tr>
          <th width="120">보낸 사람</th>          
          <th width="550">쪽지 내용</th>
          <th width="150">작성일</th>                   
        </tr>  
        </thead>
        <tbody>        
        <tr>
          <td>홍길동</td>
          <td>
            <div class="message_content">
              상품 재입고는 언제쯤 하나요?
            </div>
          </td>
          <td>2022-07-23</td>          
        </tr>
        <tr>
          <td>홍길동</td>
          <td>
            <div class="message_content">
              상품 교환 문의
            </div>
          </td>
          <td>2022-07-15</td>          
        </tr>
      </tbody>         
      </table>
    </div>

    <div id="modal_wrap">
      <p id="modal_title">메시지</p>      
      <div id="modal_content">
        상품 교환 문의상품 교환 문의상품 교환 문의상품 교환 문의상품 교환 문의상품 교환 문의상품 교환 문의상품 교환 문의상품 교환 문의
      </div>
      <button type="button" id="model_cancel">닫기</button>
    </div>    
  </div>
  <footer style="height: 100px; background: #ccc">푸터 영역</footer>


  <script>
    $(".message_content").click(function() {
      $("#modal_wrap").show();
    });

    $("#model_cancel").click(function() {
      $("#modal_wrap").hide();
    });
  </script>
</body>
</html>
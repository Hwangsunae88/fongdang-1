<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 펀딩 신청한 내역</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <style>    
  a {
    	text-decoration: none;
  }
  /* favorite */
  #title_wrap {     
    	border-bottom: 1px solid #ccc;         
    	height: 140px;      
  }
  #title {         
    	box-sizing: border-box;
    	width: 1200px;
    	height: 100%;
       
    	margin: 50px auto 0 auto;     
    	font-family: SUIT-SemiBold;
    	font-size: 36px;
  }          
  #page_body {            
    	height: 1100px;
    	background-color: #f5f7fa;
  }  
  #orderlist_wrap {
    	box-sizing: border-box;
    	display: flex;
    	flex-wrap: wrap;
    	margin: 0 auto;
    	padding: 30px 0;
    	width: 1200px;
    	height: 1000px;
  }
  .prod_flex {
    	border: 1px solid #ccc;
    	border-radius: 5px;
    	width: 300px;
    	height: 380px;   
    	margin: 50px;
  }
  .prod_img {        
    	width: 100%;
    	height: 240px;
  }
  .prod_info_wrap {    
    	padding: 10px;
    	background-color: white;
    	height: 130px;
  }
  .prod_name {        
    	width: 100%;
    	height: 60px;
    	font-family: SUIT-Regular;
    	font-size: 17px;
    	font-weight: bold;
    	color: black;
  }
  .prod_maker_wrap {    
    	height: 50px;
    	font-family: SUIT-Light;
    	font-size: 13px;
    	color: #444c57;
  }
  .number_wrap {
    	position: relative;
  }
  .achievement_rate {
	  	font-family: SUIT-Regular;
	    font-size: 15px;
	    color: #9bbfd9;
  }
  .limit_date {
    	position: absolute;
    	right: 0;
    	color: #444c57;
    	font-family: SUIT-Light;
    	font-size: 13px;
    	font-weight: normal;
  }
  #empty_content {   
  		margin: 150px auto;	
    	height: 170px;
    	line-height: 1.5em;
    	text-align: center;
    	font-family: SUIT-Regular;
    	font-size: 17px;
    	font-weight: 300;
    	color: #444c57;	
    }
  #funding_root {  		
  		color: #9bbfd9;
  		line-height: 5em;
  }    
  #prev_next {
      	text-align: center;      	
      	margin: 20px auto 0 auto;
    }
  #prev_next a {
    	text-decoration: none;
   		color: #444c57;
   		font-size: 17px;
  }
</style>
</head>
<body>  
	<jsp:include page="../header.jsp"/>
	
  <div id="title_wrap">
    <p id="title">나의 펀딩</p>        
  </div>
  <div id="page_body">  
    <div id="orderlist_wrap">
<c:if test="${!empty orderlist}">
	<c:forEach items="${orderlist}" var="orderlist">
		<a href="<%=request.getContextPath()%>/funding/info/${orderlist.p_no}">
        <div class="prod_flex">
          <img class="prod_img" src="${orderlist.p_thumbnail}">
          <div class="prod_info_wrap">
            <p class="prod_name">${orderlist.p_name}</p>
            <p class="prod_maker_wrap">
              <span>${orderlist.category_name}</span>｜
              <span>${orderlist.maker_name}</span>
            </p>
            <p class="number_wrap">
              <span class="achievement_rate">${orderlist.p_goal_percent}%</span>
              <span class="limit_date">${orderlist.d_day}일 남음</span>
            </p>
          </div>        
        </div>
      </a>
	</c:forEach>
</c:if>    
<c:if test="${empty orderlist }">
		<p id="empty_content">
			펀딩 신청 내역이 없습니다.<br>
		</p>
</c:if>    
      <!-- <a href="#">
        <div class="prod_flex">
          <img class="prod_img" src="">
          <div class="prod_info_wrap">
            <p class="prod_name">[5점앵콜]속각질 뽑아내고, 속보습 채우는 참마 비건클렌저</p>
            <p class="prod_maker_wrap">
              <span>카테고리</span>｜
              <span>메이커명</span>
            </p>
            <p class="number_wrap">
              <span class="achievement_rate">달성률%</span>
              <span class="limit_date">7일 남음</span>
            </p>
          </div>        
        </div>
      </a> -->
      
      
      
    </div>   
    
    <p id="prev_next">
      	<c:if test="${ startPage > 1 }">
				<a href="<%=request.getContextPath()%>/member/orderlist?page=${ startPage-1}">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" var="p">
				<a href="<%=request.getContextPath()%>/member/orderlist?page=${ p}">${ p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			<c:if test="${endPage < totalPageCnt }">
				<a href="<%=request.getContextPath()%>/member/orderlist?page=${ endPage+1}">다음</a>
			</c:if>
      </p>  
  </div>
	
  <jsp:include page="../footer.jsp"/>
</body>
</html>
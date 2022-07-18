<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 관리자페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
/* header */
#admin_navigator {
	border-bottom: 1px solid #ccc;
	box-sizing: border-box;
	height: 130px;
	color: #444c57;
	padding-top: 20px;
}

#admin_navigationbar {
	position: relative;
	width: 1280px;
	height: 100px;
	margin: 0 auto;
}

#logo_wrap {
	position: absolute;
	top: 0;
	width: 100px;
}

#logo {
	width: 95px;
	height: 65px;
}

#admin_header_title {
	position: absolute;
	top: 30%;
	left: 150px;
	font-family: SUIT-SemiBold;
	font-size: 28px;
}
</style>
<style>
/* main section */
a {
	text-decoration: none;
}

#container {
	display: flex;
	flex-flow: row wrap;
	margin: 0 auto;
	width: 1200px;
	height: 800px;
}

#admin_nav {
	/* float: left; */
	width: 20%;
	height: 100%;
}

#admin_nav ul {
	border-right: 1px solid #ccc;
	width: 200px;
	height: 600px;
	padding-top: 50px;
}

#admin_nav li {
	margin: 25px;
}

#admin_nav li a {
	color: #444c57;
}

.main_menu {
	font-family: SUIT-SemiBold;
	font-size: 20px;
	font-weight: bold;
}

.sub_menu {
	padding-left: 30px;
	font-family: SUIT-Regular;
	font-size: 14px;
}

#main_body {
	width: 80%;
	height: 100%;
}
</style>
<style>
.tableWrap {
	position: relative;
	top: 10%;
}

.page_title {
	top: 5%;
	text-align: center;
	position: relative;
}

.table {
	text-align: center;
}

.table tr th,.table tr td {
	width: 100px;
	max-width: 100px;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="admin_navigator">
		<div id="admin_navigationbar">
			<div id="logo_wrap">
				<!-- TODO: 퐁당 메인 페이지 URL 작성하기 -->
				<a href="<%=request.getContextPath()%>/"> <img
					src="<%=request.getContextPath()%>/resources/images/logo.png"
					id="logo">
				</a>
			</div>
			<div id="admin_header_title">
				<p>관리자 페이지</p>
			</div>
		</div>
	</div>
	<div id="container">
		<div id="admin_nav">
			<ul>
		<li><a href="<%= request.getContextPath()%>/admin/memberManagement" class="main_menu">회원 관리</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/memberManagement" class="sub_menu">회원 조회</a></li>
        <li><a href="#" class="main_menu">펀딩 관리</a></li>
        <li><a href="#" class="sub_menu">승인 요청목록</a></li>
        <li><a href="#" class="sub_menu">펀딩 일정 관리</a></li>
        <li><a href="#" class="sub_menu">신고 상품</a></li>
        <li><a href="#" class="sub_menu">펀딩매출관리</a></li>
        <li><a href="#" class="main_menu">고객 센터</a></li>
        <li><a href="#" class="sub_menu">공지사항</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ask" class="sub_menu">1:1문의</a></li>
					class="sub_menu">1:1문의</a></li>
			</ul>
		</div>

		<div id="main_body">
			<h3 class="page_title" style="font-size: 22px;">1:1 문의내역 관리</h3>
			<div class="tableWrap">
				<p style="margin-bottom: 22px;">미응답 문의</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>제목</th>
							<th>문의종류</th>
							<th>작성자(email)</th>
							<th>작성일</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody>
						<form action="answer" method="get" id="answer">
							<c:forEach items="${ask_N}" var="askN">
								<tr>
									<input type="hidden" name="ask_no" value="${askN.ask_no}">
									<td>${askN.ask_title}</td>
									<td>${askN.ask_category}</td>
									<td>${askN.email}</td>
									<td>${askN.ask_date}</td>
									<td style="width: 110px;"><a
										href="<%=request.getContextPath()%>/admin/answer/${askN.ask_no}">답변하러가기</a>
									</td>
								</tr>
							</c:forEach>
						</form>
					</tbody>
				</table>

				<p style="margin-top: 75px;margin-bottom: 22px;">응답완료 문의</p>

				<table class="table table-hover">
					<thead>
						<tr>
							<th>제목</th>
							<th>문의종류</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ask_Y}" var="askY">
							<tr>
								<td>${askY.ask_title}</td>
								<td>${askY.ask_category}</td>
								<td>${askY.email}</td>
								<td>${askY.ask_date}</td>
								<td style="width: 110px;">답변내용확인
									
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
		$("#admin_nav ul li a").click(function() {
			console.log("click()");
			var before_color = '#444c57';
			var after_color = '#9bbfd9';

			// 클릭한 이벤트 객체의 폰트색 변경
			$(this).css('color', after_color);
			// 클릭하지 않은 다른 객체들의 폰트색 변경
			$("#admin_nav > ul> li > a").not(this).css('color', before_color);
		});
	</script>
<!-- 	<script>
		$("button[id^='ans_button']").on('click', function(e) {
			answer.submit();
			function($(this));
		});
	</script> -->
</body>
</html>

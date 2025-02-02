<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bottSTrap CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- bootStrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- CSS -->
<link rel="stylesheet" href="/css/styles.css">
<title>SideBar sub menus</title>
</head>

<body class="" id="body-pd" onload="printClock()">
	<nav
		class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100"
		style="position: absolute">
		<header
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/" class="navbar-brand"> <img class="img-fluid"
				src="/images/logo2.png" alt="logo2" style="height: 40px;"> <use
					xlink:href="#bootstrap"></use> </svg>
			</a>

			<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<jsp:include page="../navHeader.jsp"></jsp:include>
			</ul>
		</header>
	</nav>
	<!-- /header -->
	<!-- side nav bar -->
	<div class="l-navbar" id="navbar">
		<nav class="navv">
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
				</div>
				<div class="nav__list">
					<div href="/manager/notice/noticeList" class="nav__link collapses">
						<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">공지사항 관리</span>

						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

						<ul class="collapse__menu" style="width: 180px;">
							<a href="/manager/noticeWrite" class="collapse__sublink">공지사항 글쓰기</a>
						</ul>
					</div>
				</div>
				<a href="/logout" class="nav__link"> <ion-icon
						name="log-out-outline" class="nav__icon"></ion-icon> <span
					class="nav_name">Log out</span>
				</a>
			</div>
		</nav>
	</div>
	<!-- /side nav bar -->
	
	<!-- main content -->
	<div class="container-fluid w-100"
		style="background-color: rgb(214, 225, 237)">
		<div class="row">
			<!-- content header -->
			<jsp:include page="../contentHeader.jsp"></jsp:include>
			<!-- card header -->
			<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold"
				style="background-color: rgb(39, 40, 70); height: 40px;">
				<i class="bi bi-bookmark-fill me-2"></i>공지사항 관리 <i
					class="bi bi-chevron-right"></i>공지사항 글 조회
			</div>
			<!-- card content -->
			<div class="col-12 rounded-bottom overflow-auto bg-light p-3"
				style="min-height: 550px;">
				<table class="Notice-table table table-striped">
					<thead>
						<tr>
							<!--   <th>번호</th> -->
							<th>제목</th>
							<th>내용</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList}" var="notice" varStatus="status">
							<c:set value='${member.memRole}' var="role" />
							<%-- <c:if
								test="${notice.noticeType eq role || notice.noticeType eq 'allContent'}"> --%>
								<tr>
									<%-- <td>${status.index+1+(page * 10)}</td> --%>
									<td style="display: none;">${notice.noticeType}</td>
									<c:choose>
										<c:when test="${fn:length(notice.noticeTitle) gt 11}">
											<td><a
												href="/noticeDetail?noticeNum=${notice.noticeNum}">${fn:substring(notice.noticeTitle, 0 , 10)}....</a></td>
										</c:when>
										<c:otherwise>
											<td><a
												href="/noticeDetail?noticeNum=${notice.noticeNum}">${notice.noticeTitle }</a></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${fn:length(notice.noticeContent) gt 21}">
											<td>${fn:substring(notice.noticeContent, 0 , 20)}....</td>
										</c:when>
										<c:otherwise>
											<td>${notice.noticeContent}</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${notice.createdDate != null}">
											<c:set var="DateValue" value="${notice.createdDate}" />
											<td>${fn:substring(DateValue,0,10)}</td>
										</c:when>
										<c:when test="${notice.modifiedDate != null}">
											<c:set var="DateValue" value="${notice.modifiedDate}" />
											<td>${fn:substring(DateValue,0,10)}</td>
										</c:when>
									</c:choose>
									<td>${notice.noticeHit}</td>
								</tr>
							<%-- </c:if> --%>
						</c:forEach>
					</tbody>
				</table>
				<form action="/notice/search" method="GET"
					class="form-inline p-2 bd-highlight" role="search"
					style="display: block;">
					<input type="text" name="keyword" class="form-control" id=search
						placeholder="검색" style="width: 300px; float: left;">
					<button class="btn btn-success bi bi-search" style="float: left;"></button>
				</form>
				<nav aria-label="...">
					<ul class="pagination" style="margin-left: 40%;">

						<li class="page-item"><c:if test="${page > 0}">
								<a class="page-link" href="/notice/noticeList?page=${page-1}">Previous</a>
							</c:if> <c:if test="${page == 0 }">
								<a class="page-link">Previous</a>
							</c:if></li>
						<c:forEach var="i" begin="1" end="${noticeTotal}">
							<li id="page-item${i}" class="page-item" onclick="active(${i})">
								<a class="page-link" href="/notice/noticeList?page=${i-1 }">${i }</a>
							</li>
						</c:forEach>
						<li class="page-item"><c:if test="${page < noticeTotal-1}">
								<a class="page-link" href="/notice/noticeList?page=${page+1}">Next</a>
							</c:if> <c:if test="${page > noticeTotal-2}">
								<a class="page-link">Next</a>
							</c:if></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- footer -->
               <footer class="col-12 mt-5" style="height: 60px; font-size: 12px;">
                  @2022 ChoongAng University. All Rights Reserved.
               </footer> 

	</div>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="/js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="header.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Content</title>
	<!-- bottSTrap CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
	<!-- bootStrap Icons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- font awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- CSS -->
	<link rel="stylesheet" href="/css/stylesLec.css">
	<link rel="stylesheet" href="/css/styles.css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	/* 현재 페이지 표시하기 */
	const urlParams = new URL(location.href).searchParams;
	var page = parseInt(urlParams.get('page'));
	var pageResult = page + 1; 
	console.log(pageResult);
	$(document).ready(function(){
		$('#page-item'+pageResult).addClass(' active');		
	})


	/* 즐겨찾기 추가기능 */
	function phoneLikeSave(vIndex){
		var user= $('#user'+vIndex).val();
		console.log(user);
		$.ajax({
			url 	: '/phoneLikeSave',
			data	: {userid : user},
			dataType: 'text',
			success : function(data){
				console.log("성공");
				$('#msg').text(data);
				 
			}
		});
	}
	
</script>
</head>

<body id="body-pd">
	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/professor/main" class="navbar-brand">
				<img class="img-fluid ms-3" src="/images/logo2.png" alt="logo2" style="height: 40px;"><use xlink:href="#bootstrap"></use></svg>
			</a>
		</header>
		
		<div class=" flex-row float-end ms-4" style="float: right;">
			<span class="text-primary h5" ><b>${member.name}</b>님</span>
			<i style=" cursor: pointer;" onclick="location.href='/professor/mypage';" class="text-primary bi-gear-fill mx-2"></i>
			<span class="text-primary mx-3  font09">${member.major} | ${member.position} </span>
			
			<%-- <i class="bi bi-envelope-fill text-primary"></i>
			<span class="text-primary ms-2 font09">${email}</span>--%>			
		</div>
	</nav>
	
	<!-- side nav bar -->
	<div class="l-navbar" id="navbar">
		<nav class="navv">
			<div>
				<div class="nav__brand"><ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo"></a>
				</div>
				<!-- <a href="/professor/calenderForm" class="nav__link active"><i class="bi bi-calendar-plus nav__icon" ></i>
					<span class="nav_name">캘린더</span>
				</a> -->

				<div class="nav__list">
					<a href="/notice/noticeList" class="nav__link"><ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">공지사항</span>
					</a>
	
					<div href="#" class="nav__link collapses ">
						<i class="bi bi-mortarboard-fill nav__icon"></i>
						<span class="nav_name mt-1">학사관리</span>
						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
						<ul class="collapse__menu" style="width: 180px;">
							<a href="#" class="collapse__sublink mt-2 mb-3" style="font-size: 0.85rem; display: block;">강의시간표</a>
							<a href="/professor/lecMgMain"		class="collapse__sublink mb-1" style="display: block;font-size: 0.85rem;">강의관리</a>
							<a href="/professor/lecCheckList"	class="collapse__sublink ms-3" style="font-size: 0.8rem; display: block;">전자출석부</a>
							<a href="/professor/reportList"		class="collapse__sublink ms-3 mb-3"  style="font-size: 0.8rem; display: block;">과제관리</a>
							
							<a href="/professor/lecPlanPage"	class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의계획서</a>
							<a href="/professor/lecCreateList"	class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의개설</a>
							<a href="/professor/lecScore"		class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">성적관리</a>
							<a href="/professor/makeupPage"		class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">휴&#183;보강 신청</a>
						<!--  <a href="#" class="collapse__sublink" style="font-size: 0.85rem; display: block;">내선번호관리</a> -->
						</ul>
					</div>
	
					 <!--  <a href="/manage/approval" class="nav__link">
					<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">결재</span>
               </a> -->
						<a href="/professor/mypage" class="nav__link">
							<ion-icon name="settings-outline" class="nav__icon"></ion-icon>
							<span class="nav_name">개인정보관리</span>
						</a>
					</div>
					<a href="/logout" class="nav__link">
						<ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">Log out</span>
					</a>
			</div>
		</nav>
	</div>
	<!-- /side nav bar -->

	<!------- main content ------------>
	<div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237);">
		<div class="row">

			<!------------- card header  컨텐츠 폼------------->
			<main class="col-9 h-100 w-100">
				
				<div class="row m-5">
					<!------------- 컨텐츠 경로 ------------->
					<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
						<i class="bi bi-bookmark-fill me-2"></i>학사관리 &gt; 강의관리 </div>
					<!----- card content 내용 ------>
						<div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                    
                    <!-- 오류 메세지 출력 -->
                    <span id="msg" style="
										    font-size: medium;
										    font-style: italic;
										    color: red;
										    margin-left: 992px;
										"></span>
					<!-- ============================================== -->
					<!-- <form action="searchAddress" method="post">
					<div class = "row">
						<div class = "col-6"></div>
						<div class = "col-1"></div>		 		
						<div class = "col-4"  style="margin-bottom: 20px">
							<input  type = "text"  name = "search" class="form-control" placeholder="search">
						</div>
					</div> -->
					
                    	<table class="table table-hover">
                    		 <thead>
							    <tr><th>이름</th><th>직위</th><th>부서</th><th>연락처</th><th>즐겨찾기</th></tr>
							  </thead>
							  	<c:forEach var="address" items="${addressList}" varStatus="status">
							  	<tr>
							  		<td><input type="text" name ="userid" id = "user${status.index}" value="${address.userid}" hidden="true">
							  			${address.name }</td>
							  		<c:if test="${address.dept.upDeptno == 100}">
								  		<td>교수</td>							  		
							  		</c:if>
							  		<c:if test="${address.dept.upDeptno == 200}">
								  		<td>교직원</td>
								  	</c:if>
								 	<c:if test="${address.dept.upDeptno == null }">
								  		<td></td>
								  	</c:if>
							  		<td>${address.dept.dname}</td>
							  		<td>${address.phone}</td>
							  		<td>
							  			<button type="button" class="btn btn-outline-danger" onclick="phoneLikeSave(${status.index})">+</button>
							  		</td>
							  	</tr>	
							  	</c:forEach>
							  <tbody>
							  </tbody>
                    	</table>
                    	<nav aria-label="...">
                    	
                    	<!--================================================  -->
                    					<!-- 검색버튼 구현 -->
                    	<!--================================================  -->
	                    <form action="searchAddress">
	                    <div class="input-group mb-3" style="width: 206px;text-align: center;float: left;" >
							<input  type = "text"  name = "search" class="form-control" placeholder="이름을 검색하세요" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="bi bi-search"></i></button>
						</div>
						</form>
					  <ul class="pagination" style="margin-left: 40%;">
					  
					    <li class="page-item">
					      <c:if test="${page > 0}">
						      <a class="page-link" href="addressForm?page=${page-1}">Previous</a>				      
					      </c:if>
					      <c:if test= "${page == 0 }">
					      	  <a class="page-link">Previous</a>
					      </c:if>
					    </li>					  
					
					  <c:forEach var="i" begin="1" end="${totalPage}">
					    <li id="page-item${i}" class="page-item" onclick="active(${i})">
					    <a class="page-link" href="addressForm?page=${i-1 }" >${i }</a></li>
					  </c:forEach>
					    <li class="page-item">
					    	<c:if test="${page < totalPage-1}">
						      <a class="page-link" href="addressForm?page=${page+1}">Next</a>
					    	</c:if>
					      	<c:if test= "${page > totalPage-2}">
						      <a class="page-link">Next</a>
					      	</c:if>
					    </li>
					  </ul>
					</nav>
                    </div>
                    <!-- footer -->
         
                </div>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>
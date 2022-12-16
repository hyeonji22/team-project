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
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=address]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}


const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>

<style type="text/css">
.btn-upload {
  width: 100px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: right;
  margin : 10px 0 10px 10px;
  
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}

.card-img-top {
  width: 100%;
  height: 250px;
  background-position: 50% 50%;
  background-repeat: no-repeat;
  background-color: #e0e0e0;

  &.contain {
    background-size: contain;
  }
  
}

</style>
</head>

<body id="body-pd">
	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/professor/main" class="navbar-brand">
				<img class="img-fluid ms-3" src="/images/logo2.png" alt="logo2" style="height: 40px;"><use xlink:href="#bootstrap"></use></svg>
			</a>
		</header>
		
		<div class=" flex-row float-end ms-4" style="float: right;">
			<span class="text-primary h5" ><b>${mem.name}</b>님</span>
			<i class="text-primary bi-gear-fill mx-2"></i>
			<span class="text-primary mx-3  font09">${mem.major} | ${mem.position} </span>
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
							<a href="/professor/lecMgMain" class="collapse__sublink mb-1" style="display: block;font-size: 0.85rem;">강의관리</a>
							<a  class="collapse__sublink ms-3" style="font-size: 0.8rem; display: block;">전자출석부</a>
							<a href="#" class="collapse__sublink ms-3 mb-3"  style="font-size: 0.8rem; display: block;">과제관리</a>
							
							<a href="#" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의계획서</a>
							<a href="/professor/lecCreateList" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의개설</a>
							<a href="/professor/lecScore" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">성적관리</a>
							<a href="#" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">휴&#183;보강 신청</a>
							<a href="#" class="collapse__sublink" style="font-size: 0.85rem; display: block;">내선번호관리</a>
						</ul>
					</div>
	
					<a href="#" class="nav__link"><ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">결재</span>
					</a>
					<a href="#" class="nav__link"><ion-icon name="settings-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">개인정보관리</span>
					</a>
				</div>
				<a href="/logout" class="nav__link"><ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
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
				<input type="hidden" name="gubun" value="1">
				
				<div class="row m-5">
					<!------------- 컨텐츠 경로 ------------->
					<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
						<i class="bi bi-bookmark-fill me-2"></i>개인정보 수정 </div>
					<!----- card content 내용 ------>
						<div class="col-12 rounded-bottom overflow-auto bg-light p-5" style="min-height: 550px;">
						
					
						
						<div class="card mt-5" style="width: 20%; position: static; float: left;">
						  <img id="preview" src="../fileUpload/hs/image/${mem.image}" style="width: 100%; class="card-img-top" >
						  <label for="file1">
							 <div class="btn-upload">이미지 변경</div>
						  </label>
						  <ul class="list-group list-group-flush" style="text-align: center;">
						    <li class="list-group-item">${mypage.name}</li>
						    <li class="list-group-item">${mypage.dept.dname}</li>
						    <li class="list-group-item">${mypage.position}</li>
						  </ul>
						</div>
						<div style="display: flex; width: 75%; height: 100%; margin-left: 10px;">
							<form action="/professor/mypageSave" class="row g-3" style="width: 80%; margin: 30px 0 0 50px;" method="post" enctype="multipart/form-data">
							  <div class="col-md-3">
							    <label for="inputUserid" class="form-label">사번</label>
							    <input type="text" class="form-control" id="userid" name="userid" value="${mypage.userid }" readonly="readonly">
							  </div>
							  <div class="col-md-3">
							     <label for="inputHiredate" class="form-label">입사일</label>
							    <input type="text" class="form-control" id="hiredate" name="hiredate" value="${mypage.hiredate }" readonly="readonly">
							  </div>
							  <div class="col-md-3">
							    <label for="inputGender" class="form-label">성별</label>
							    <input type="text" class="form-control" id="gender" name="gender" value="${mypage.gender }" readonly="readonly">
							  </div>
							  <div class="col-md-3">
							    <label for="inputBirth" class="form-label">생년월일</label>
							    <input type="text" class="form-control" id="birth" name="birth" value="${mypage.birth }" readonly="readonly">
							  </div>
							  <div class="col-md-6">
							    <label for="inputEmail" class="form-label">이메일</label>
							    <input type="email" class="form-control" id="email" name="email" value="${mypage.email }" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputAddress" class="form-label">주소</label>
							    <div class="input-group mb-3">
								  <input type="text" class="form-control" value="${mypage.address }" id="address" name="address" aria-label="Recipient's username" aria-describedby="button-addon2" required="required">
								  <button class="btn btn-outline-secondary" type="button" id="address_kakao">주소찾기</button>
								</div>
							  </div>
							  <div class="col-md-6">
							    <label for="inputPhone" class="form-label">연락처</label>
							    <input type="text" class="form-control" value="${mypage.phone }" name="phone" id="phone" oninput="autoHyphen(this)" maxlength="13"  required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputSubphone" class="form-label">비상연락처</label>
							    <input type="text" class="form-control" value="${mypage.subphone }" name="subphone" id="subphone" oninput="autoHyphen2(this)" maxlength="13" required="required">
							  </div>
							  <div class="col-md-10">
								<input type="file" name="file1" id="file1" value="${mypage.image }" style="display: none;" onchange="readURL(this)">
							  </div>
							  <div class="col-md-3">
							    <button type="submit" class="btn btn-secondary" style="margin: auto;">변경사항 저장</button>
							  </div>
							</form>
						</div>


					</div>
					
					<!-- footer -->
					<footer class="col-12 mt-5" style="height: 60px; font-size: 12px;">
						<jsp:include page="../footer.jsp"></jsp:include>
					</footer> 
					<!-- </footer>  -->
				</div>
			</main>
		</div> 
	</div> <!-- container div end -->
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<script src="/js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.all {
	height: 100%;
}

.center {
	margin: 0 auto;
	width: 100%;
	height: 100%;
	max-width: 1080px;
}

#wrap {
	margin-top: 100px; /* 헤더 들어갈 부분 */
	font-family: IBM Plex Sans KR;
}

.center2 {
	margin: 0 auto;
	width: 100%;
	height: 100%;
	max-width: 1080px;
}

#wrap2 {
	padding-top: 30px;
	padding-bottom: 100px;
	font-family: IBM Plex Sans KR;
}

span.title, span.title2 {
	font-size: 22pt;
	font-weight: bold;
}

ul {
	list-style: none;
}

.job {
	width: 35px;
	height: 35px;
	border: 1px solid lightgray;
	cursor: pointer;
	justify-content: space-between;
	align-items: center;
	vertical-align: middle;
	border-radius: 10px;
	background-color: #fff;
	margin-top: 3px;
	margin-left: 10px;
}

.job i {
	font-size: 15px;
	font-weight: bold;
}

.tech {
	width: 35px;
	height: 35px;
	border: 1px solid lightgray;
	cursor: pointer;
	justify-content: space-between;
	align-items: center;
	vertical-align: middle;
	border-radius: 10px;
	background-color: #fff;
	margin-top: 3px;
	margin-left: 10px;
}

.tech i {
	font-size: 15px;
	font-weight: bold;
}

.category {
	display: flex;
	align-items: center;
}

.bottomlist {
	background-color: #f6f6f6;
	width: 100%;
}

.selectbox, .techselectbox {
	position: relative;
	width: 250px;
}

.selectbox-option, .techselectbox-option {
	width: 250px;
	margin-top: 5px;
	z-index: 1;
	list-style-type: none;
	padding: 0;
	overflow: hidden;
	max-height: 350px; /* 스크롤바가 나타날 최대 높이 */
	overflow-y: auto; /* 세로 스크롤바 활성화 */
}

.option-btn, .techoption-btn {
	background: none;
	width: 100%;
	padding: 10px;
	border: none;
	cursor: pointer;
	text-align: left;
	font-family: IBM Plex Sans KR;
}

.option-btn:hover, .techoption-btn:hover {
	background-color: #EDEDED;
	width: 210px;
	border-radius: 10px;
	margin-top: 5px;
	margin-left: 2px;
	font-weight: 600;
	font-family: IBM Plex Sans KR;
}

/* .option-btn-selected{
	background-color: #EDEDED;
	width: 210px;
	border-radius: 10px;
	padding: 10px;
	border: none;
	cursor: pointer;
	text-align: left;
	font-weight: 600;
	margin-top: 5px;
	font-family: IBM Plex Sans KR;
    pointer-events : none;	
} */

/* 직무 선택 */

/* 모달 관련 */
.modal-content, .modal-header, .modal-footer, .modal-body {
	border: none;
}

.modal-header {
	padding-bottom: 0;
}

.modal-body {
	padding-bottom: 0;
}

.modal-content {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.modal-backdrop {
	display: none;
}

#myModal .custom-modal-position {
	position: fixed;
	margin-top: 10px;
}

#myModal2 .custom-modal-position {
	position: fixed;
	margin-top: 10px;
}

.modal-dialog.modal-fullsize {
	width: 700px;
	height: 350px;
	margin: 0;
	padding: 0;
}

.modal-footer {
	padding-top: 4px;
	justify-content: space-between;
}

.job-select, .tech-select {
	max-height: 350px; /* 스크롤바가 나타날 최대 높이 */
	overflow-y: auto; /* 세로 스크롤바 활성화 */
}

/* 알림창 */
.alert-message {
	display: none;
	position: fixed;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	background-color: rgba(0, 0, 0, 0.5); /* 검정 반투명 배경색 */
	color: #ffffff; /* 텍스트 색상 */
	padding: 10px 20px;
	border-radius: 5px;
	z-index: 1000;
	opacity: 0; /* 초기 투명도 설정 */
	transition: opacity 0.5s ease; /* 페이드아웃 효과 */
}

/* category2 */
.category2 {
	letter-spacing: -0.5px;
	border-radius: 20px;
	padding: 7px 16px;
	background-color: rgb(238, 238, 238);
	font-size: 15px;
	line-height: 24px;
	border: 1px solid rgb(228, 228, 228);
	color: rgb(34, 34, 34);
	transition: transform 0.3s ease;
}

.category2-wrapper {
	justify-content: space-around;
}

.category2-container {
	display: flex;
	align-items: center;
	overflow: hidden;
	white-space: nowrap;
	max-width: 1000px; /* 필요에 따라 조정 */
	position: relative;
}

.category2[aria-pressed="true"] {
    font-weight: 500;
    border: 1px solid rgb(228, 228, 228);
    background: rgb(61, 61, 61);
    color: rgb(255, 255, 255);
}

.option {
	flex-shrink: 0;
	width: 30px;
	height: 30px;
	border: 1px solid lightgray;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	background-color: #fff;
	font-size: 13px;
}

.option:hover {
	background-color: black;
	color: white;
}

.option i {
	font-size: 15px;
	font-weight: bold;
}

.category3 {
	width: 70px;
	height: 35px;
	border: 1px solid lightgray;
	cursor: pointer;
	justify-content: space-between;
	align-items: center;
	vertical-align: middle;
	border-radius: 100px;
	background-color: #fff;
	font-size: 13px;
}

.category3:hover {
	border: 1px solid black;
	border-radius: 100px;
}

.category3 i {
	font-size: 15px;
	font-weight: bold;
}

/* 경력 */
.career {
	position: absolute;
	width: 300px;
	height: 300px;
	border: 1px solid lightgray;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	background: white;
	padding: 15px 30px;
	margin-top: 5px;
	z-index: 9999;
}

.career_row {
	display: flex;
	justify-content: space-between; /* 좌우 정렬 */
	flex-wrap: wrap; /* 넘치는 경우 자동으로 줄 바꿈 */
}

.career_item {
	flex-basis: calc(50% - 10px); /* 아이템의 너비를 반으로 설정하고 간격을 고려해 마진 설정 */
	margin-bottom: 10px; /* 아래쪽 간격 설정 */
}

/* 지역 */
.region {
	position: absolute;
	width: 300px;
	height: 500px;
	border: 1px solid lightgray;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	background: white;
	padding: 15px 10px;
	margin-top: 5px;
	z-index: 9999;
	margin-left: 74px;
}

.regionbox {
	position: relative;
	width: 130px;
}

.regionbox-option {
	width: 130px;
	z-index: 1;
	list-style-type: none;
	padding: 0;
	overflow: hidden;
	max-height: 300px; /* 스크롤바가 나타날 최대 높이 */
	overflow-y: auto; /* 세로 스크롤바 활성화 */
	margin: 0 0 0 0;
}

.region-btn {
	background: none;
	width: 100%;
	padding: 10px;
	border: none;
	cursor: pointer;
	text-align: left;
	font-family: IBM Plex Sans KR;
}

.region-btn:hover {
	background-color: #EDEDED;
	width: 100px;
	border-radius: 10px;
	margin-top: 5px;
	margin-left: 2px;
	font-weight: 600;
	font-family: IBM Plex Sans KR;
}

.region-detail {
	width: 158px;
	z-index: 1;
	list-style-type: none;
	padding: 0;
	overflow: hidden;
	max-height: 300px; /* 스크롤바가 나타날 최대 높이 */
	overflow-y: auto; /* 세로 스크롤바 활성화 */
	margin: 0 0 0 0;
}

.region-detail ul {
	list-style-type: none;
	padding: 0;
	margin: 0 0 0 10px;
}

div.region-detail ul li {
	display: flex;
	align-items: center;
	margin-top: 10px;
	margin-bottom: 20px;
	margin-left: 10px;
}

ul li input[type="checkbox"] {
	margin-right: 10px;
	transform: scale(1.5); /* 체크박스 크기 조절 */
}

/* refresh 버튼 */
.refresh {
	width: 35px;
	height: 35px;
	border: 1px solid lightgray;
	justify-content: center;
	align-items: center;
	border-radius: 100px;
	background-color: #fff;
}

.refresh:hover {
	border: 1px solid black;
	border-radius: 100px;
}

/* 리스트 정렬 버튼 */
.listsort {
	max-width: 1080px;
	margin: 0px auto;
	display: flex;
	justify-content: flex-end;
	padding: 36px 0px 6px;
}

.ullist {
	width: 100%;
	display: flex;
}

.ullist li {
	position: relative;
}

.listtrue {
	font-size: 14px;
	color: rgb(34, 34, 34);
	font-weight: 700;
}

button {
	border: none;
	border-radius: 0px;
	background: none;
	cursor: pointer;
}

.listfalse {
	padding-top: 3px;
	font-size: 14px;
	color: rgb(102, 102, 102);
	font-size: 14px;
}

/* 리스트 표시 및 정렬 */
.hirelist {
	z-index: 2;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	width: 1080px;
	margin: 0px auto;
	height: 100%;
	left: 0px;
}

.hireinfo {
	opacity: initial;
	position: relative;
	width: calc(25% - 20px);
	flex: 1 1 22%;
	box-sizing: border-box;
	padding: 10px;
	max-width: 270px;
}

a {
	color: rgb(0, 0, 0);
	text-decoration: none;
}

.hireinfo .img_box {
	width: 100%;
	height: 166px;
	border-radius: 4px;
	overflow: hidden;
	border: 1px solid rgba(0, 0, 0, 0.1);
	position: relative;
}

.hireinfo .img_box .img {
	width: 250px;
	height: 166px;
	object-fit: cover;
	transition: all 0.3s ease 0s;
}

.hireinfo-content {
	padding: 12px 0px 36px;
	width: calc(100% - 7px);
}

.content-company {
	display: flex;
	align-items: center;
}

.content-company span {
	font-size: 14px;
	line-height: 24px;
	letter-spacing: -0.5px;
	color: rgb(68, 68, 68);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.hireinfo-content h2 {
	margin-top: 6px;
	font-size: 17px;
	line-height: 1.4em;
	letter-spacing: -0.5px;
	font-weight: 600;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.content-techlist {
	display: flex;
	margin: 0px;
	font-size: 13px;
	line-height: 18px;
	letter-spacing: -0.5px;
	color: rgb(153, 153, 153);
	height: 18px;
	font-family: __Montserrat_08d7fe, __Montserrat_Fallback_08d7fe;
	flex-wrap: wrap;
	overflow: hidden;
	padding: 0px;
}

.content-techlist li {
	margin-right: 5px;
}

.content-area {
	display: flex;
	font-size: 13px;
	line-height: 18px;
	letter-spacing: -0.5px;
	color: rgb(153, 153, 153);
	margin-top: 7px;
	padding: 0px;
}

.content-area li {
	margin-right: 5px;
}

.hireinfo .img_box .counts {
	position: absolute;
	margin-left: auto;
	color: rgb(255, 255, 255);
	font-size: 13px;
	z-index: 11;
	right: 10px;
	top: 10px;
	width: 70px;
	display: flex;
	align-items: center;
	display: none;
}

.hireinfo .img_box:hover  .counts {
	display: flex;
}

.hireinfo .counts .position_view_count {
	display: flex;
	align-items: center;
	margin-right: 10px;
}

.hireinfo .counts .position_view_count span {
	margin-left: 4px;
}

.hireinfo .counts button {
	padding: 0px;
}

.scrap {
	display: flex;
	justify-content: center;
	align-items: center;
}

.hireinfo .img_filter {
	position: absolute;
	top: 0;
	left: 0;
	width: 250px;
	height: 166px;
	background: rgba(0, 0, 0, 0.5);
	opacity: 0;
	transition: opacity 0.3s ease;
	z-index: 10;
}

.hireinfo:hover .img {
	transform: scale(1.1);
}

.hireinfo:hover .img_filter {
	opacity: 0.8;
}

svg{
	width: 18px;
	height: 18px;
}

.position_view_count svg{
	margin-bottom: 1px;
}

.position_view_count span{
	font-size: 12pt;
	font-family: IBM Plex Sans KR;
}
</style>
</head>
<body>
	<div class="all">
		<div id="wrap">
			<div class="center">
				<div class="category">


					<!-- 개발 직무 선택 -->
					<span class="title">개발 직무</span>
					<button class="job" type="button" data-bs-toggle="modal"
						data-bs-target="#myModal">
						<i class="bi bi-chevron-down"></i>
					</button>
					<div class="modal" id="myModal">
						<div class="modal-dialog custom-modal-position modal-fullsize">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title" style="font-weight: bold;">개발 직무</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>

								<!-- Modal Body -->
								<div class="modal-body d-inline-flex">
									<section class="selectbox">
										<ul class="selectbox-option hide">
											<li><button type="button" class="option-btn">서버/백엔드
													개발자</button></li>
											<li><button type="button" class="option-btn">프론트엔드
													개발자</button></li>
											<li><button type="button" class="option-btn">웹
													풀스택 개발자</button></li>
											<li><button type="button" class="option-btn">안드로이드
													개발자</button></li>
											<li><button type="button" class="option-btn">IOS
													개발자</button></li>
											<li><button type="button" class="option-btn">크로스플랫폼
													앱개발자</button></li>
											<li><button type="button" class="option-btn">게임
													클라이언트 개발자</button></li>
											<li><button type="button" class="option-btn">게임
													서버 개발자</button></li>
											<li><button type="button" class="option-btn">DBA</button></li>
											<li><button type="button" class="option-btn">빅데이터
													엔지니어</button></li>
											<li><button type="button" class="option-btn">인공지능/머신러닝</button></li>
											<li><button type="button" class="option-btn">devops/시스템
													엔지니어</button></li>
											<li><button type="button" class="option-btn">정보보안
													담당자</button></li>
											<li><button type="button" class="option-btn">QA
													엔지니어</button></li>
											<li><button type="button" class="option-btn">개발
													PM</button></li>
											<li><button type="button" class="option-btn">HW/임베디드</button></li>
											<li><button type="button" class="option-btn">SW/솔루션</button></li>
											<li><button type="button" class="option-btn">웹퍼블리셔</button></li>
											<li><button type="button" class="option-btn">VR/AR/3D</button></li>
											<li><button type="button" class="option-btn">블록체인</button></li>
											<li><button type="button" class="option-btn">기술지원</button></li>
										</ul>
									</section>
									<div class="job-select">
										<div id="selected-job"
											style="font-size: 10pt; margin-top: 10px;"></div>
									</div>
								</div>

								<!-- Modal Footer -->
								<div class="modal-footer" style="float: left;">
									<button type="button" class="btn btn-outline-light resetjob"
										style="color: black; border-color: lightgray; font-weight: bold; font-size: 10pt; padding: 7px 18px;">초기화</button>
									<button type="button" class="btn btn-primary apply-btn"
										data-bs-dismiss="modal"
										style="float: right; font-weight: bold; font-size: 10pt; padding: 6px 18px;">적용</button>
								</div>
							</div>
						</div>
					</div>


					<!-- 기술 스택 선택 -->
					<span class="title2" style="margin-left: 50px;">기술 스택</span>
					<button class="tech" type="button" data-bs-toggle="modal"
						data-bs-target="#myModal2">
						<i class="bi bi-chevron-down"></i>
					</button>
					<div class="modal" id="myModal2">
						<div class="modal-dialog custom-modal-position modal-fullsize">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title" style="font-weight: bold;">기술 스택</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>

								<!-- Modal Body -->
								<div class="modal-body d-inline-flex">
									<section class="techselectbox">
										<ul class="techselectbox-option techhide">
											<li><button type="button" class="techoption-btn">Java</button></li>
											<li><button type="button" class="techoption-btn">Spring
													Boot</button></li>
											<li><button type="button" class="techoption-btn">Node.js</button></li>
											<li><button type="button" class="techoption-btn">Python</button></li>
											<li><button type="button" class="techoption-btn">Django</button></li>
											<li><button type="button" class="techoption-btn">PHP</button></li>
											<li><button type="button" class="techoption-btn">C</button></li>
											<li><button type="button" class="techoption-btn">C++</button></li>
											<li><button type="button" class="techoption-btn">C#</button></li>
											<li><button type="button" class="techoption-btn">AWS</button></li>
											<li><button type="button" class="techoption-btn">MySQL</button></li>
											<li><button type="button" class="techoption-btn">Oracle</button></li>
											<li><button type="button" class="techoption-btn">React</button></li>
											<li><button type="button" class="techoption-btn">Vue.js</button></li>
											<li><button type="button" class="techoption-btn">JQuery</button></li>
											<li><button type="button" class="techoption-btn">HTML5</button></li>
											<li><button type="button" class="techoption-btn">CSS3</button></li>
											<li><button type="button" class="techoption-btn">JavaScript</button></li>
											<li><button type="button" class="techoption-btn">Svelte</button></li>
											<li><button type="button" class="techoption-btn">TypeScript</button></li>
											<li><button type="button" class="techoption-btn">AngularJS</button></li>
											<li><button type="button" class="techoption-btn">Kotlin</button></li>
											<li><button type="button" class="techoption-btn">RxJava</button></li>
											<li><button type="button" class="techoption-btn">Swift</button></li>
											<li><button type="button" class="techoption-btn">Objective-C</button></li>
											<li><button type="button" class="techoption-btn">Rxswift</button></li>
											<li><button type="button" class="techoption-btn">SwiftUI</button></li>
											<li><button type="button" class="techoption-btn">Xcode</button></li>
											<li><button type="button" class="techoption-btn">Flutter</button></li>
											<li><button type="button" class="techoption-btn">React
													Native</button></li>
											<li><button type="button" class="techoption-btn">MSSQL</button></li>
											<li><button type="button" class="techoption-btn">PostgreSQL</button></li>
											<li><button type="button" class="techoption-btn">NoSQL</button></li>
											<li><button type="button" class="techoption-btn">MariaDB</button></li>
											<li><button type="button" class="techoption-btn">MongoDB</button></li>
											<li><button type="button" class="techoption-btn">SQL</button></li>
											<li><button type="button" class="techoption-btn">R</button></li>
											<li><button type="button" class="techoption-btn">Hadoop</button></li>
											<li><button type="button" class="techoption-btn">Spark</button></li>
											<li><button type="button" class="techoption-btn">Kafka</button></li>
											<li><button type="button" class="techoption-btn">TensorFlow</button></li>
											<li><button type="button" class="techoption-btn">PyTorch</button></li>
											<li><button type="button" class="techoption-btn">Elasticsearch</button></li>
											<li><button type="button" class="techoption-btn">OpenCV</button></li>
											<li><button type="button" class="techoption-btn">Linux</button></li>
											<li><button type="button" class="techoption-btn">Kubernetes</button></li>
											<li><button type="button" class="techoption-btn">Docker</button></li>
											<li><button type="button" class="techoption-btn">Network</button></li>
											<li><button type="button" class="techoption-btn">GCP</button></li>
											<li><button type="button" class="techoption-btn">Windows</button></li>
											<li><button type="button" class="techoption-btn">AZURE</button></li>
											<li><button type="button" class="techoption-btn">Terraform</button></li>
											<li><button type="button" class="techoption-btn">ISMS</button></li>
											<li><button type="button" class="techoption-btn">CISA</button></li>
											<li><button type="button" class="techoption-btn">CISSP</button></li>
											<li><button type="button" class="techoption-btn">Firewall</button></li>
											<li><button type="button" class="techoption-btn">VPN</button></li>
											<li><button type="button" class="techoption-btn">IPS</button></li>
											<li><button type="button" class="techoption-btn">CPPG</button></li>
											<li><button type="button" class="techoption-btn">FW</button></li>
											<li><button type="button" class="techoption-btn">Embedded</button></li>
											<li><button type="button" class="techoption-btn">Pads</button></li>
											<li><button type="button" class="techoption-btn">FPGA</button></li>
											<li><button type="button" class="techoption-btn">PCB</button></li>
											<li><button type="button" class="techoption-btn">RF</button></li>
											<li><button type="button" class="techoption-btn">.NET</button></li>
											<li><button type="button" class="techoption-btn">Golang</button></li>
											<li><button type="button" class="techoption-btn">Nft</button></li>
											<li><button type="button" class="techoption-btn">Solidity</button></li>
											<li><button type="button" class="techoption-btn">Blockchain</button></li>
										</ul>
									</section>
									<div class="tech-select">
										<div id="selected-tech"
											style="font-size: 10pt; margin-top: 10px;"></div>
									</div>
								</div>

								<!-- Modal Footer -->
								<div class="modal-footer" style="float: left;">
									<button type="button" class="btn btn-outline-light resettech"
										style="color: black; border-color: lightgray;">초기화</button>
									<button type="button" class="btn btn-primary techapply-btn"
										data-bs-dismiss="modal" style="float: right;">적용</button>
								</div>
							</div>
						</div>
					</div>
					<span id="alert-message" class="alert-message">5개 이상의 직무를
						선택할 수 없습니다.</span>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="bottomlist">
		<div id="wrap2">
			<div class="center2">
				<!-- 경력 -->
				<div>
					<button class="carreerbtn category3" type="button">
						경력 <span><i class="bi bi-chevron-down"></i></span>
					</button>

					<div class="career">
						<div class="career_row">
							<div class="career_item">
								<input type="radio" class="form-check-input"
									style="color: green;" name="career" id="all" value="all"
									checked="checked"><label for="all">&nbsp;전체</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="newbie" value="newbie"><label for="newbie">&nbsp;신입</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="1year" value="1year"><label for="1year">&nbsp;1년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="2years" value="2years"><label for="2years">&nbsp;2년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="3years" value="3years"><label for="3years">&nbsp;3년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="4years" value="4years"><label for="4years">&nbsp;4년</label>
							</div>
						</div>
						<div class="career_row">
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="5years" value="5years"><label for="5years">&nbsp;5년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="6years" value="6years"><label for="6years">&nbsp;6년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="7years" value="7years"><label for="7years">&nbsp;7년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="8years" value="8years"><label for="8years">&nbsp;8년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="9years" value="9years"><label for="9years">&nbsp;9년</label>
							</div>
							<div class="career_item">
								<input type="radio" class="form-check-input" name="career"
									id="10years" value="10years"><label for="10years">&nbsp;10년
									이상</label>
							</div>
						</div>
						<hr style="margin-top: 5px;">
						<div>
							<button type="button" class="btn btn-outline-light btnreset"
								style="color: black; border: 1px solid lightgray;">초기화</button>
						</div>
					</div>

					<!-- 지역 -->
					<button class="regionbtn category3" type="button">
						지역 <i class="bi bi-chevron-down"></i>
					</button>
					<div class="region">
						<div class="regiontop d-inline-flex">
							<section class="regionbox">
								<ul class="regionbox-option">
									<li><button type="button" class="region-btn" value="all">전국</button></li>
									<li><button type="button" class="region-btn" value="seoul">서울</button></li>
									<li><button type="button" class="region-btn"
											value="gyeonggi">경기</button></li>
									<li><button type="button" class="region-btn"
											value="incheon">인천</button></li>
									<li><button type="button" class="region-btn" value="busan">부산</button></li>
									<li><button type="button" class="region-btn" value="daegu">대구</button></li>
									<li><button type="button" class="region-btn"
											value="gwangju">광주</button></li>
									<li><button type="button" class="region-btn"
											value="daejeon">대전</button></li>
									<li><button type="button" class="region-btn" value="ulsan">울산</button></li>
									<li><button type="button" class="region-btn"
											value="sejong">세종</button></li>
									<li><button type="button" class="region-btn"
											value="gangwon">강원</button></li>
									<li><button type="button" class="region-btn"
											value="chungbuk">충북</button></li>
									<li><button type="button" class="region-btn"
											value="chungnam">충남</button></li>
									<li><button type="button" class="region-btn"
											value="jeonbuk">전북</button></li>
									<li><button type="button" class="region-btn"
											value="jeonnam">전남</button></li>
									<li><button type="button" class="region-btn"
											value="gyeongbuk">경북</button></li>
									<li><button type="button" class="region-btn"
											value="gyeongnam">경남</button></li>
									<li><button type="button" class="region-btn" value="jeju">제주</button></li>
									<li><button type="button" class="region-btn" value="etc">기타</button></li>
								</ul>
							</section>
							<div class="region-detail">
			                  <div class="region-detail-empty" style="color: rgb(153, 153, 153);font-size: 0.8em;
			                  width: 150px;padding: 130px 0 0 35px">지역을 선택해주세요.</div>
			                      <ul class="seoul">
			                     <li><input type="checkbox" class="seoul-chk">전체</li>
			                     <li><input type="checkbox" class="seoul-chk">강남구</li>
			                     <li><input type="checkbox" class="seoul-chk">강동구</li>
			                     <li><input type="checkbox" class="seoul-chk">강북구</li>
			                     <li><input type="checkbox" class="seoul-chk">강서구</li>
			                     <li><input type="checkbox" class="seoul-chk">관악구</li>
			                     <li><input type="checkbox" class="seoul-chk">광진구</li>
			                     <li><input type="checkbox" class="seoul-chk">구로구</li>
			                     <li><input type="checkbox" class="seoul-chk">금천구</li>
			                     <li><input type="checkbox" class="seoul-chk">노원구</li>
			                     <li><input type="checkbox" class="seoul-chk">동봉구</li>
			                     <li><input type="checkbox" class="seoul-chk">동대문구</li>
			                     <li><input type="checkbox" class="seoul-chk">동작구</li>
			                     <li><input type="checkbox" class="seoul-chk">마포구</li>
			                     <li><input type="checkbox" class="seoul-chk">서대문구</li>
			                     <li><input type="checkbox" class="seoul-chk">서초구</li>
			                     <li><input type="checkbox" class="seoul-chk">성동구</li>
			                     <li><input type="checkbox" class="seoul-chk">성북구</li>
			                     <li><input type="checkbox" class="seoul-chk">송파구</li>
			                     <li><input type="checkbox" class="seoul-chk">양천구</li>
			                     <li><input type="checkbox" class="seoul-chk">영등포구</li>
			                     <li><input type="checkbox" class="seoul-chk">용산구</li>
			                     <li><input type="checkbox" class="seoul-chk">은평구</li>
			                     <li><input type="checkbox" class="seoul-chk">종로구</li>
			                     <li><input type="checkbox" class="seoul-chk">중구</li>
			                     <li><input type="checkbox" class="seoul-chk">중랑구</li>
			                     </ul>
			                     <ul class="gyeonggi">
			                     <li><input type="checkbox" class="gyeonggi-chk">전체</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">가평군</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">고양시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">과천시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">광명시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">광주시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">구리시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">군포시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">김포시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">남양주시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">동두천시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">부천시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">성남시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">수원시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">시흥시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">안산시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">안성시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">안양시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">양주시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">양평군</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">여주시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">연천군</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">오산시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">용인시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">의왕시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">의정부시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">이천시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">파주시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">평택시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">포천시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">하남시</li>
			                     <li><input type="checkbox" class="gyeonggi-chk">화성시</li>
			                     </ul>
			                     <ul class="incheon">
			                     <li><input type="checkbox" class="incheon-chk">전체</li>
			                     <li><input type="checkbox" class="incheon-chk">강화군</li>
			                     <li><input type="checkbox" class="incheon-chk">계양구</li>
			                     <li><input type="checkbox" class="incheon-chk">남동구</li>
			                     <li><input type="checkbox" class="incheon-chk">동구</li>
			                     <li><input type="checkbox" class="incheon-chk">미추홀구</li>
			                     <li><input type="checkbox" class="incheon-chk">부평구</li>
			                     <li><input type="checkbox" class="incheon-chk">서구</li>
			                     <li><input type="checkbox" class="incheon-chk">연수구</li>
			                     <li><input type="checkbox" class="incheon-chk">옹진군</li>
			                     <li><input type="checkbox" class="incheon-chk">중구</li>
			                     </ul>
			                     <ul class="busan">
			                     <li><input type="checkbox" class="busan-chk">전체</li>
			                     <li><input type="checkbox" class="busan-chk">강서구</li>
			                     <li><input type="checkbox" class="busan-chk">금정구</li>
			                     <li><input type="checkbox" class="busan-chk">기장군</li>
			                     <li><input type="checkbox" class="busan-chk">남구</li>
			                     <li><input type="checkbox" class="busan-chk">동구</li>
			                     <li><input type="checkbox" class="busan-chk">동래구</li>
			                     <li><input type="checkbox" class="busan-chk">부산진구</li>
			                     <li><input type="checkbox" class="busan-chk">북구</li>
			                     <li><input type="checkbox" class="busan-chk">사상구</li>
			                     <li><input type="checkbox" class="busan-chk">사하구</li>
			                     <li><input type="checkbox" class="busan-chk">서구</li>
			                     <li><input type="checkbox" class="busan-chk">수영구</li>
			                     <li><input type="checkbox" class="busan-chk">연제구</li>
			                     <li><input type="checkbox" class="busan-chk">영도구</li>
			                     <li><input type="checkbox" class="busan-chk">중구</li>
			                     <li><input type="checkbox" class="busan-chk">해운대구</li>
			                     </ul>
			                     <ul class="daegu">
			                     <li><input type="checkbox" class="daegu-chk">전체</li>
			                     <li><input type="checkbox" class="daegu-chk">군위군</li>
			                     <li><input type="checkbox" class="daegu-chk">남구</li>
			                     <li><input type="checkbox" class="daegu-chk">달서구</li>
			                     <li><input type="checkbox" class="daegu-chk">달성군</li>
			                     <li><input type="checkbox" class="daegu-chk">동구</li>
			                     <li><input type="checkbox" class="daegu-chk">북구</li>
			                     <li><input type="checkbox" class="daegu-chk">서구</li>
			                     <li><input type="checkbox" class="daegu-chk">수성구</li>
			                     <li><input type="checkbox" class="daegu-chk">중구</li>
			                     </ul>
			                     <ul class="gwangju">
			                     <li><input type="checkbox" class="gwangju-chk">전체</li>
			                     <li><input type="checkbox" class="gwangju-chk">광산구</li>
			                     <li><input type="checkbox" class="gwangju-chk">남구</li>
			                     <li><input type="checkbox" class="gwangju-chk">동구</li>
			                     <li><input type="checkbox" class="gwangju-chk">북구</li>
			                     <li><input type="checkbox" class="gwangju-chk">서구</li>
			                     </ul>
			                     <ul class="daejeon">
			                     <li><input type="checkbox" class="daejeon-chk">전체</li>
			                     <li><input type="checkbox" class="daejeon-chk">대덕구</li>
			                     <li><input type="checkbox" class="daejeon-chk">동구</li>
			                     <li><input type="checkbox" class="daejeon-chk">서구</li>
			                     <li><input type="checkbox" class="daejeon-chk">유성구</li>
			                     <li><input type="checkbox" class="daejeon-chk">중구</li>
			                     </ul>
			                     <ul class="ulsan">
			                     <li><input type="checkbox" class="ulsan-chk">전체</li>
			                     <li><input type="checkbox" class="ulsan-chk">남구</li>
			                     <li><input type="checkbox" class="ulsan-chk">동구</li>
			                     <li><input type="checkbox" class="ulsan-chk">북구</li>
			                     <li><input type="checkbox" class="ulsan-chk">울주군</li>
			                     <li><input type="checkbox" class="ulsan-chk">중구</li>
			                     </ul>
			                     <ul class="sejong">
			                     <li><input type="checkbox" class="sejong-chk">전체</li>
			                     <li><input type="checkbox" class="sejong-chk">가람동</li>
			                     <li><input type="checkbox" class="sejong-chk">고운동</li>
			                     <li><input type="checkbox" class="sejong-chk">금남면</li>
			                     <li><input type="checkbox" class="sejong-chk">나성동</li>
			                     <li><input type="checkbox" class="sejong-chk">누리동</li>
			                     <li><input type="checkbox" class="sejong-chk">다솜동</li>
			                     <li><input type="checkbox" class="sejong-chk">다정동</li>
			                     <li><input type="checkbox" class="sejong-chk">대평동</li>
			                     <li><input type="checkbox" class="sejong-chk">도담동</li>
			                     <li><input type="checkbox" class="sejong-chk">반곡동</li>
			                     <li><input type="checkbox" class="sejong-chk">보강면</li>
			                     <li><input type="checkbox" class="sejong-chk">보람동</li>
			                     <li><input type="checkbox" class="sejong-chk">산울동</li>
			                     <li><input type="checkbox" class="sejong-chk">새롬동</li>
			                     <li><input type="checkbox" class="sejong-chk">세종동</li>
			                     <li><input type="checkbox" class="sejong-chk">소담동</li>
			                     <li><input type="checkbox" class="sejong-chk">아름동</li>
			                     <li><input type="checkbox" class="sejong-chk">어진동</li>
			                     <li><input type="checkbox" class="sejong-chk">연기면</li>
			                     <li><input type="checkbox" class="sejong-chk">연동면</li>
			                     <li><input type="checkbox" class="sejong-chk">연서면</li>
			                     <li><input type="checkbox" class="sejong-chk">용호동</li>
			                     <li><input type="checkbox" class="sejong-chk">장군면</li>
			                     <li><input type="checkbox" class="sejong-chk">전동면</li>
			                     <li><input type="checkbox" class="sejong-chk">전의면</li>
			                     <li><input type="checkbox" class="sejong-chk">조치원읍</li>
			                     <li><input type="checkbox" class="sejong-chk">종촌동</li>
			                     <li><input type="checkbox" class="sejong-chk">집현동</li>
			                     <li><input type="checkbox" class="sejong-chk">한별동</li>
			                     <li><input type="checkbox" class="sejong-chk">한솔동</li>
			                     <li><input type="checkbox" class="sejong-chk">합강동</li>
			                     <li><input type="checkbox" class="sejong-chk">해밀동</li>
			                     </ul>
			                     <ul class="gangwon">
			                     <li><input type="checkbox" class="gangwon-chk">전체</li>
			                     <li><input type="checkbox" class="gangwon-chk">강릉시</li>
			                     <li><input type="checkbox" class="gangwon-chk">고성군</li>
			                     <li><input type="checkbox" class="gangwon-chk">동해시</li>
			                     <li><input type="checkbox" class="gangwon-chk">삼척시</li>
			                     <li><input type="checkbox" class="gangwon-chk">속초시</li>
			                     <li><input type="checkbox" class="gangwon-chk">양구군</li>
			                     <li><input type="checkbox" class="gangwon-chk">양양군</li>
			                     <li><input type="checkbox" class="gangwon-chk">영월군</li>
			                     <li><input type="checkbox" class="gangwon-chk">원주시</li>
			                     <li><input type="checkbox" class="gangwon-chk">정선군</li>
			                     <li><input type="checkbox" class="gangwon-chk">철원군</li>
			                     <li><input type="checkbox" class="gangwon-chk">춘천시</li>
			                     <li><input type="checkbox" class="gangwon-chk">태백시</li>
			                     <li><input type="checkbox" class="gangwon-chk">평창군</li>
			                     <li><input type="checkbox" class="gangwon-chk">홍천군</li>
			                     <li><input type="checkbox" class="gangwon-chk">화천군</li>
			                     <li><input type="checkbox" class="gangwon-chk">횡성군</li>
			                     </ul>
			                     <ul class="chungbuk">
			                     <li><input type="checkbox" class="chungbuk-chk">전체</li>
			                     <li><input type="checkbox" class="chungbuk-chk">괴산군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">단양군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">보은군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">영동군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">옥천군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">음성군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">제천시</li>
			                     <li><input type="checkbox" class="chungbuk-chk">증평군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">진천군</li>
			                     <li><input type="checkbox" class="chungbuk-chk">청주시</li>
			                     <li><input type="checkbox" class="chungbuk-chk">충주시</li>
			                     </ul>
			                     <ul class="chungnam">
			                     <li><input type="checkbox" class="chungnam-chk">전체</li>
			                     <li><input type="checkbox" class="chungnam-chk">계롱시</li>
			                     <li><input type="checkbox" class="chungnam-chk">공주시</li>
			                     <li><input type="checkbox" class="chungnam-chk">금산군</li>
			                     <li><input type="checkbox" class="chungnam-chk">논산시</li>
			                     <li><input type="checkbox" class="chungnam-chk">당진시</li>
			                     <li><input type="checkbox" class="chungnam-chk">보령시</li>
			                     <li><input type="checkbox" class="chungnam-chk">부여군</li>
			                     <li><input type="checkbox" class="chungnam-chk">서산시</li>
			                     <li><input type="checkbox" class="chungnam-chk">서천군</li>
			                     <li><input type="checkbox" class="chungnam-chk">아산시</li>
			                     <li><input type="checkbox" class="chungnam-chk">예산군</li>
			                     <li><input type="checkbox" class="chungnam-chk">천안시</li>
			                     <li><input type="checkbox" class="chungnam-chk">청양군</li>
			                     <li><input type="checkbox" class="chungnam-chk">태안군</li>
			                     <li><input type="checkbox" class="chungnam-chk">홍성군</li>
			                     </ul>
			                     <ul class="jeonbuk">
			                     <li><input type="checkbox" class="jeonbuk-chk">전체</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">고창군</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">군산시</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">김제시</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">남원시</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">무주군</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">부안군</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">순창군</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">완주군</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">익산시</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">임실군</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">장수군</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">전주시</li>
			                     <li><input type="checkbox" class="jeonbuk-chk">정읍시</li>
			                     <li><input type="checkbox" class="chungnam-chk">진안군</li>
			                     </ul>
			                     <ul class="jeonnam">
			                     <li><input type="checkbox" class="jeonnam-chk">전체</li>
			                     <li><input type="checkbox" class="jeonnam-chk">강진군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">고흥군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">곡성군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">광양시</li>
			                     <li><input type="checkbox" class="jeonnam-chk">구례군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">나주시</li>
			                     <li><input type="checkbox" class="jeonnam-chk">담양군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">목포시</li>
			                     <li><input type="checkbox" class="jeonnam-chk">무안군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">보성군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">순천시</li>
			                     <li><input type="checkbox" class="jeonnam-chk">신안군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">여수시</li>
			                     <li><input type="checkbox" class="jeonnam-chk">영광군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">영암군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">완도군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">장성군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">장흥군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">진도군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">함평군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">해남군</li>
			                     <li><input type="checkbox" class="jeonnam-chk">화순군</li>
			                     </ul>
			                     <ul class="gyeongbuk">
			                     <li><input type="checkbox" class="gyeongbuk-chk">전체</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">경산시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">경주시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">고령군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">구미시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">군위군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">김천시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">문경시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">봉화군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">상주시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">성주군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">안동시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">영덕군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">영양군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">영주시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">영천시</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">예천군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">울릉군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">울진군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">의성군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">청도군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">청송군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">칠곡군</li>
			                     <li><input type="checkbox" class="gyeongbuk-chk">포항시</li>
			                     </ul>
			                     <ul class="gyeongnam">
			                     <li><input type="checkbox" class="gyeongnam-chk">전체</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">거제시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">거창군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">고성군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">김해시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">남해군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">밀양시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">사천시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">산청군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">양산시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">의령군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">진주시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">창녕군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">창원시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">동영시</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">하동군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">함안군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">함양군</li>
			                     <li><input type="checkbox" class="gyeongnam-chk">합천군</li>
			                     </ul>
			                     <ul class="jeju">
			                     <li><input type="checkbox" class="jeju-chk">전체</li>
			                     <li><input type="checkbox" class="jeju-chk">서귀포시</li>
			                     <li><input type="checkbox" class="jeju-chk">제주시</li>
			                     </ul>
			                  </div>
			               </div>
						<div class="region-select">
			               <div id="selected-region" style="border: 1px solid lightgray; margin: 0 0px 0 0px;padding: 7px 0 0 7px;
			               border-width: 1px 0 0; height: 115px; background-color: #f6f6f6;font-size: 8pt;width: 100%">
			               </div>
			         	</div>
			            <div style="border: 1px solid lightgray; margin: 0px -10px 0 -10px;padding: 12.5px 0 0 10px;
			            border-width: 1px 0 0;">
			               <button type="button" class="btn btn-outline-light btnreset"
			               style="color: black;border: 1px solid lightgray;">초기화</button>
			               <button type="button" class="btn btn-outline-light btnapply"
			               style="color: #0D6EFD;border: 1px solid #0D6EFD;float: right;
			               margin-right: 10px;">적용하기</button>
			            </div>
			         </div>

					<button class="refresh" type="button">
						<img src="../image_icon/refresh.png"
							style="width: 25px; height: 25px; margin-left: -2px;">
					</button>
					<br> <br>
					<div class="category2-wrapper"
						style="display: flex; align-items: center;">
						<button class="option" type="button">
							<i class="bi bi-chevron-left"></i>
						</button>
						<div class="category2-container">
							&nbsp;&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🍯 4.5일제</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🏠 재택근무</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">⏰ 유연근무제</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🕙 시차출근제</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">💵 인센티브</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">👾 코드리뷰</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">👖 반바지/슬리퍼 OK</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">👕 자유복장</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">☕ 맛있는간식냠냠</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">💻 맥북으로개발</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">👩‍ 닉네임사용</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">🙌 수평적조직</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">🐶 반려동물</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">💰 누적투자금100억이상</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">📈 스톡옵션제공</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">📗 도서구입비지원</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">🚕 택시비지원</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">👨 병역특례</button>
							&nbsp;
							<button aria-pressed="false" tabindex="-1" class="category2"
								style="display: inline-block;">🎓 전공우대</button>
							&nbsp;&nbsp;
						</div>
						<button class="option" type="button">
							<i class="bi bi-chevron-right"></i>
						</button>
					</div>

					<!-- 리스트 시작 -->
					<!-- 리스트 배열 선택하기 -->
					<div class="hirelistsort listsort">
						<div>
							<div class="order_wrap">
								<ul class="ullist">
									<li>
										<button aria-pressed="true" type="button" class="listtrue">
											최신순&nbsp;&nbsp;&nbsp; <span
												style="font-size: 12pt; color: gray;">ㆍ</span>
										</button>
									</li>
									<li>
										<button aria-pressed="false" type="button" class="listfalse">인기순</button>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- 채용공고 리스트 -->
					<section class="hirelist">
						<div class="hireinfo">
							<a target="_self" title="(React Native) 모바일앱 개발자" href="#">
								<div class="img_box">
									<div class="img_filter"></div>
									<img alt="먼치팩토리" class="img"
										src="https://cdn.jumpit.co.kr/lg/images/team_83986/20220819150817537_1080_720.webp">
									<div class="bKGmxJ"></div>
									<div class="counts">
										<div class="position_view_count">
											<svg xmlns="http://www.w3.org/2000/svg" width="20"
												height="20">
												<g fill="none" fill-rule="evenodd">
												<path d="M0 0h16v16H0z"></path>
												<g stroke="#FFF" stroke-linecap="round">
												<path
													d="M8 10c.86 0 1.556-.672 1.556-1.5S8.859 7 8 7c-.86 0-1.556.672-1.556 1.5S7.141 10 8 10z"></path>
												<path
													d="M15 8.5c-1.469 2.243-4.108 4.5-7 4.5-2.892 0-5.531-2.257-7-4.5C2.788 6.369 4.882 4 8 4s5.212 2.369 7 4.5z"></path></g></g></svg>
											<span>87</span>
										</div>
										<button aria-pressed="false" type="button" class="scrap" onclick="location.href='hire/hirewrite'">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" fill="none" viewBox="0 0 24 24">
											<path fill="#fff" fill-rule="evenodd"
													d="M10.725 14.71a2 2 0 0 1 2.55 0l3.975 3.289V5H6.75v12.999l3.975-3.29ZM4.75 20.123V5a2 2 0 0 1 2-2h10.5a2 2 0 0 1 2 2v15.124a1 1 0 0 1-1.638.77L12 16.25l-5.612 4.645a1 1 0 0 1-1.638-.77Z"
													clip-rule="evenodd"></path></svg>
										</button>
									</div>
								</div>
								<div class="hireinfo-content">
									<div class="content-company">
										<span>먼치팩토리</span>
									</div>
									<h2 class="position_card_info_title">(React Native) 모바일앱
										개발자</h2>
									<ul class="content-techlist">
										<li>Java</li>
										<li>· Objective-C</li>
										<li>· React Native</li>
										<li>· iOS</li>
										<li>· Android OS</li>
									</ul>
									<ul class="content-area">
										<li>서울 강남구</li>
										<li>· 경력 4~15년</li>
									</ul>
								</div>
							</a>
						</div>
						<div class="hireinfo">
							<a target="_self" title="(React Native) 모바일앱 개발자" href="#">
								<div class="img_box">
									<div class="img_filter"></div>
									<img alt="먼치팩토리" class="img"
										src="https://cdn.jumpit.co.kr/lg/images/team_83986/20220819150817537_1080_720.webp">
									<div class="bKGmxJ"></div>
									<div class="counts">
										<div class="position_view_count">
											<svg xmlns="http://www.w3.org/2000/svg" width="20"
												height="20">
												<g fill="none" fill-rule="evenodd">
												<path d="M0 0h16v16H0z"></path>
												<g stroke="#FFF" stroke-linecap="round">
												<path
													d="M8 10c.86 0 1.556-.672 1.556-1.5S8.859 7 8 7c-.86 0-1.556.672-1.556 1.5S7.141 10 8 10z"></path>
												<path
													d="M15 8.5c-1.469 2.243-4.108 4.5-7 4.5-2.892 0-5.531-2.257-7-4.5C2.788 6.369 4.882 4 8 4s5.212 2.369 7 4.5z"></path></g></g></svg>
											<span>87</span>
										</div>
										<button aria-pressed="false" type="button" class="scrap">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" fill="none" viewBox="0 0 24 24">
											<path fill="#fff" fill-rule="evenodd"
													d="M10.725 14.71a2 2 0 0 1 2.55 0l3.975 3.289V5H6.75v12.999l3.975-3.29ZM4.75 20.123V5a2 2 0 0 1 2-2h10.5a2 2 0 0 1 2 2v15.124a1 1 0 0 1-1.638.77L12 16.25l-5.612 4.645a1 1 0 0 1-1.638-.77Z"
													clip-rule="evenodd"></path></svg>
										</button>
									</div>
								</div>
								<div class="hireinfo-content">
									<div class="content-company">
										<span>먼치팩토리</span>
									</div>
									<h2 class="position_card_info_title">(React Native) 모바일앱
										개발자</h2>
									<ul class="content-techlist">
										<li>Java</li>
										<li>· Objective-C</li>
										<li>· React Native</li>
										<li>· iOS</li>
										<li>· Android OS</li>
									</ul>
									<ul class="content-area">
										<li>서울 강남구</li>
										<li>· 경력 4~15년</li>
									</ul>
								</div>
							</a>
						</div>
						<div class="hireinfo">
							<a target="_self" title="(React Native) 모바일앱 개발자" href="#">
								<div class="img_box">
									<div class="img_filter"></div>
									<img alt="먼치팩토리" class="img"
										src="https://cdn.jumpit.co.kr/lg/images/team_83986/20220819150817537_1080_720.webp">
									<div class="bKGmxJ"></div>
									<div class="counts">
										<div class="position_view_count">
											<svg xmlns="http://www.w3.org/2000/svg" width="20"
												height="20">
												<g fill="none" fill-rule="evenodd">
												<path d="M0 0h16v16H0z"></path>
												<g stroke="#FFF" stroke-linecap="round">
												<path
													d="M8 10c.86 0 1.556-.672 1.556-1.5S8.859 7 8 7c-.86 0-1.556.672-1.556 1.5S7.141 10 8 10z"></path>
												<path
													d="M15 8.5c-1.469 2.243-4.108 4.5-7 4.5-2.892 0-5.531-2.257-7-4.5C2.788 6.369 4.882 4 8 4s5.212 2.369 7 4.5z"></path></g></g></svg>
											<span>87</span>
										</div>
										<button aria-pressed="false" type="button" class="scrap">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" fill="none" viewBox="0 0 24 24">
											<path fill="#fff" fill-rule="evenodd"
													d="M10.725 14.71a2 2 0 0 1 2.55 0l3.975 3.289V5H6.75v12.999l3.975-3.29ZM4.75 20.123V5a2 2 0 0 1 2-2h10.5a2 2 0 0 1 2 2v15.124a1 1 0 0 1-1.638.77L12 16.25l-5.612 4.645a1 1 0 0 1-1.638-.77Z"
													clip-rule="evenodd"></path></svg>
										</button>
									</div>
								</div>
								<div class="hireinfo-content">
									<div class="content-company">
										<span>먼치팩토리</span>
									</div>
									<h2 class="position_card_info_title">(React Native) 모바일앱
										개발자</h2>
									<ul class="content-techlist">
										<li>Java</li>
										<li>· Objective-C</li>
										<li>· React Native</li>
										<li>· iOS</li>
										<li>· Android OS</li>
									</ul>
									<ul class="content-area">
										<li>서울 강남구</li>
										<li>· 경력 4~15년</li>
									</ul>
								</div>
							</a>
						</div>
						<div class="hireinfo">
							<a target="_self" title="(React Native) 모바일앱 개발자" href="#">
								<div class="img_box">
									<div class="img_filter"></div>
									<img alt="먼치팩토리" class="img"
										src="https://cdn.jumpit.co.kr/lg/images/team_83986/20220819150817537_1080_720.webp">
									<div class="bKGmxJ"></div>
									<div class="counts">
										<div class="position_view_count">
											<svg xmlns="http://www.w3.org/2000/svg" width="20"
												height="20">
												<g fill="none" fill-rule="evenodd">
												<path d="M0 0h16v16H0z"></path>
												<g stroke="#FFF" stroke-linecap="round">
												<path
													d="M8 10c.86 0 1.556-.672 1.556-1.5S8.859 7 8 7c-.86 0-1.556.672-1.556 1.5S7.141 10 8 10z"></path>
												<path
													d="M15 8.5c-1.469 2.243-4.108 4.5-7 4.5-2.892 0-5.531-2.257-7-4.5C2.788 6.369 4.882 4 8 4s5.212 2.369 7 4.5z"></path></g></g></svg>
											<span>87</span>
										</div>
										<button aria-pressed="false" type="button" class="scrap">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" fill="none" viewBox="0 0 24 24">
											<path fill="#fff" fill-rule="evenodd"
													d="M10.725 14.71a2 2 0 0 1 2.55 0l3.975 3.289V5H6.75v12.999l3.975-3.29ZM4.75 20.123V5a2 2 0 0 1 2-2h10.5a2 2 0 0 1 2 2v15.124a1 1 0 0 1-1.638.77L12 16.25l-5.612 4.645a1 1 0 0 1-1.638-.77Z"
													clip-rule="evenodd"></path></svg>
										</button>
									</div>
								</div>
								<div class="hireinfo-content">
									<div class="content-company">
										<span>먼치팩토리</span>
									</div>
									<h2 class="position_card_info_title">(React Native) 모바일앱
										개발자</h2>
									<ul class="content-techlist">
										<li>Java</li>
										<li>· Objective-C</li>
										<li>· React Native</li>
										<li>· iOS</li>
										<li>· Android OS</li>
									</ul>
									<ul class="content-area">
										<li>서울 강남구</li>
										<li>· 경력 4~15년</li>
									</ul>
								</div>
							</a>
						</div>
						<div class="list_skeleton"></div>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>


	<script type="text/javascript">
		/* 직무 select */
		$(document).ready(function() {

							const MAX_SELECTIONS = 5;

							$('.option-btn')
									.click(
											function() {
												if ($('#selected-job .selected-job').length >= MAX_SELECTIONS) {
													alert('5개 이상의 직무를 선택할 수 없습니다.');
													return;
												}

												const jobText = $(this).text();
												addSelectedJob(jobText);
												$(this).prop('disabled', true);
											});

							$('.apply-btn').click(function() {
								updateToggleText();
							});

							$('.resetjob').click(function() {
								resetSelectedJobs();
							});

							function addSelectedJob(jobText) {
								const jobElement = $('<div>').addClass(
										'selected-job').css({
									display : 'inline-block',
									marginLeft : '6px',
									marginRight : '10px',
									marginBottom : '5px',
									border : '1px solid #ccc',
									backgroundColor : '#fafafa',
									padding : '6px',
									borderRadius : '15px',
									fontWeight : 'bold',
									paddingLeft : '8px'
								});

								const jobTextElement = $('<span>')
										.text(jobText);
								const removeButton = $('<button>').html(
										'<i class="bi bi-x-lg"></i>').css({
									marginLeft : '10px',
									border : 'none',
									background : 'none',
									color : 'blue',
									cursor : 'pointer'
								});

								removeButton.on('click', function() {
									jobElement.remove();
									$('.option-btn').each(function() {
										if ($(this).text() === jobText) {
											$(this).prop('disabled', false);
										}
									});
								});

								jobElement.append(jobTextElement).append(
										removeButton);
								$('#selected-job').append(jobElement);
							}

							function updateToggleText() {
								const selectedJobs = $('#selected-job .selected-job');
								const toggleText = $('span.title');
								if (selectedJobs.length === 0) {
									toggleText.text("개발 직무");
								} else {
									const firstJobText = selectedJobs.first()
											.find('span').text().trim();
									const remainingJobsCount = selectedJobs.length - 1;
									toggleText
											.text(remainingJobsCount > 0 ? '개발・'
													+ firstJobText
													+ ' 외 '
													+ remainingJobsCount
													: '개발・' + firstJobText);
								}
							}

							function resetSelectedJobs() {
								$('#selected-job').empty();
								$('.option-btn').prop('disabled', false);
								updateToggleText();
							}
						});

		/* 기술 스택 select */
		$(document)
				.ready(
						function() {

							$('.techoption-btn').click(function() {
								const techText = $(this).text();
								addSelectedTech(techText);
								$(this).prop('disabled', true);
							});

							$('.techapply-btn').click(function() {
								updateToggleText();
							});

							$('.resettech').click(function() {
								resetSelectedTechs();
							});

							function addSelectedTech(techText) {
								const techElement = $('<div>').addClass(
										'selected-tech').css({
									display : 'inline-block',
									marginLeft : '6px',
									marginRight : '10px',
									marginBottom : '5px',
									border : '1px solid #ccc',
									backgroundColor : '#fafafa',
									padding : '6px',
									borderRadius : '15px',
									fontWeight : 'bold',
									paddingLeft : '8px'
								});

								const techTextElement = $('<span>').text(
										techText);
								const removeButton = $('<button>').html(
										'<i class="bi bi-x-lg"></i>').css({
									marginLeft : '10px',
									border : 'none',
									background : 'none',
									color : 'blue',
									cursor : 'pointer'
								});

								removeButton.on('click', function() {
									techElement.remove();
									$('.techoption-btn').each(function() {
										if ($(this).text() === techText) {
											$(this).prop('disabled', false);
										}
									});
								});

								techElement.append(techTextElement).append(
										removeButton);
								$('#selected-tech').append(techElement);
							}

							function updateToggleText() {
								const selectedTechs = $('#selected-tech .selected-tech');
								const toggleText = $('span.title2');
								if (selectedTechs.length === 0) {
									toggleText.text("기술 스택");
								} else {
									const firstTechText = selectedTechs.first()
											.find('span').text().trim();
									const remainingTechsCount = selectedTechs.length - 1;
									toggleText
											.text(remainingTechsCount > 0 ? '기술・'
													+ firstTechText
													+ ' 외 '
													+ remainingTechsCount
													: '기술・' + firstTechText);
								}
							}

							function resetSelectedTechs() {
								$('#selected-tech').empty();
								$('.techoption-btn').prop('disabled', false);
								updateToggleText();
							}
						});
	</script>

	<script type="text/javascript">
		/* 카테고리2 슬라이드 기능 */
		document.addEventListener('DOMContentLoaded',
				function() {
					const category2Container = document
							.querySelector('.category2-container');
					const leftButton = document
							.querySelector('.bi-chevron-left').parentElement;
					const rightButton = document
							.querySelector('.bi-chevron-right').parentElement;
					let scrollPosition = 0;
					const scrollAmount = 500; // 스크롤 이동 거리 조정 가능

					rightButton.addEventListener('click', function() {
						const maxScroll = category2Container.scrollWidth
								- category2Container.clientWidth;
						if (scrollPosition < maxScroll) {
							scrollPosition += scrollAmount;
							category2Container.scrollTo({
								top : 0,
								left : scrollPosition,
								behavior : 'smooth'
							});
						}
					});

					leftButton.addEventListener('click', function() {
						if (scrollPosition > 0) {
							scrollPosition -= scrollAmount;
							category2Container.scrollTo({
								top : 0,
								left : scrollPosition,
								behavior : 'smooth'
							});
						}
					});
				});

		/* 카테고리2 버튼 클릭 */
		$(".category2").click(function() {
			var category2press = $(this).attr("aria-pressed");
			$(this).attr("aria-pressed",category2press === "true" ? "false" : "true");
		});

		/* 경력 버튼 이벤트 */
		$(".career").hide();

		$(".carreerbtn").click(function() {
			$(".career").toggle();
		})

		$(".btnreset")
				.click(
						function() {
							// 모든 input 요소의 체크 상태를 해제
							$("input[type='radio']").prop('checked', false);
							// "전체" 항목을 선택
							$("#all").prop('checked', true);
							// "경력" 버튼 내용을 원래대로 돌려놓기
							$(".carreerbtn")
									.html(
											'경력 <span><i class="bi bi-chevron-down"></i></span>')
									.css('width', '70px');
						})

		$('input[name="career"]')
				.change(
						function() {
							// 선택된 경력 텍스트 가져오기
							var selectedCareer = $(
									'input[name="career"]:checked').next()
									.text().trim();
							// 경력 버튼 텍스트 업데이트
							$('.carreerbtn')
									.html(
											'경력 <span style="color: blue;">'
													+ selectedCareer
													+ '</span> <span class="bi bi-chevron-down" style="vertical-align: middle;font-size: 15px;font-weight: bold;"></span>');
							// 버튼 너비 조정
							$('.carreerbtn').css('width', '90px');
							$('div.region').css('margin-left', '94px');
							if (selectedCareer == '10년 이상') {
								$('.carreerbtn').css('width', '130px');
								$('div.region').css('margin-left', '134px');
							}
						});

		/* 지역 버튼 이벤트 */
		$(".region").hide();

		var isAllSelected = true;

		$(".regionbtn").click(function() {
		    $(".region").toggle();
		    $('.region-detail ul').hide();
		    
		    // 이전에 추가된 "전국" div가 있다면 삭제
		    $('#selected-region').find('.selected-region:contains("전국")').remove();
		    addSelectedregion('전국');
		    
		    /* 지역버튼 클릭시 전국이 클릭되어있도록 */
		    if (isAllSelected) {
		        $(".regionbox-option").find("button[value='all']").addClass("selected").css("color", "blue").css("font-weight", "bold");
		    }else{
		       $(".regionbox-option button").find("button[value='all']").removeClass("selected").css("color", "black").css("font-weight", "0");
		       $('#selected-region').find('.selected-region:contains("전국")').remove();
		    }
		});

		$(".regionbox-option button").click(function() {
		    var value = $(this).val();
		    var text = $(this).text();

		    // 이미 선택된 지역이 있는지 확인
		    var alreadySelected = $('#selected-region').find('.selected-region').filter(function() {
		        return $(this).text().includes(text);
		    }).length > 0;

		    if (value === 'all') {
		        isAllSelected = true;
		        if (!alreadySelected) {
		            addSelectedregion('전국');
		        }
		    } else {
		        isAllSelected = false;
		        if (!alreadySelected) {
		            addSelectedregion(text + ' 전체');
		        }
		    }

		});


		$('.region-btn').on('click', function(){
		    var region = $(this).val();
		    $('.region-detail-empty').hide();
		    $('.region-detail ul').hide();
		    $('.' + region).show();
		    $('.' + region + ' li:first input[type="checkbox"]').attr("checked", true);
		});

		$('.region-btn').click(function() {
		    regionText = $(this).text();
		    if(regionText !== "전국") {
		        // 전국 버튼에서 selected 클래스를 제거하고 스타일을 원래대로 되돌립니다.
		        $(".regionbox-option").find("button[value='all']").removeClass("selected").css("color", "").css("font-weight", "");
		        // 선택된 지역을 삭제
		        $('#selected-region').find('.selected-region:contains("전국")').remove();
		    }else{
		       $(this).addClass("selected").css("color","blue").css("font-weight","bold");
		       $(".regionbox-option").find("button").not("[value='all']").removeClass("selected").css("color", "").css("font-weight", "");
		       $(".region-detail-empty").show();
		    }
		    $(this).css("color","blue").css("font-weight","bold");
		});

		//'전체' 체크박스 클릭 이벤트
		$('li:contains("전체") input[type="checkbox"]').click(function() {
		    const $ul = $(this).closest('ul');
		    const isAllChecked = $(this).prop("checked");
		    const regionTextss = regionText + " " + $(this).closest('li').text().trim();

		    if (isAllChecked) {
		        // '전체' 체크박스를 선택한 경우
		        // 같은 ul 내의 다른 체크박스를 해제
		        $ul.find('li input[type="checkbox"]').not(this).prop("checked", false);
		        // 다른 선택된 지역을 제거
		        $ul.find('li').not(':contains("전체")').each(function() {
		            const otherRegionTextss = regionText + " " + $(this).text().trim();
		            $('#selected-region').find('.selected-region:contains("' + otherRegionTextss + '")').remove();
		        });
		        // '전체'를 추가
		        if (!$('#selected-region').find('.selected-region:contains("' + regionTextss + '")').length) {
		            addSelectedregion(regionTextss);
		        }
		    } else {
		        // '전체' 체크박스를 해제한 경우
		        $('#selected-region').find('.selected-region:contains("' + regionTextss + '")').remove();
		    }
		});

		// 다른 체크박스 클릭 이벤트
		$('li').not(':contains("전체")').find('input[type="checkbox"]').click(function() {
		    const $ul = $(this).closest('ul');
		    const regionTextss = regionText + " " + $(this).closest('li').text().trim();

		    if ($(this).prop("checked")) {
		        // 같은 ul 내의 '전체' 체크박스를 해제
		        $ul.find('li:contains("전체") input[type="checkbox"]').prop("checked", false);
		        // '전체' 체크박스 관련 선택된 지역을 제거
		        $('#selected-region').find('.selected-region:contains("' + regionText + ' 전체")').remove();
		        // 현재 선택된 지역을 추가
		        if (!$('#selected-region').find('.selected-region:contains("' + regionTextss + '")').length) {
		            addSelectedregion(regionTextss);
		        }
		        // 로컬 스토리지에서 제거
		        localStorage.setItem(regionText + '-allChecked', 'false');
		    } else {
		        // 체크박스를 해제한 경우
		        $('#selected-region').find('.selected-region:contains("' + regionTextss + '")').remove();
		    }
		});

		function addSelectedregion(regionTextss) {
		    const regionElement = $('<div>').addClass('selected-region').css({
		        display: 'inline-block',
		        marginLeft: '5px',
		        marginRight: '5px',
		        marginBottom: '5px',
		        border: '1px solid #ccc',
		        backgroundColor: '#fafafa',
		        padding: '6px',
		        borderRadius: '15px',
		        fontWeight: 'bold',
		        paddingLeft: '8px'
		    });

		    const regionTextElement = $('<span>').text(regionTextss);
		    const removeButton = $('<button>').html('<i class="bi bi-x-lg"></i>').css({
		        marginLeft: '0px',
		        border: 'none',
		        background: 'none',
		        color: 'blue',
		        cursor: 'pointer'
		    });

		    removeButton.on('click', function() {
		       regionElement.remove();
		        $('li input[type="checkbox"]').each(function() {
		            if ($(this).closest('li').text().trim() === regionTextss) {
		                $(this).prop('disabled', false);
		            }
		        });
		    });

		    regionElement.append(regionTextElement).append(removeButton);
		    $('#selected-region').append(regionElement);
		}
		
		$('.btnreset').click(function() {
			resetSelectedRegion();
		});	
		
		function resetSelectedRegion() {
			$('#selected-region').empty();
			$('.region-btn').attr('disabled', false);
			$('.' + region + ' li input[type="checkbox"]').attr("checked", false);
		}

		$(document).ready(function() {
		    // 기존 코드 유지

		    $(document).click(function(event) {
		        // .career 및 .careerbtn를 제외한 영역 클릭 시 .career 숨기기
		        if (!$(event.target).closest('.career, .carreerbtn').length) {
		            $('.career').hide();
		        }
		        // .region 및 .regionbtn를 제외한 영역 클릭 시 .region 숨기기
		        if (!$(event.target).closest('.region, .regionbtn, .selected-region').length) {
		            $('.region').hide();
		        }
		    });
		});
		</script>

	<script type="text/javascript">
		/* modal 개발 직무 */
		$(document).ready(function() {
			function positionModal() {
				var title = $('span.title');
				var modal = $('#myModal');

				// 제목 요소의 위치와 크기를 가져옴
				var titleOffset = title.offset();

				// 모달을 제목 요소 아래로 배치
				modal.css({
					top : titleOffset.top + title.outerHeight(),
					left : titleOffset.left
				});
			}

			// 페이지가 로드될 때 모달 위치 조정
			positionModal();

			// 윈도우 크기가 조정될 때마다 모달 위치 재조정
			$(window).resize(positionModal);

			// 모달이 열릴 때 위치 조정
			$('#myModal').on('show.bs.modal', function() {
				positionModal();
				$(this).show(); // 모달 표시
			});
		});

		$(document).click(
				function(event) {
					if (!$(event.target).closest(
							'.job, #myModal, .selected-job').length) {
						$('#myModal').modal("hide");
					}
				});

		/* modal 기술 스택 */
		$(document).ready(function() {
			function positionModal() {
				var title = $('span.title2');
				var modal = $('#myModal2');

				var titleOffset = title.offset();

				modal.css({
					top : titleOffset.top + title.outerHeight(),
					left : titleOffset.left
				});
			}

			positionModal();

			$(window).resize(positionModal);

			$('#myModal2').on('show.bs.modal', function() {
				positionModal();
				$(this).show(); // 모달 표시
			});
		});

		$(document).click(
				function(event) {
					if (!$(event.target).closest(
							'.tech, #myModal2, .selected-tech').length) {
						$('#myModal2').hide();
					}
				});
	</script>
</body>
</html>
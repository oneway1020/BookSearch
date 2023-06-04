<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>궁금할땐? Search Mania!</title>
	<!-- Bootstrap cdn 설정 -->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style>
		.body-Container {
			padding: 80px 80px 160px 80px;
		}
		
		.carousel-inner img {
			filter: grayscale(90%);
			width: 100%;
			max-height: 700px;
			margin: auto;
		}
		
		.carousel-caption h3 {
			color: #FF0000 !important;
		}
		
		.navbar {
			margin-bottom: 0;
			background: #202020;
			border: 0;
			font-size: 11px;
			letter-spacing: 4px; /*글자 간격 띄우기 */
			opacity: 0.9;
		}
		
		.navbar li a, .navbar .navbar-brand {
			color: #D50505 !important;
		}
		
		.navbar-nav li a:hover {
			color: #FFF !important;
		}
		
		#category{
			width: 100%;
		    display: flex;
	  		justify-content: space-between;
	  		margin: 0px;
	  		padding: 80px 0 80px 0;
	  		color: black;
	  		list-style: none;
	  		font-weight: bold;
	  		font-size: 3em;
		}
		
		#category > li {
			text-align: center;
	  		font-size: 1em;
	  		float: left;
		}
		#category > li > a {
			display: block;
			padding: 0px 15px;
		}
		#menu {
			padding-bottom: 700px;
		}
		
		select {
			width: 200px; /* 원하는 너비설정 */
			padding: .8em .5em;
			appearance:none;
		}
		
	</style>
	<!-- !important = 스타일 최우선수위 (다른거에 먹히지 않게) -->
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

	<!-- 상단 메뉴바 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myMenu">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">SearchMania</a>
			</div>
			<div class="collapse navbar-collapse" id="myMenu">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#myPage">HOME</a></li>
					<li><a href="#category">CATEGORY</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="containter text-center" style="color: black; font-weight: bold; font-size: 3em; padding-top: 80px;">
		최고의 검색사이트! SearchMaina
	</div>
	<!-- 화면 중앙에 이미지를 보여준다. -->
	<div class="body-Container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
					<!-- <img class="img-responsive center-block" src="http://localhost:8080/main/resources/images/books01.jpg" width="80%" height="200px"/> -->
					<img class="img-responsive center-block" src="/resources/images/chicago.jpg" width="100%"/>
					<!-- carousel에 설명을 달아준다. -->
					<div class="carousel-caption">
						<h2>원하는 정보를 찾으세요!</h2>
					</div>
				</div> 
				<div class="item">
					<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
					<img class="img-responsive center-block" src="/resources/images/newyork.jpg" width="100%"/>
					<!-- carousel에 설명을 달아준다. -->
					<div class="carousel-caption">
						<h2>검색을 통해 다양한 정보를 찾으실 수 있습니다.</h2>
					</div>
				</div> 
				<div class="item">
					<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
					<img class="img-responsive center-block" src="/resources/images/jongro.jpg" width="100%"/>
					<!-- carousel에 설명을 달아준다. -->
					<div class="carousel-caption">
						<h2>정보가 필요한 카테고리를 선택 후, 검색버튼을 눌러주세요.</h2>
					</div>
				</div> 
			</div>
			
			<!-- 좌측, 우측으로 그림을 움직일 수 있도록 좌/우버튼을 설정한다. -->
			<a class="left  carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>


	<!-- 카테고리 설정 -->
	<div class="container text-center" id="category">
		카테고리 선택
	</div>
	<div class="container">
		<form id="searchForm">
			<div class="row" id="menu">
				<select id="categorySearch" title="카테고리" onchange="callSearch();">
					<option value="none">==========선택==========</option>
					<option value='book' >책</option>
					<option value='shop' >쇼핑</option>
					<option value='webkr' >웹문서</option>
					<option value='image' >이미지</option>
				</select>
				<input id="searchInput" style="width: 200px; padding: .8em .5em;" class="hiddenSearch" name="searchText" hidden="hidden" placeholder="검색할 내용을 입력해주세요." onkeypress="fnEnterkey();"/>
				<input style="width: 100px; padding: .8em .5em;" class="hiddenSearch" type="button" hidden="hidden" value="검색" onclick="searchWeb();"/>
			</div>
		</form>
	</div>
	<!--  
	<form id="testSend">
		<input id="id" name="id" value="1234"/>
		<button type="button" onclick="testformGo();">전송</button>
	</form>
	-->

</body>
<script src="/resources/js/search.js">
/*
	function testformGo() {
		let testForm = document.getElementById("testSend");
		testForm.action = "search/user/" + $("#id").val();
		testForm.method = "GET";
		testForm.submit();
	}
*/
</script>
</html>

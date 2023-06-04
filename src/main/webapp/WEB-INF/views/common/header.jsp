<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

   <!-- datepick 사용하기 위해 추가 -->
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
   <!-- end -->
	
	<!-- icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/52943f354a.js" crossorigin="anonymous"></script>

<style>
	#tool {
		float: right;
		padding: 30px 0px;
	}
	select {
		width: 100px; /* 원하는 너비설정 */
		appearance:none;
	}
	#search_A {
		margin-right: 5px;
		cursor: pointer;	
	}
	#search_A:link, #search_A:visited, #search_A:hover, #search_A:active{
		color: black;
		text-decoration: none;
	}

	header>div {
		position:fixed;
		top: 0;
		left: 0;
		right: 0;
		background-color: #f5f5dc;
	}
	
</style>

<script src="/resources/js/search.js">
</script>

<header>
	<div class="container">
		<form id="searchForm">
			<div id="tool">
				<select id="categorySearch" title="카테고리">
					<option value="none" disabled>===선택===</option>
					<option value='book' <c:if test="${category == 'book'}">selected</c:if>>책</option>
					<option value='shop' <c:if test="${category == 'shop'}">selected</c:if>>쇼핑</option>
					<option value='webkr' <c:if test="${category == 'webkr'}">selected</c:if>>웹문서</option>
					<option value='image' <c:if test="${category == 'image'}">selected</c:if>>이미지</option>
				</select>
				<input value="${searchText}" id="searchInput" type="text" name="searchText" size="35" maxlength="35" onkeypress="fnEnterkey();"/>
				<!-- 검색하면 해당 내용으로 이동 -->
				<a id="search_A"onclick="searchWeb();">
					<i id="searchIcon" class="bi bi-search fs-5"></i>
				</a>
			</div>
		</form>
	</div>
</header>
<script>
</script>

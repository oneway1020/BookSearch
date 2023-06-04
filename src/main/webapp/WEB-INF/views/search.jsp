<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보검색</title>

</head>

<style>
	.productImg {
		height: 400px;
		overflow:hidden;
		margin: 0 auto;
	}
	
	.productImg a:hover, .descriptionLi a:hover, #webSearch1 a:hover, #webSearch2 a:hover {
		cursor: pointer;
	}
	
	#webSearchWrapper {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		border-bottom: 1px solid;
	}
	
	#webSearch1 {
		display: inline-block;
		vertical-align: middle;
		margin: 0.5rem;
		padding: 0;
		max-width: 700px;
		margin-bottom: 20px;
	}
	
	#webSearch2 {
		display: inline-block;
		margin-left: auto;
		padding-left: 400px;
		vertical-align: middle;
	}
	
	
</style>

<body>
	<!-- 헤더 -->
	<jsp:include page="./common/header.jsp" flush="false"/>
	
	<main class="container" style="margin-top:120px;">
	<h3>검색결과: <fmt:formatNumber value="${totalResult }" pattern="#,###"/>개 확인되었습니다.</h3>
	<c:choose>
		<c:when test="${category == 'book'}">
			<div>(이미지 클릭 시, 해당 상품과 관련된 네이버 쇼핑 사이트로 이동합니다.)</div>
			<br/>
			<div class="row row-cols-4 row-cols-md-4 g-4">
				<!-- 카테고리에서 데이터를 받아 출력 -->
				<c:forEach var="List" items="${result}">
						<div class="col" style="margin-bottom: 20px;">
							<div class="productImg">
								<a onclick="location.href='${List.link}'">
									<c:choose>
										<c:when test="${List.image || List.image == '[]'}">
											<img style="width: 100%; height: 400px;" src="/resources/images/noImage.png"/>
										</c:when>
										<c:otherwise>
											<img style="width: 100%; height: 400px;" src="${List.image}"/>
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<!-- 정보 -->
							<div class="description">
								<div class="productName" style="height: 100px; margin:10px 0 10px 0; padding: 0;">
									<span class="title displaynone">제목 : </span>
									<span style="font-size:12px;">${List.title}</span>
								</div>
								<hr/>
								<div class="descriptionDiv">
									<ul class="descriptionUl">
										<li class="descriptionLi" title="저자">
											<span class="title displaynone">저자 : </span>
											<a onclick="searchAuthor(this);">
												<span style="font-size:13px;" data-value="${List.author}">${List.author}</span>
											</a>
										&nbsp;
										</li>
									</ul>
								</div>
								<div style="line-height:200%;">
									<br/>
								</div>
							</div>
						</div>
				</c:forEach>	
			</div>
		</c:when>
		<c:when test="${category == 'shop' }">
			<div>(이미지 클릭 시, 해당 상품과 관련된 네이버 쇼핑 사이트로 이동합니다.)</div>
			<br/>
			<div class="row row-cols-4 row-cols-md-4 g-4">
				<!-- 카테고리에서 데이터를 받아 출력 -->
				<c:forEach var="List" items="${result}">
						<div class="col" style="margin-bottom: 20px;">
							<div class="productImg">
								<a onclick="location.href='${List.link}'">
									<c:choose>
										<c:when test="${List.image || List.image == '[]'}">
											<img style="width: 100%; height: 400px;" src="/resources/images/noImage.png"/>
										</c:when>
										<c:otherwise>
											<img style="width: 100%; height: 400px;" src="${List.image}"/>
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<!-- 정보 -->
							<div class="description">
								<div class="productName" style="height:100px; margin:10px 0 10px 0; padding: 0;">
									<span class="title displaynone">상품명 : </span>
									<br/>
									<span style="font-size:12px;">${List.title}</span>
								</div>
								<hr/>
								<div class="descriptionDiv">
									<ul class="descriptionUl">
										<c:if test="${not empty List.category1}">
											<li class="descriptionLi" title="category1">
												<span class="title displaynone">category1 : </span>
												<a onclick="searchAuthor(this);">
													<span style="font-size:13px;" data-value="${List.category1}">${List.category1}</span>
												</a>
											&nbsp;
											</li>
										</c:if>
										<c:if test="${not empty List.category2}">
											<li class="descriptionLi" title="category2">
												<span class="title displaynone">category2 : </span>
												<a onclick="searchAuthor(this);">
													<span style="font-size:13px;" data-value="${List.category2}">${List.category2}</span>
												</a>
											&nbsp;
											</li>
										</c:if>
										<c:if test="${not empty List.category3}">
											<li class="descriptionLi" title="category3">
												<span class="title displaynone">category3 : </span>
												<a onclick="searchAuthor(this);">
													<span style="font-size:13px;" data-value="${List.category3}">${List.category3}</span>
												</a>
											&nbsp;
											</li>
										</c:if>
										<c:if test="${not empty List.category4}">
											<li class="descriptionLi" title="category4">
												<span class="title displaynone">category4 : </span>
												<a onclick="searchAuthor(this);">
													<span style="font-size:13px;" data-value="${List.category4}">${List.category4}</span>
												</a>
											&nbsp;
											</li>
										</c:if>
									</ul>
								</div>
								<div style="line-height:200%;">
									<br/>
								</div>
							</div>
						</div>
				</c:forEach>	
			</div>
		</c:when>
		<c:when test="${category == 'webkr' }">
			<div style="margin-bottom: 100px;">(텍스트 클릭 시, 해당 사이트로 이동됩니다.)</div>
			<br/>
				<!-- 카테고리에서 데이터를 받아 출력 -->
				<c:forEach var="List" items="${result}">
					<div id="webSearchWrapper">
						<div id="webSearch1">
							<!-- 정보 -->
							<a onclick="location.href='${List.link}'">
								<span style="font-size:18px;">${List.description}</span>
							</a>
						</div>
						<div id="webSearch2">
							<a onclick="location.href='${List.link}'">
								<span class="descriptionDiv">
									${List.title}
								</span>
							</a>
						</div>
						<span style="line-height:200%;">
							<br/>
							<br/>
							<br/>
						</span>
					</div>
				</c:forEach>	

		</c:when>
		<c:when test="${category == 'image' }">
			<div>(이미지 클릭 시, 원본 크기의 이미지를 볼 수 있습니다.)</div>
			<br/>
			<div class="row row-cols-4 row-cols-md-4 g-4">
				<!-- 카테고리에서 데이터를 받아 출력 -->
				<c:forEach var="List" items="${result}">
						<div class="col" style="margin-bottom: 20px;">
							<div class="productImg">
								<a onclick="location.href='${List.link}'">
									<c:choose>
										<c:when test="${List.image || List.image == '[]'}">
											<img style="width: 100%; height: 400px;" src="/resources/images/noImage.png"/>
										</c:when>
										<c:otherwise>
											<img style="width: 100%; height: 400px;" src="${List.thumbnail}"/>
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<!-- 정보 -->
							<div class="description">
								<div class="productName" style="height: 100px; margin:10px 0 10px 0; padding: 0;">
									<span class="title displaynone">제목 : </span>
									<span style="font-size:12px;">${List.title}</span>
								</div>
								<hr/>
								<div style="line-height:200%;">
									<br/>
								</div>
							</div>
						</div>
				</c:forEach>	
			</div>
		</c:when>
	</c:choose>
	
	
	<!-- 페이징 버튼 -->
	<div style="display: flex; justify-content: center; align-items: center; margin-top: 20px;">
		<ul class="btn-group pagination">
		    <c:if test="${pageMaker.prev}">
			    <li>
			        <a class="btn btn-outline-secondary" onclick="location.href='/search/${category}?searchText=${searchText}&page=${pageMaker.startPage-1}'"><i class="bi bi-chevron-double-left"></i></a>
			    </li>
		    </c:if>
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
		    	<c:choose>
		    		<c:when test="${pageNum == 1 && empty param.page}">
					    <li>
					        <a class="btn btn-secondary disabled"><i>${pageNum}</i></a>
					    </li>		    		
		    		</c:when>
		    		<c:when test="${param.page eq pageNum}">
					    <li>
					        <a class="btn btn-secondary disabled"><i>${pageNum}</i></a>
					    </li>
					</c:when>
					<c:otherwise>
						<li>
					        <a class="btn btn-outline-secondary" onclick="location.href='/search/${category}?searchText=${searchText}&page=${pageNum}'"><i>${pageNum}</i></a>
					    </li>
					</c:otherwise>
				</c:choose>
		    </c:forEach>
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <li>
			        <a class="btn btn-outline-secondary" onclick="location.href='/search/${category}?searchText=${searchText}&page=${pageMaker.endPage+1}'"><i class="bi bi-chevron-double-right"></i></a>
			    </li>
		    </c:if>
		</ul>
	</div>
	
	</main>
</body>
</html>
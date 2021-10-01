<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container">

	<c:forEach var="user" items="${users.content}">

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">${user.id} 사용자 아이디 : ${user.username}</h4>
				<p class="card-text">이메일 : ${user.email}</p>
				<p class="card-text">포인트 : ${user.rank}</p>
				<a href="/admin/${user.id}" class="card-link">회원삭제</a> 
				<a href="/admin/point/${user.id}"  class="card-link">포인트부여</a>
			</div>
	</c:forEach>
	
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${users.first }">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${users.number-1}">이전</a></li>
			</c:when>

			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${users.number-1}">이전</a></li>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${users.last }">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${users.number+1}">다음</a></li>
			</c:when>

			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${users.number+1}">다음</a></li>
			</c:otherwise>
		</c:choose>




	</ul>

</div>
<%@ include file="../layout/footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>
<div class="container">
	<div class="jumbotron">
		<p>게시글 작성시 포인트 10점! / 댓글 작성시 포인트 5점! / 운동 인증시 포인트 50점!</p>
	</div>

	<button class="badge list-group-item d-flex justify-content-between" float="right">
		<a href="/board/saveForm">글쓰기</a>
	</button>

	<c:forEach var="board" items="${boards.content}">

		<div class="card m-2">
			<div class="card-body">
				<h4 class="card-title">${board.title}</h4>
				<span class="badge badge-info">아이디: ${board.user.username}</span>

				<c:choose>
					<c:when test="${board.user.rank < 40}">
						<span class="badge badge-dark">사용자랭크 : ${board.user.rank}</span>
						<br />
					</c:when>

					<c:when test="${board.user.rank>40 and board.user.rank<80}">
						<span class="badge badge-danger">사용자랭크 : ${board.user.rank}</span>
						<br />
					</c:when>

					<c:otherwise>
						<span class="badge badge-primary">사용자랭크 :
							${board.user.rank}</span>
						<br />
					</c:otherwise>

				</c:choose>

				<a href="/board/${board.id}" class="btn btn-light">${board.content}</a>
			</div>
		</div>
	</c:forEach>

	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${boards.first }">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${boards.number-1}">Previous</a></li>
			</c:when>

			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${boards.number-1}">Previous</a></li>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${boards.last }">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${boards.number+1}">Next</a></li>
			</c:when>

			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${boards.number+1}">Next</a></li>
			</c:otherwise>
		</c:choose>




	</ul>
</div>

<%@ include file="layout/footer.jsp"%>

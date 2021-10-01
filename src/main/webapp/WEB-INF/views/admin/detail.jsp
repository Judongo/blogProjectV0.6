<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<input type="hidden" id="userId" value="${admin.id}" />
	<div>
		선택하신 사용자 : ${admin.username} 
		<br />
		정말 삭제하시겠습니까?
	</div>
	<br />
	<div>
		<button id="btn-user-delete">확인</button>
		<button onclick="history.back()">돌아가기</button>
	</div>
</div>


<script src="/js/admin.js"></script>

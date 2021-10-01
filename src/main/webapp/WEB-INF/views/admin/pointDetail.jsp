<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
<input type="hidden" id="userId" value="${admin.id}" />
<input type="hidden" id="userPoint" value="${admin.rank+50}" />
	<div>
		선택하신 사용자 : ${admin.username} 
		<br />
		50 포인트를 부여 하시겠습니까?
	</div>
<br />
<button id="btn-givePoint">확인</button>
<button onclick="history.back()">돌아가기</button>
</div>


<script src="/js/admin.js"></script>

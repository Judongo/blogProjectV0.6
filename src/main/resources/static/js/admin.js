let index = {
	init: function(){
		$("#btn-user-delete").on("click",()=>{ //this 바인딩 위해
			this.userDeleteById();
		});
		
		$("#btn-givePoint").on("click",()=>{ //this 바인딩 위해
			this.pointUpdate();
		});
		
		$("#btn-board-delete").on("click",()=>{ //this 바인딩 위해
			this.boardDelete();
		});
	},
	
	
    userDeleteById: function(){
	
		let id= $("#userId").val();
		
		$.ajax({
			type: "DELETE",
			url: "/api/user/"+id,
			dataType: "json"
		}).done(function(resp){
			alert("삭제가 완료 되었습니다.");
			location.href = "/admin/user";
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); 
	},
	
	pointUpdate: function(){
	
		let data = {
			userId: $("#userId").val(),
			rank: $("#userPoint").val()
		};
		console.log(data.rank);
		
		$.ajax({
			type: "PUT",
			url: `/api/user/point/${data.userId}`,
			data: JSON.stringify(data), 
			contentType: "application/json; charset=utf-8", 
			dataType: "json"
			
		}).done(function(resp){
			alert("선택하신 회원의 포인트 수정이 완료 되었습니다.");
			console.log(resp);
			location.href = "/admin/user";
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); 
	},
	
	boardDelete: function(){
	
		let id= $("#BoardId").val();
		
		$.ajax({
			type: "DELETE",
			url: "/api/board/"+id,
			dataType: "json"
		}).done(function(resp){
			alert("삭제가 완료 되었습니다.");
			location.href = "/admin/board";
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); 
	},
	
	
	
}

index.init();
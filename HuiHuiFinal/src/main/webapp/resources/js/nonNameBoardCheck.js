$(function(){
	$("#nonNameWriteForm").on("submit", function(){		//글쓰기 유효성 검사
		//var titleModal = document.querySelector("#titleModal");
		if($("#nonTitle").val().lenth <= 0){
			alert('제목이 입력되지 않');
			
			$(this).modal({
	        	fadeDuration: 250
	      });
		}
	});
	
	
});
$(document).ready(function(){
	$(".nonRecommend").click(function(){
	
		var isOn = $(this).hasClass("recommend-on");
		console.log("isOn : " + isOn);
		var addAndCancle = "cancle";
		if(! isOn) {
			addAndCancle = "add";
			$(this).addClass("recommend-on");
		} else {
			$(this).addClass("recommend-on");
			$(this).removeClass("recommend-on");
		}
	
		var param = {
					"nonRecommend" : $(this).attr("id") , 
					"nonNameNo" : $("#no").val(),
					"addAndCancle" : addAndCancle 
				}
		console.log("param : " + param);
		$.ajax({
			url : "thank.ajax",
			type : "post",
			data : param,
			dataType : "json",
			success : function(data){
				console.log(data);
				$("#recommend #nonNameThank").text("좋아요 " + data.nonNameThank);
				$("#recommend #nonNameBad").text("싫어요 " + data.nonNameBad);
			}, 
			error: function(xhr, err) {
				console.log(err);
			}
		});
	});
});
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인일정 캘린더</title>


<!-- calendar  API 고정 CSS 파일 -->
<link href='resources/css/calendar.css' rel='stylesheet' />

<style>

#calendar {
	width: 70%;
	padding-left: 25%;
	margin-top: -700px;
	
}


.fc-header-toolbar{
	padding-left:25%;
	}
	
	.fc-toolbar-title{
	font-size:0.8em;
	}	
	
 .tooltipEvent {
	position: absolute;
	
	background: #FFC107;
	color: black;
	
	border-radius: 3px;
	border-style: solid;
	box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
	padding: 10px;
	text-align: center;
	border-width: 5px 5px 0 5px;
	border-left-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	border-top-color: transparent;
	
	bottom: -5px;
	margin:100px auto;
	font-size:12px;
	top: -5px;
	left: calc(50% - 5px);
	margin-top: 170px;
	margin-left:-420px;
	margin-bottom: 0;
	
	
} 

</style>

<script>

	var calendar;
	
	$(function(){
		
	
		var calendarEl = $("#calendar")[0];
		calendar = new FullCalendar.Calendar(calendarEl, {
			
			events: ${cUList},
			initialView: 'dayGridMonth',
			locale:'ko',
			navLinks:true,
			nowIndicator:true,
			dayMaxEvents:true,
			editable:true,
			headerToolbar :{
				
				left:'prev,today,next,addEventButton',
				right:'dayGridMonth,timeGridWeek,timeGridDay',
				center:'title'
			},
			
			// popover 창 ! 
			eventMouseEnter:function(calEvent){
				//
				var start = calEvent.event._instance.range.start;
				var sYear = start.getUTCFullYear();
				var sMonth = start.getUTCMonth()+1;
				var sDate = start.getUTCDate();
				var startDate = sYear +"-" + (sMonth < 10 ? "0"+sMonth : sMonth) +"-" +(sDate <10 ? "0"+sDate : sDate);
				console.log("startDate : " + startDate );
				$("#calendar_start_date").val(startDate);
				
				var sHour = start.getUTCHours();
				var sMinute = start.getUTCMinutes();
				var startTime = (sHour < 10 ? "0"+sHour : sHour) +":" + (sMinute < 10 ? "0"+sMinute : sMinute);
				$("#calendar_start_time").val(startTime);
				
				var end = calEvent.event._instance.range.end;
				var eYear = end.getUTCFullYear();
				var eMonth = end.getUTCMonth() +1 ;
				var eDate = end.getUTCDate();
				var endDate = eYear + "-" + (eMonth < 10 ? "0"+eMonth : eMonth) +"-" + (eDate < 10 ? "0"+eDate : eDate);
				$("#calendar_end_date").val(endDate);
				
				var eHour = end.getUTCHours();
				var eMinute = end.getUTCMinutes(); 
				var endTime = (eHour < 10 ? "0"+eHour : eHour) +":"+(eMinute <10 ? "0"+eMinute : eMinute);
				$("#calendar_end_time").val(endTime);
				
				
				
				//
				var tooltip = 
				"<div class='tooltipEvent' style='width:190px; height:110px; color:white; vertical-align: middle; background:"
				+calEvent.event._def.ui.backgroundColor+"; position:absolute; ' >"
				+" 작성자 : "
				+  calEvent.event._def.publicId+ "<br/>"
				+" 제목 : "
				+ calEvent.event._def.title + "<br/>"
				+ "일정내용 : "
				+ calEvent.event._def.extendedProps.description+ "<br/>"
				+ "시작시간 : "
				+ startDate +" "+ startTime + "<br/>"
				+"종료시간 : " 
				+ endDate +" "+ endTime
				+"</div>" ;
				
				$("body").append(tooltip);
				
				
			},
			eventMouseLeave:function(calEvent, jsEvent){
				$(this.el).css("z-index", 8);
				$(".tooltipEvent").remove();
			},
			selectable:true,
			select:function(arg){
				
			},
			eventReceive:function(arg){
				console.log(arg);
			},
			eventClick:function(arg){
				$("#calendarModal").modal("show");
				$("#addCalendarUserEvent").css("display","none");
				$("#updateCalendarUserEvent").css("display", "inline-block");
				$("#deleteCalendarUserEvent").css("display","inline-block");
				$("#exampleModalLabel").text("일정 수정");
				console.log(arg);
			
				if(${sessionScope.id} !=arg.event._def.publicId){
					console.log(arg.event._def.publicId);
					console.log(${sessionScope.id});
					
					alert("작성자만 수정할 수 있습니다.");
					
					return false;
					
				}
		            
				
				$("#calendar_title").val(arg.event._def.title);
				$("#calendar_description").val(arg.event._def.extendedProps.description);
				$("#emp_id").after("<input type='hidden' id='event_no' value='" + arg.event._def.extendedProps.no + "' />");
				
				var start = arg.event._instance.range.start;
				var sYear = start.getUTCFullYear();
				var sMonth = start.getUTCMonth()+1;
				var sDate = start.getUTCDate();
				var startDate = sYear +"-" + (sMonth < 10 ? "0"+sMonth : sMonth) +"-" +(sDate <10 ? "0"+sDate : sDate);
				console.log("startDate : " + startDate );
				$("#calendar_start_date").val(startDate);
				
				var sHour = start.getUTCHours();
				var sMinute = start.getUTCMinutes();
				var startTime = (sHour < 10 ? "0"+sHour : sHour) +":" + (sMinute < 10 ? "0"+sMinute : sMinute);
				$("#calendar_start_time").val(startTime);
				
				var end = arg.event._instance.range.end;
				var eYear = end.getUTCFullYear();
				var eMonth = end.getUTCMonth() +1 ;
				var eDate = end.getUTCDate();
				var endDate = eYear + "-" + (eMonth < 10 ? "0"+eMonth : eMonth) +"-" + (eDate < 10 ? "0"+eDate : eDate);
				$("#calendar_end_date").val(endDate);
				
				var eHour = end.getUTCHours();
				var eMinute = end.getUTCMinutes(); 
				var endTime = (eHour < 10 ? "0"+eHour : eHour) +":"+(eMinute <10 ? "0"+eMinute : eMinute);
				$("#calendar_end_time").val(endTime);
				
				
				$("#text_color").val(arg.event._def.ui.textColor);
				$("#background_color").val(arg.event._def.ui.backgroundColor);
				
			},
			eventAdd:function(arg){
				console.log(arg);
			},
			eventRemove:function(arg){
				console.log(arg);
			}, 
			eventChange:function(arg){
				console.log(arg);
				
			},
			customButtons: {
				addEventButton: {
					text:"일정 추가",
					click : function(){
						$("#calendarModal").modal("show");
						$("#addCalendarUserEvent").css("display", "inline-block");
						$("#updateCalendarUserEvent").css("display", "none");
						$("#deleteCalendarUserEvent").css("display","none");
						$("#examplemodalLabel").text("일정 추가");
						confirm("일정을 추가하시겠습니까 ???");
					}
				}
			},
		
		});    // calendar
		
		calendar.render();
		
		
		
		
		$("#addCalendarUserEvent").on("click", function(){
			calendarUserEventUpdate($(this).attr("id"));	
			
		});
		
		$("#updateCalendarUserEvent").on("click",function(){
			calendarUserEventUpdate($(this).attr("id"));
			alert("수정 되었습니다.");
		});
		
		$("#deleteCalendarUserEvent").on("click", function(){
			var check= confirm("삭제하시겠습니까 ??? ");
			if( ! check ){
				return false;
			}
			calendarUserEventUpdate($(this).attr("id"));
			alert("삭제 되었습니다");
		});
			
		$("button#calendarModalClose").on("click", function() {
			$("#calendarModal").modal("hide");
		});
		
		$("button.close").on("click", function() {
	         $("#calendarModal").modal("hide");
	      });
		
		// 모달 창이 닫히면 
		$("#calendarModal").on("hidden.bs.modal", function() {
			console.log("calendarModal 닫힘");
			// 폼에서 id가 event_no인 요소를 삭제한다.
			$("#event_no").remove();
			$("#eventForm")[0].reset();			
		});
		
	
		
	}); //fucntion 

	
	// prev , next  넘어가면 해당 월에 대한 DB 가져와서 뿌리기 ! 
	
	// 월 옮기면 해당 월에 대한 캘린더 일정 받아오기 
	
	
	
	
	
	// modal 창에서 추가 수정 삭제 버튼 ! 기능부여
	function calendarUserEventUpdate(reqUri){
		var eventData = {};
		
		eventData["no"] = $("#event_no").val();
		
		var start_date = $("#calendar_start_date").val();
		var start_time = $("#calendar_start_time").val();
		
		eventData["start"] = start_date + " " + start_time;
		
		if(reqUri != "deleteCalendarUserEvent"){
			
			var title = $("#calendar_title").val();
			var description = $("#calendar_description").val();
			var end_date = $("#calendar_end_date").val();
			var end_time = $("#calendar_end_time").val();
			console.log("start_time : " + start_time);
			console.log("end_time : " + end_time);
			
			if(description == null || description == ""){
				alert("일정 세부내용을 입력해주세요 ");
				return false;
			
			}else if(start_date == "" || end_time == ""){
				alert("시작 및 종료 일자를 입력해주세요");
				return false;
				
			}else if(new Date(end_date) - new Date(start_date) <0){
				alert("종료일이 시작일 보다 빠릅니다.");
				return false;
			}else if(start_time =="" || end_time == ""){
				alert("시작 및 종료 시간을 입력해주세요 ");
				return false;
			}
			
			eventData["id"] = $("#emp_id").val();
			eventData["title"] = title;
			eventData["description"] = description;
			eventData["end"] = end_date + " " + end_time;
			eventData["textColor"] = $("#text_color").val();
			eventData["backgroundColor"]= $("#background_color").val();
		}
		
		var reqEventData = JSON.stringify(eventData)
		console.log("JSON.stringify() : \n  " + reqEventData);
		
		$.ajax({
			url:reqUri,
			contentType:"application/json",
			dataType:"JSON",
			type:"POST",
			data:reqEventData,
			success: function(res){
				console.log("res " + res);
				$("#calendarModal").modal("hide");
				
				$("#eventForm")[0].reset();
				calendarUserEventRenderUpdate(res)
				
			},
			error :function(){
				console.log("ajax error");
			}
		});
	}  //calendarUserEventUpdate
	
	
	// 추가 , 수정했을 때  다시 뿌려주기 !! 
	function calendarUserEventRenderUpdate(eventList){
		calendar.removeAllEvents();
		
		$.each(eventList, function(index, item){
			calendar.addEvent(item);
		});
		
		calendar.refetchEvents();
	}  //calendarUserEventRenderUpdate
	
	
</script>
</head>
<body>
	
	<div id="calendar-container">
		<div id='calendar'></div>
	</div>

	<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog"
		aria-labellby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">일정 추가</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<form id="eventForm">
							<!-- emp_id 는 나중에 로그인 기능이 완료되면 로그인한 사번으로 대체가 필요함 -->
							<input type="hidden" id="emp_id" name= "emp_id" value="${sessionScope.id} "/>
							<!-- 수정하고 삭제는 event(일정) 번호 no가 필요함 -->
							<label for="calendar_title" class="col-form-lable">일정제목</label> <input
								type="text" class="form-control" id="calendar_title"
								name="calendar_title" /> <label for="calendar_description"
								class="col-form-lable">일정내용</label> <input type="text"
								class="form-control" id="calendar_description"
								name="calendar_description" /> <label for="calendar_start_date"
								class="col-form-label">날짜설정</label> <input type="date"
								class="form-control" id="calendar_start_date"
								name="calendar_start_date" /> <label for="calendar_start_time"
								class="col-form-label">시간설정</label> <input type="time"
								class="form-control" id="calendar_start_time"
								name="calendar_start_time" /> <label for="calendar_end_date"
								class="col-form-label">날짜설정</label> <input type="date"
								class="form-control" id="calendar_end_date"
								name="calendar_end_date" /> <label for="calendar_end_time"
								class="col-form-label">시간설정</label> <input type="time"
								class="form-control" id="calendar_end_time"
								name="calendar_end_time" /> <label for="text_color"
								class="col-form-label">글자색</label> <input type="color"
								class="form-control" id="text_color" value="#FFFFFF" /> <label
								for="background_color" class="col-form-label">배경색</label> <input
								type="color" class="form-control" id="background_color"
								value="#0000FF" />
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="addCalendarUserEvent">추가</button>
					<button type="submit" class="btn btn-warning"id="updateCalendarUserEvent">수정</button>
					<button type="submit" class="btn btn-warning" id="deleteCalendarUserEvent">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="calendarUserModalClose">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
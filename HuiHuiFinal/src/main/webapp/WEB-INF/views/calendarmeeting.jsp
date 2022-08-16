<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/css/calendar.css' rel='stylesheet' />
<style>
	#calendar{
		width: 70%;
		padding-left: 25%;
		margin-top: -700px;
		margin-bottom:100px;
	}
	.fc-prev-button.fc-button.fc-button-primary, .fc-next-button.fc-button.fc-button-primary{
 			background-color:#e096a9; 
	}
	.fc-addEventButton-button.fc-button.fc-button-primary{
	background-color:#e096a9; 
	}
	
</style>


  
<style>

.tooltipEvent{
	position: absolute;
	background: #FFC107;
	color: balck;
	border-radius: 3px;
	border-style: solid;
	box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
	padding: 10px;
	text-align: center;
	border-width: 5px 5px 0px 5px;
	border-left-color: transparent;
	border-right-color: transparent;
	border-top-color: transparent;
	
	bottom: -5px;
	margin: 100px auto;
	font-size: 12px;
	top: -5px;
	left: calc(50% -5px);
	margin-top: 135px;
	margin-left: -510px;
	margin-bottom: 0;
	
	 
}

</style>

<script>	
	var calendar;
	
	$(function() {
		var calendarEl = $("#calendar")[0];
		calendar= new FullCalendar.Calendar(calendarEl, {
			
			events: ${cList},
			initialView:'timeGridWeek', 		
			locale : 'ko',  							
			navLinks:true,					
			nowIndicator:true, 					
			dayMaxEvents:true, 					
			editable:true,							
			headerToolbar:{		
				
				left: 'prev',
				center:'title' ,
				right: 'next,addEventButton,dayGridMonth,timeGridWeek,timeGridDay'
			 },			
			 
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
					
					var tooltip = 
					"<div class='tooltipEvent' style='width:200px; height:110px; color:white; vertical-align: middle; background:"
					+calEvent.event._def.ui.backgroundColor+"; position:absolute; ' >"
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
				alert("일정이 수정하시겠습니까?");
				$("#addCalendarMeetingEvent").css("display", "none");	 			
				$("#updateCalendarMeetingEvent").css("display", "inline-block");
	 			$("#deleteCalendarMeetingEvent").css("display", "inline-block");
	 			$("#exampleModalLabel").text("일정 수정하기");
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
				var sMonth = start.getUTCMonth() + 1;
				var sDate = start.getUTCDate();
				var startDate = sYear + "-" + (sMonth < 10 ? "0" + sMonth : sMonth)  + "-" + (sDate < 10 ? "0" + sDate : sDate);
				console.log("startDate : " + startDate);
				$("#calendar_start_date").val(startDate);
				
				var sHour = start.getUTCHours();
				var sMinute = start.getUTCMinutes();
				var startTime = (sHour < 10 ? "0" + sHour : sHour) + ":" + (sMinute < 10 ? "0" + sMinute : sMinute);
				$("#calendar_start_time").val(startTime);
								
				// end 날짜와 시간
				var end = arg.event._instance.range.end;
				var eYear = end.getUTCFullYear();
				var eMonth = end.getUTCMonth() + 1;
				var eDate = end.getUTCDate()+1;
				var endDate = eYear + "-" + (eMonth < 10 ? "0" + eMonth : eMonth) + "-" + (eDate < 10 ? "0" + eDate : eDate);
				$("#calendar_end_date").val(endDate);
				console.log("endDate");
				var eHour = end.getUTCHours();
				var eMinute = end.getUTCMinutes();
				var endTime = (eHour < 10 ? "0" + eHour : eHour ) + ":" + (eMinute < 10 ? "0" + eMinute : eMinute);				
				$("#calendar_end_time").val(endTime);
				
				$("#text_color").val(arg.event._def.ui.textColor);
				$("#background_color").val(arg.event._def.ui.backgroundColor);				
				
			 },
			 
			eventAdd:function(arg){ 			
				console.log(arg);
			},
			eventRemove: function(arg){ 	
				console.log(arg);
			},
			eventChange : function(arg){ 	
				console.log(arg);
			},
		
			customButtons: {
				 addEventButton:{
				 		text: " 일정추가 ",
				 		click: function(){
				 			$("#calendarModal").modal("show");				 			
				 			$("#addCalendarMeetingEvent").css("display", "inline-block");
				 			$("#updateCalendarMeetingEvent").css("display", "none");
				 			$("#deleteCalendarMeetingEvent").css("display", "none");
				 			$("#exampleModalLabel").text("일정 추가하기");
				 		}
				 	}
			 },
			
		});
		
		calendar.render();
		
		$("button.fc-prev-button").click(function(e) {			
	 		console.log("button.fc-prev-button");
	 		
	 		var localeDate = calendar.getDate().toLocaleString();
	 		var splitDate = localeDate.substring(0, localeDate.indexOf(" 오전") - 1).split(". ");
	 		var month = splitDate[1] < 10 ? "0" + splitDate[1] : splitDate[1];
	 		var date = splitDate[2] < 10 ? "0" + splitDate[2] : splitDate[2];
	 		var startDate = splitDate[0] + "-" + month + "-" + date;
	 		console.log("startDate : " + startDate);
	 		
	 		calendarMonthMove(startDate);
		});
		
		$("button.fc-next-button").click(function(e) {	 		
			console.log("button.fc-next-button");
			var localeDate = calendar.getDate().toLocaleString();
	 		var splitDate = localeDate.substring(0, localeDate.indexOf(" 오전") - 1).split(". ");
	 		var month = splitDate[1] < 10 ? "0" + splitDate[1] : splitDate[1];
	 		var date = splitDate[2] < 10 ? "0" + splitDate[2] : splitDate[2];
	 		var startDate = splitDate[0] + "-" + month + "-" + date;
	 		console.log("startDate : " + startDate);
	 		
	 		calendarMonthMove(startDate);
		});
		
		$("#addCalendarMeetingEvent").on("click", function() {
			 calendarEventUpdate($(this).attr("id"));
		});
		
		$("#updateCalendarMeetingEvent").on("click", function() {
			calendarEventUpdate($(this).attr("id"));
		});
				
		
		$("#deleteCalendarMeetingEvent").on("click", function() {			
			var result = confirm("삭제되면 복구되지 않습니다. 삭제하시겠습니까?");
			if(!result) {
				return false;
				}
			calendarEventUpdate($(this).attr("id"));
		});
		
		$("button#calendarModalClose").on("click", function() {
			$("#calendarModal").modal("hide");
		});
		
		$("button.close").on("click", function() {
	         $("#calendarModal").modal("hide");
	     });
		
		
	
		$("#calendarModal").on("hidden.bs.modal", function() {
			console.log("calendarModal 닫힘");
			
			$("#event_no").remove();
			$("#eventForm")[0].reset();			
		});
	
		
	}); 
	
	function calendarMonthMove(startDate) {		
	
		$.ajax({
			url: "calendarMonthMove",
			dataType: "JSON",
			type: "POST",
			data: "startDate=" + startDate,
			success: function(res) {
				console.log("res : " + res);				
				calendarUpdate(res)
			}, 
			error: function() {
				console.log("ajax error");
			}
		});
	}
	
	
	function calendarEventUpdate(reqUri) {		
		
		var eventData = {};
		
		eventData["no"] = $("#event_no").val();
		var start_date = $("#calendar_start_date").val();
		var start_time = $("#calendar_start_time").val();
		eventData["start"] = start_date + " " + start_time;
		
		if(reqUri != "deleteCalendarMeetingEvent") { 
			
			var title = $("#calendar_title").val();
			var description = $("#calendar_description").val();			
			var end_date = $("#calendar_end_date").val();			
			var end_time = $("#calendar_end_time").val();
			console.log("start_time : " + start_time);
			console.log("end_time : " + end_time);
			
			
			if(description==null || description== ""){
				alert("일정의 세부 내용을 입력해주세요");
				return false;
			}else if(start_date == ""|| end_date==""){
				alert("시작 및 종료 일자를 입력하세요");
				return false;
			}else if(new Date(end_date)- new Date(start_date)< 0){
				alert("종료일이 시작일 보다 빠릅니다.");
				return false;
			}else if(start_time =="" || end_time==""){
				alert("시작 및 종료 시간을 입력해주세요.");
				return false;
			}
			
			eventData["id"] = $("#emp_id").val();			
			eventData["title"] = title;			
			eventData["description"] = description;			
			eventData["end"] = end_date + " " + end_time;			
			eventData["textColor"] = $("#text_color").val();
			eventData["backgroundColor"] = $("#background_color").val();
		}		
		
		var reqEventData = JSON.stringify(eventData);
		console.log("JSON.stirngfy() : \n" + reqEventData);				
		
		$.ajax({
			url: reqUri,
			contentType: "application/json",
			dataType: "JSON",
			type: "POST",
			data: reqEventData,
			success: function(res) {
				console.log("res : " + res);				
				$("#calendarModal").modal("hide");
				
				$("#eventForm")[0].reset();
				
				calendarUpdate(res)
			}, 
			error: function() {
				console.log("ajax error");
			}
		});
		
	} 
	
	function calendarUpdate(eventList) {
		calendar.removeAllEvents();
		
		$.each(eventList, function(index, item) {			
			calendar.addEvent(item);
		});
		
		calendar.refetchEvents();
		
	} 
	
</script>
</head>
<body>
	
	<div id="calendar-container">
			<div id='calendar'></div>
	</div>	
	
	<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labellby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">일정을 입력하세요</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>				
				<div class="modal-body">
					<div class="form-group">
						<form id="eventForm">
							<!-- emp_id 는 나중에 로그인 기능이 완료되면 로그인한 사번으로 대체가 필요함 -->
							<input type="hidden" id="emp_id" value="${sessionScope.id }" />
							<!-- 수정하고 삭제는 event(일정) 번호 no가 필요함 -->							
						    <label for="calendar_title" class="col-form-lable">일정제목</label>
							<input type="text" class="form-control" id="calendar_title" name="calendar_title" />
							<label for="calendar_description" class="col-form-lable">일정내용</label>
							<input type="text" class="form-control" id="calendar_description" name="calendar_description" />
							<label for="calendar_start_date" class="col-form-label">날짜설정</label>
							<input type="date" class="form-control"  id="calendar_start_date" name="calendar_start_date" />
							<label for="calendar_start_time" class="col-form-label">시간설정</label>
							<input type="time" class="form-control" id="calendar_start_time" name="calendar_start_time" />
							<label for="calendar_end_date" class="col-form-label">날짜설정</label>
							<input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date" />
							<label for="calendar_end_time" class="col-form-label">시간설정</label>
							<input type="time" class="form-control" id="calendar_end_time" name="calendar_end_time" />
							<label for="text_color" class="col-form-label">글자색</label>
							<input type="color" class="form-control" id="text_color" value="#FFFFFF" />
							<label for="background_color" class="col-form-label">배경색</label>
							<input type="color" class="form-control" id="background_color" value="#0000FF" />
						</form>
					</div>
				</div>				
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="addCalendarMeetingEvent">추가</button>
					<button type="submit" class="btn btn-warning" id="updateCalendarMeetingEvent">수정</button>
               		<button type="submit" class="btn btn-warning" id="deleteCalendarMeetingEvent">삭제</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal"
							id="calendarMeetingModalClose">취소</button>
				</div>
			</div>			
		</div>
	</div>
</body>
</html>
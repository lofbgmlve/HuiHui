<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>


<script src='resources/js/ko.js'></script>

<script>	
	// 아래는 DB 연동되기 전에 테스트용으로 사용한 데이터
	
	//컨트롤러에서 모델에 저장한 데이터 출력 
	// console.log(${cList});
	
	/* FullCalendar.Calendar 객체를 참조할 변수를 전역 변수로 선언
	 * 여러 함수에서 사용할 수 있어야 하므로 전역변수로 선언함 
	 **/
	var calendar;
	
	$(function() {
		var calendarEl = $("#calendar")[0];
		calendar = new FullCalendar.Calendar(calendarEl, {
			//height: '700px',						// 캘린더 높이 설정
			//expandRows : true,				// 화면에 맞게 높이 재 설정
			//initialDate: '2022-04-22',		// 초기 날짜 설정(설정하지 않으면 오늘을 기준으로)
			//timeZone: 'local',						// 타입 존 설정			
			//selectMirror:true,					// ?
			events: ${cList},		//calEvents,				// 이벤트(일정) 데이터
			initialView:'dayGridMonth', 		// 초기 로딩될 때 보이는 캘린더 화면
			locale : 'ko',  							// 한국어 설정
			navLinks:true,						// 날짜를 클릭할 수 있는지 여부(default: false), 날짜를 선택하면 Day 또는 Week 캘린더로 링크
			nowIndicator:true, 					// 현재 시간 마크
			dayMaxEvents:true, 				// 이벤트(일정)가 오버되면 높이 제한(몇 개씩으로 표현)			
			editable:true,							// 수정 가능?
			headerToolbar:{						// 헤더에 추가할 툴바 
				left: 'prev,today,next,addEventButton',
				right: 'dayGridMonth,timeGridWeek,timeGridDay',
				center:'title' 
			 },			
			 displayEventTime:{
				 month:true,
				 basicWeek: true,
				 "default":true
			 },	
			 
			 selectable:true,					// 달력 일자 드래그 설정가능
			 select:function(arg){			// 캘린더에서 드래그로 event(일정)를 생성할 수 있음	 
				 /*
				 title = prompt("일정 제목을 입력해 주세요");
				 if(title){
					 calendar.addEvent({
						 title:title,
						 start:arg.start,
						 end:arg.end,
						 backgroundColor:"blue",
						 textColor:"white"
					 });
				 }
				 calendar.unselect();
				 */
			 },
			 eventReceive:function(arg){	// ?
				 console.log(arg);
			 }, 
			
			 
			 
			 eventClick:function(arg){ 		// event(일정)가 클릭되면 발생하는 이벤트
				$("#calendarModal").modal("show");
				$("#addCalendarEvent").css("display", "none");	 			
				$("#updateCalendarEvent").css("display", "inline-block");
	 			$("#deleteCalendarEvent").css("display", "inline-block");
	 			$("#exampleModalLabel").text("일정 수정");
			 	console.log(arg);
			 	
			 	// 로그인 시에 emp_id를 설정해야 함
			 	if($("#emp_id").val() != arg.event._def.publicId) {
			 		alert("작성자만 수정할 수 있습니다.");
			 		return false;
			 	}
			 	
			 	$("#calendar_title").val(arg.event._def.title);			 	
				$("#calendar_description").val(arg.event._def.extendedProps.description);				
				// $("#all_day_time").prop("checked", arg.event._def.allDay);				
				$("#emp_id").after("<input type='hidden' id='event_no' value='" + arg.event._def.extendedProps.no + "' />");
				
				// start  날짜와 시간
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
				var eDate = end.getUTCDate();
				var endDate = eYear + "-" + (eMonth < 10 ? "0" + eMonth : eMonth) + "-" + (eDate < 10 ? "0" + eDate : eDate);
				$("#calendar_end_date").val(endDate);
				
				var eHour = end.getUTCHours();
				var eMinute = end.getUTCMinutes();
				var endTime = (eHour < 10 ? "0" + eHour : eHour ) + ":" + (eMinute < 10 ? "0" + eMinute : eMinute);				
				$("#calendar_end_time").val(endTime);
				
				$("#text_color").val(arg.event._def.ui.textColor);
				$("#background_color").val(arg.event._def.ui.backgroundColor);				
				
			 },
			 /* !!!!!!!!!!!!!!!!!!!!!!!!!!
			 eventMouseEnter: function(){
				 var title = $("#calendar_title").val(arg.event._def.title);			 	
				 var description = $("#calendar_description").val(arg.event._def.extendedProps.description);	
			 	$(arg.el).prpover({
			 		title : #
			 	})
			 } */
			eventAdd:function(arg){ 			// event(일정)가 추가되면 발생하는 이벤트
				console.log(arg);
			},
			eventRemove: function(arg){ 	// event(일정)가 삭제되면 발생하는 이벤트
				console.log(arg);
			},
			eventChange : function(arg){ 	// event(일정)가 수정되면 발생하는 이벤트
				console.log(arg);
			},
			customButtons: {
				 addEventButton:{
				 		text: " 일정추가 ",
				 		click: function(){
				 			$("#calendarModal").modal("show");				 			
				 			$("#addCalendarEvent").css("display", "inline-block");
				 			$("#updateCalendarEvent").css("display", "none");
				 			$("#deleteCalendarEvent").css("display", "none");
				 			$("#exampleModalLabel").text("일정 추가하기");
				 		}
				 	}
			 },
		});
		
		// 캘린더를 화면에 그린다.
		calendar.render();
		
		// 일정 추가 모달 창에서 추가 버튼이 클릭되었을 때 이벤트 처리
		$("#addCalendarEvent").on("click", function() {
			/* 아래에 별도로 만든 함수를 호출해 폼에 입력된 값을 읽어와 Ajax를 통해
			 * 서버로 전송하고 새롭게 갱신된 event(일정) 데이터를 받아서 화면에 갱신한다.
			 **/
			 calendarEventUpdate($(this).attr("id"));
		});
		
		// 일정 수정/삭제 모달 창에서 event(일정) 수정 버튼이 클릭되었을 때 이벤트 처리
		$("#updateCalendarEvent").on("click", function() {
			/* 아래에 별도로 만든 함수를 호출해 폼에 입력된 값을 읽어와 Ajax를 통해
			 * 서버로 전송하고 새롭게 갱신된 event(일정) 데이터를 받아서 화면에 갱신한다.
			 **/
			calendarEventUpdate($(this).attr("id"));
		});
		
		// 일정 수정/삭제 모달 창에서 event(일정) 삭제 버튼이 클릭되었을 때 이벤트 처리
		$("#deleteCalendarEvent").on("click", function() {
			/* 아래에 별도로 만든 함수를 호출해 폼에 입력된 값을 읽어와 Ajax를 통해
			 * 서버로 전송하고 새롭게 갱신된 event(일정) 데이터를 받아서 화면에 갱신한다.
			 **/
			calendarEventUpdate($(this).attr("id"));
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
		
	}); // end  $(function() {})
	
	
	// 추가 또는 수정 폼에 입력한 event(일정)을 Ajax를 통해 db에 추가하는 함수
	function calendarEventUpdate(reqUri) {		
		
		var eventData = {};
		
		eventData["no"] = $("#event_no").val();
		var start_date = $("#calendar_start_date").val();
		var start_time = $("#calendar_start_time").val();
		eventData["start"] = start_date + " " + start_time;
		
		if(reqUri != "deleteCalendarEvent") { // 삭제하기가 아닐때
			
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
				alert("시작 및 종료 시간을 입력해주세요.")
				return false;
			}
			
			eventData["id"] = $("#emp_id").val();			
			eventData["title"] = title;			
			eventData["description"] = description;			
			eventData["end"] = end_date + " " + end_time;			
			eventData["textColor"] = $("#text_color").val();
			eventData["backgroundColor"] = $("#background_color").val();
		}		
		
		// JavaScript 객체를 서버로 보내기 위해서 JSON 형식의 문자열로 직렬화
		var reqEventData = JSON.stringify(eventData)
		console.log("JSON.stirngfy() : \n" + reqEventData);				
		
		$.ajax({
			// 요청 주소는 함수의 매개변수로 받아 사용하므로 상황에 따라서 요청 주소가 동적으로 바뀐다.
			url: reqUri,
			contentType: "application/json",
			dataType: "JSON",
			type: "POST",
			data: reqEventData,
			success: function(res) {
				// 응답 받은 데이터 출력하고 반환할 변수에 저장 후 모달 창을 닫는다. 
				console.log("res : " + res);				
				$("#calendarModal").modal("hide");
				
				// 폼에 입력된 event(일정) 정보를 초기화
				$("#eventForm")[0].reset();
				
				// 화면에서 Calendar event(일정)를 갱신한다.
				calendarUpdate(res)
			}, 
			error: function() {
				console.log("ajax error");
			}
		});
		
	} // ends addCalendarEvent()

	// Calendar에 Event가 추가/수정/삭제 될 때 마다 화면의 Calendar Event를 갱신하는 함수	 	
	function calendarUpdate(eventList) {
		// 화면에 모든 event(일정)을 모두 지우고 
		calendar.removeAllEvents();
		
		// DB에서 읽어온 event(일정)로 캘린더를 구성한다.
		$.each(eventList, function(index, item) {			
			// FullCalendar.Calendar 객체의 addEvent() 함수를 이용해 캘린더(일정표)에서 event(일정)을 추가
			calendar.addEvent(item);
		});
		
		calendar.refetchEvents();
		
	}  // end calendarEventUpdate
	
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
							<input type="hidden" id="emp_id" value="1001" />
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
					<button type="button" class="btn btn-warning" id="addCalendarEvent">추가</button>
					<button type="submit" class="btn btn-warning" id="updateCalendarEvent">수정</button>
               		<button type="submit" class="btn btn-warning" id="deleteCalendarEvent">삭제</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal"
							id="calendarModalClose">취소</button>
				</div>
			</div>			
		</div>
	</div>
</body>
</html>
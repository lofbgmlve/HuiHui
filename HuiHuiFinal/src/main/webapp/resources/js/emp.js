// DOM이 준비되면 실행될 콜백 함수 

/* 회원 아이디, 비밀번호, 비밀번호 확인, 이메일 아이디 폼 컨트롤에
 * 사용자가 입력한 값이 영문 대소문자, 숫자 만 입력되도록 수정하는 함수
 **/
function inputCharReplace() {
   // 아래와 같이 정규표현식을 이용해 영문 대소문자, 숫자만 입력되었는지 체크할 수 있다. 
   var regExp = /[^0-9]/gi;   
   if(regExp.test($(this).val())) {
      alert("숫자만 입력할 수 있습니다.");
      $(this).val($(this).val().replace(regExp, ""));
   }
}


$(function() {   

   // 회원 로그인 폼이 submit 될 때 폼 유효성 검사를 위한 이벤트 처리
   $("#loginForm").submit(function() {
      var employeeId = $("#employeeId").val();
      var pass = $("#userPass").val();
      
      if(employeeId.length <= 0) {
         alert("사원번호가 입력되지 않았습니다.\n사원번호를 입력해주세요");
         $("#useremployeeId").focus();
         return false;
      }
      if(pass.length <= 0) {
         alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
         $("#userPass").focus();
         return false;
      }
   });
   
   //회원 가입 폼에서 폼 컨트롤 키보드 입력을 체크해 유효한 값을 입력 받을수 있도록 Keyup 이벤트 처리
   
   $("#employeeId").on("keyup", function() {
      var regExp = /[^0-9]/g;
      if(regExp.test($(this).val())) {
         alert("숫자만 입력할 수 있습니다.");
         $(this).val($(this).val().replace(regExp, ""));
         }
   $("#pass").on("keyup", inputCharReplace);      
   
   });

   //회원 가입 폼이 서브 밋 될 때 이벤트 처리
   $("#joinForm").on("submit", function() {
      return joinForm();
   });

   function joinForm() {
      var employeeId = $("#employeeId").val();
      var eName = $("#eName").val();
      var pass = $("#pass").val();
      var address1 = $("#address1").val();
      var address2 = $("#address2").val();
      var dName = $("#dName").val();
      var deptNo = $("#deptNo").val();
      var position = $("#position").val();
      var mobile2 = $("#mobile2").val();
      var mobile3 = $("#mobile3").val();
      
      if(employeeId.length == 0) {
         alert("사원번호가 입력되지 않았습니다.\n사원번호를 입력해주세요.")
         return false;
      }   
      
      if(eName.length == 0) {
         alert("이름이 입력되지 않았습니다.\n이름을 입력해주세요.")
         return false;
      }   
      
      if(pass.length == 0) {
         alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요.")
         return false;
      }   
      
      if(address1.length == 0) {
         alert("주소가 입력되지 않았습니다.\n주소를 입력해주세요.")
         return false;
      }   
      
      if(address2.length == 0) {
         alert("상세주소가 입력되지 않았습니다.\n상세주소를 입력해주세요.")
         return false;
      }   
      
      if(dName.length == 0) {
         alert("부서명이 입력되지 않았습니다.\n부서명을 입력해주세요.")
         return false;
      }   
      
      if(deptNo.length == 0) {
         alert("부서번호가 입력되지 않았습니다.\n부서번호를 입력해주세요.")
         return false;
      }   
      
      if(position.length == 0) {
         alert("직급이 입력되지 않았습니다.\n직급을 입력해주세요.")
         return false;
      }   
      
      
      if(mobile2.length == 0 || mobile3.length == 0) {
         alert("휴대폰 번호가 입력되지 않았습니다.\n휴대폰 번호를 입력해주세요.")
         return false;
      }   

   }
   
});
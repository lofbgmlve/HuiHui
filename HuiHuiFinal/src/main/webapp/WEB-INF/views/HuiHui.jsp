<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
   .carousel-inner{
      width:850px;
      height:300px;
      margin : 0px auto;
   }
   #carouselExampleIndicators{
      width:1100px;
      height:280px;
      margin-top : -500px;
      margin-left : 150px;
   }
   
   #document{
      width:250px;
      height:250px;
      margin-left : 300px;
      margin-top : -250px;
      border-radius: 25px;
   }
   
   #commute{
      width : 250px;
      height : 250px;
      margin-left : 700px;
      margin-top : -250px;
      border-radius: 25px;
   }
   #toDo{
      width : 250px;
      height : 250px;
      margin-left : 1150px;
      margin-top : -250px;
      border-radius: 25px;
   }
</style>
</head>
<body>

<div class="position-relative">
<div id="carouselExampleIndicators" class="carousel slide col-md-6  carousel-dark slide position-absolute top-0 start-50 translate-middle" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="http://www.moel.go.kr/policy/policydata/view.do?bbs_seq=20200300883"><img src="resources/img/huihuiMain01.png" class="d-block w-100"></a>
    </div>
    <div class="carousel-item">
      <a href="https://m.etnews.com/20220110000038"><img src="https://img.etnews.com/photo_main/conference/2022/01/10/cms_conference_view_10095531248771.jpg" class="d-block w-100" alt="...">
    </a></div>
    <div class="carousel-item">
      <img src="resources/img/huihuiMain03.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>

<div class="position-relative" id="document">
   <div class="col-md-3 position-absolute top-50 start-50 translate-middle">
      <img src="resources/img/call.jpg" />
   </div>
</div>

<div class="position-relative" id="commute">
   <div class="col-md-3 position-absolute top-50 start-50 translate-middle">
      <img src="resources/img/naver.jpg" />
   </div>
</div>

<div class="position-relative" id="toDo">
   <div class="col-md-3 position-absolute top-50 start-50 translate-middle">
      <img src="resources/img/summer.jpg" />
   </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
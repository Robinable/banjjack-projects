<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>안녕2</title>
    <%@ include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
    <section class="pt-4 pb-0 card-grid">
        <div class="container">
            <div class="row g-4">
                <!-- 왼쪽 -->
                <div class="col-lg-6">
                    <div class="card text-bg-dark">
                        <img src="http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg" class="card-img" alt="image">
                        <div class="card-img-overlay">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small>Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <!-- 오른쪽 -->
                <div class="col-lg-6">
                    <div class="row g-4">

                        <div class="col-12">
                            <div id="carouselExampleControls" class="carousel slide card text-bg-dark card-overlay-bottom card-grid-sm card-bg-scale" data-bs-ride="carousel">
                                <div class="carousel-inner w-auto" style="height: 346px;">
                                  <div class="carousel-item active">
                                    <img src="https://product.cdn.cevaws.com/var/storage/images/media/adaptil-2017/images/www-ww/shutterstock_395310793-3-2/3547034-1-www-WW/shutterstock_395310793-3-2.jpg" class="d-block w-100" alt="...">
                                  </div>
                                  <div class="carousel-item">
                                    <img src="https://image.dongascience.com/Photo/2022/06/6982fdc1054c503af88bdefeeb7c8fa8.jpg" class="d-block w-100" alt="...">
                                  </div>
                                  <div class="carousel-item">
                                    <img src="https://img.hankyung.com/photo/202109/99.26479073.1.jpg" class="d-block w-100" alt="...">
                                  </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Next</span>
                                </button>
                              </div>
                        </div>

                        <div class="col-md-6 w-50">
                            <div class="card text-bg-light card-overlay-bottom card-grid-sm card-bg-scale">
                                <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2022/01/28/111500268.2.jpg" class="card-img" alt="...">
                                <div class="d-flex align-items-center">
                                  <h5 class="card-title">Card title</h5>
                                </div>
                              </div>
                        </div>

                        <div class="col-md-6 w-50">
                            <div class="card text-bg-dark card-overlay-bottom card-grid-sm card-bg-scale">
                                <img src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/32E9/image/BA2Qyx3O2oTyEOsXe2ZtE8cRqGk.JPG" class="card-img" alt="...">
                                <div class="d-flex align-items-center">
                                    <h5 class="card-title">지도보기</h5>
                                  </div>
                              </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="position-relative pt-lg-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <a href="#" class="nav-link">
                        <h4 class="text-reset fw-bold border-dark pb-lg-2 border-bottom">자유게시판</h4>
                    </a>
                    <ul class="position-relative" style="list-style: none; padding: 0;">
                        <li class="row m-auto">
                            <a href="#" class="nav-link col-9">우리집 고양이 츄르를 좋아해[5]</a>
                            <span class="col-3 position-absolute end-0">작성자 | 11.15</span>
                        </li>
                        <li class="row m-auto">
                            <a href="#" class="nav-link col-9">우리집 고양이 츄르를 좋아해[5]</a>
                            <span class="col-3 position-absolute end-0">작성자 | 11.15</span>
                        </li>
                        <li class="row m-auto">
                            <a href="#" class="nav-link col-9">우리집 고양이 츄르를 좋아해[5]</a>
                            <span class="col-3 position-absolute end-0">작성자 | 11.15</span>
                        </li>
                        <li class="row m-auto">
                            <a href="#" class="nav-link col-9">우리집 고양이 츄르를 좋아해[5]</a>
                            <span class="col-3 position-absolute end-0">작성자 | 11.15</span>
                        </li>
                        <li class="row m-auto">
                            <a href="#" class="nav-link col-9">우리집 고양이 츄르를 좋아해[5]</a>
                            <span class="col-3 position-absolute end-0">작성자 | 11.15</span>
                        </li>
                        
                    </ul>
                </div>
                <div class="col">
                    <a href="#" class="nav-link">
                        <h4 class="text-reset fw-bold border-dark pb-lg-2 border-bottom">자유게시판</h4>
                    </a>
                    <ul style="list-style: none; padding: 0;">
                        <li>
                            <a href="#" class="nav-link">link1</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link2</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link3</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link4</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link5</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <a href="#" class="nav-link">
                        <h4 class="text-reset fw-bold border-dark pb-lg-2 border-bottom">자유게시판</h4>
                    </a>
                    <ul style="list-style: none; padding: 0;">
                        <li>
                            <a href="#" class="nav-link">link1</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link2</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link3</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link4</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link">link5</a>
                        </li>
                    </ul>
                </div>
                <div class="col"></div>
            </div>
        </div>
    </section>
</body>
</html>
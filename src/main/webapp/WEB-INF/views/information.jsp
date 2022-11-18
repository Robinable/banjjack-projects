<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd96e2bd690622227b096b7f52913f55&libraries=services"></script>
  <script src="/js/information.js"></script>

  <%@ include file="/WEB-INF/views/header.jsp" %>
  <title>주변 동물병원</title>



  <style>
    #mapwrap{position:relative;overflow:hidden;}
    .category, .category *{margin:0;padding:0;color:#000;}
    .category {position:absolute;overflow:hidden;top:10px;left:50px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
    .category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;}
    .category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;}
    .category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;}
    .ico_hospital {background: url('/img/free-icon-hospital-building-2749678.png') no-repeat; background-size: 100% 100%;}
    .ico_store {background: url('/img/free-icon-drugstore-4320357.png') no-repeat; background-size: 100% 100%;}
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .hAddr {position:absolute;right:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:999;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
  </style>
</head>
<body>

<div class="container">
  <div class="pt-3">
    <input id="map_input" type="text" class="w-100 justify-content-center" placeholder="원하시는 지역명을 입력하시고 엔터를 눌러주세요" onkeyup="if(window.event.keyCode==13){re_map();}">
  </div>
  <div class="pt-3">
    <div id="mapwrap" class="d-flex justify-content-center">
      <div id="map" style="width: 800px; height:450px;">

        <div class="category">
          <ul>
            <li id="hospitalMenu" onclick="changeMarker('hospital')">
              <div class="ico_comm ico_hospital"></div>
              병원
            </li>
            <li id="pharmacyMenu" onclick="changeMarker('pharmacy')">
              <div class="ico_comm ico_store"></div>
              약국
            </li>
          </ul>
        </div>

        <div class="hAddr">
          <span class="title">지도중심기준 행정동 주소정보</span>
          <span id="centerAddr"></span>
        </div>
      </div>
      
      <!-- 지도 위에 표시될 마커 카테고리 -->
      
    </div>
  </div>
  
</div>


<script>
    $.ajax({
url: '/js/mypetho.csv',
dataType: 'text',
}).done(function(e){
  $.ajax({
    url: '/js/mydd.csv',
    dataType: 'text',
  }).done(function(ee){
    create_map(e,ee);
  })
});
</script>
</body>
</html>
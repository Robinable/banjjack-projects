<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <style>
    .avatar-sm {
    height: 2.5rem;
    width: 2.5rem;
    }
    .avatar {
    height: 3rem;
    width: 3rem;
    position: relative;
    display: inline-block !important;
  }
  .avatar-img {
      width: 100%;
      height: 100%;
      -o-object-fit: cover;
      object-fit: cover;
  }

    .dropdown-li > .dropdown-item:hover { background-color: #add8e6; }

    .nav > .header-li:hover { background-color: #add8e6; }


  </style>
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- sockJS -->
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  <script>
  var socket  = null;
$(document).ready(function(){
    // 웹소켓 연결
    sock = new SockJS("http://localhost:8080/ws/");
    socket = sock;

    // 데이터를 전달 받았을때 
    sock.onmessage = onMessage; // toast 생성
});

// toast생성 및 추가
function onMessage(evt){
    var data = evt.data;
    console.log(data);
    pop_up('알림', data, '1분전');
};


  $.ajax({
      method: "get",
      url:  "/userprofileImg?username=${user.username}"
    })
      .done(function(data) {
          result = data;
          console.log('결과 = ' + result);
        if(result == ''){
          $('.avatar-img').attr("src", '/img/icon_unknownUser.png');
        }else{
            console.log($('.avatar-img'));
            $('.avatar-img').attr("src", 'http://donipop.com:8000/img/'+result);
        }
    })
      // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
      .fail(function() {
          $('.avatar-img rounded-circle shadow').attr("src", '/img/icon_unknownUser.png');
  });

</script>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="bootstrap" viewBox="0 0 118 94">
          <title>Bootstrap</title>
          <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
        </symbol>
        <symbol id="home" viewBox="0 0 16 16">
          <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
        </symbol>
        <symbol id="speedometer2" viewBox="0 0 16 16">
          <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"/>
          <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"/>
        </symbol>
        <symbol id="table" viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
        </symbol>
        <symbol id="people-circle" viewBox="0 0 16 16">
          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
          <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
        </symbol>
        <symbol id="grid" viewBox="0 0 16 16">
          <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
        </symbol>
        <symbol id="banjjak" viewBox="0 0 240.000000 240.000000">
            <g transform="translate(0.000000,240.000000) scale(0.100000,-0.100000)"
            fill="#000000" stroke="none">
            <path d="M605 2389 c-100 -58 -145 -171 -145 -362 0 -249 103 -453 252 -503
            100 -33 240 1 317 77 19 19 46 59 60 89 50 110 26 284 -61 427 -69 113 -167
            211 -257 255 -52 25 -137 34 -166 17z"/>
            <path d="M1555 2388 c-91 -33 -184 -131 -250 -263 -57 -113 -75 -186 -75 -295
            1 -186 92 -302 259 -331 112 -20 226 24 286 111 53 76 77 163 82 295 7 184
            -31 331 -109 420 -62 70 -120 89 -193 63z"/>
            <path d="M2107 1726 c-235 -97 -416 -416 -352 -620 47 -150 226 -240 376 -191
            105 35 200 167 245 340 25 98 26 281 1 353 -46 132 -138 172 -270 118z"/>
            <path d="M138 1690 c-83 -14 -126 -77 -135 -194 -15 -211 124 -489 284 -567
            69 -34 169 -33 238 3 174 91 215 285 99 469 -63 101 -201 218 -308 263 -52 22
            -132 33 -178 26z"/>
            <path d="M1109 1286 c-116 -45 -217 -120 -321 -240 -139 -161 -287 -414 -337
            -580 -26 -85 -27 -193 -4 -267 26 -80 109 -162 187 -184 93 -27 149 -17 342
            61 201 80 232 83 364 36 47 -17 130 -47 185 -66 159 -57 257 -48 345 31 130
            117 132 311 5 569 -141 286 -355 533 -533 617 -75 35 -176 45 -233 23z"/>
            </g>
        </symbol>
      </svg>
      
<!--  메뉴목록  -->
<div class="menubar">
    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
          <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#banjjak"></use></svg>
          </a>

          <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li class="header-li"><a href="/noticeList" class="nav-link px-2 link-secondary">새소식</a></li>
            <li class="header-li"><a href="/list?category=&num=1&menu_id=0" class="nav-link px-2 link-dark">반짝찾기</a></li>
            <li class="header-li"><a href="/communityList" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li class="header-li"><a href="/information" class="nav-link px-2 link-dark">정보</a></li>
            <li class="header-li"><a href="#" class="nav-link px-2 link-dark">고객센터</a></li>
          </ul>

          <div class="col-md-3 text-end">
            <div id="g-bell" class="btn d-inline-flex" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" style="border: none;">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                </svg>
                <span class="top-0 badge rounded-pill bg-danger">
                    99+
                </span>
            </div>

            <!-- 로그인 사용자한테 보이는 알람,아바타 -->
            <c:if test="${user != null}">
            <div class="d-inline-flex dropdown">
              <a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="true">
                <img class="avatar-img rounded-2" src="" alt="avatar">
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li class="px-3 mb-3">
                  <div class="d-flex align-items-center">
                    <div class="avatar me-3">
                      <img class="avatar-img rounded-circle shadow" src="/img/dog.jpeg" alt="avatar">
                    </div>

                    <div>
                      <a class="h6 mt-2 mt-sm-0 nav-link" href="#" style="">${user.usernickname}</a>
                      <p class="small m-0">${user.useremail}</p>
                    </div>
                  </div>
                </li>
                <li><hr class="dropdown-divider"></li>
                <li class="dropdown-li"><a class="dropdown-item" href="/myPageForm"><i class="me-2"></i>내정보</a></li>
                <li class="dropdown-li"><div type="button" class="dropdown-item" onclick="window.open('/receptNote?recept=', 'a', 'width=800, height=600, left=100, top=50');"><i class="me-2"></i>쪽지함</div></li>
                <li class="dropdown-li"><a class="dropdown-item" href="/logout"><i class="me-2"></i>로그아웃</a></li>
              </ul>
            </div>
            </c:if>
            <!-- 비로그인 사용자한테 보이는 로그인,회원가입 버튼 -->
            <c:if test="${user == null}">
            <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='/login'">로그인</button>
            <button type="button" class="btn btn-primary" onclick="location.href='/signup'">회원가입</button>
            </c:if>
          </div>
        </header>
        <!-- 오른쪽 사이드 알림창 -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
          <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasRightLabel">알람</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
          </div>
          <div class="offcanvas-body">

            <div class="list-group pb-2">
              <a href="#" class="list-group-item list-group-item-action shadow" aria-current="true">
                <div class="d-flex flex-column w-100 justify-content-between">
                  <h5 class="mb-0 d-inline-block">Doni Pop님 에게 쪽지가 왔어요!</h5>
                  <small class="d-inline-block">15분전</small>
                </div>
              </a>
            </div>

            <div class="list-group">
              <a href="#" class="list-group-item list-group-item-action shadow" aria-current="true">
                <div class="d-flex flex-column w-100 justify-content-between">
                  <h5 class="mb-0 d-inline-block">"고양이 츄르를 좋아해" 게시글에 댓글이 달렸어요!</h5>
                  <small class="d-inline-block">1일전</small>
                </div>
              </a>
            </div>

          </div>
        </div>
        <!-- 토스트 -->
        <!-- <button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button> -->

        <div class="toast-container position-fixed bottom-0 end-0 p-3">

        </div>


      </div>
</div>
<script>
   const toastTrigger = document.getElementById('liveToastBtn')
  if (toastTrigger) {
    toastTrigger.addEventListener('click', () => {
      // const toast = new bootstrap.Toast(toastLiveExample)
      // const toast1 = new bootstrap.Toast(toastLiveExample1)
      // toast1.show()
      // toast.show()
      
    })
  }

  function pop_up(title,content,time){
    let c = '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true"><div class="toast-header">'+
              '<svg class="bi me-2 round" width="16" height="16" role="img" aria-label="Bootstrap"><use xlink:href="#banjjak"></use></svg>'+
              '<strong class="me-auto">'+title+'</strong>'+
              '<small class="text-muted">'+time+'</small>'+
              '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>'+
            '</div> <div class="toast-body">'+content+'</div></div>'
    let toastlive = document.createElement('div')
    toastlive.innerHTML = c
    document.getElementsByClassName('toast-container')[0].appendChild(toastlive)
    let count = document.getElementsByClassName('toast').length;
    const t1 = document.getElementsByClassName('toast')[count-1];
    const toast = new bootstrap.Toast(t1)
    toast.show()
  }
</script>
</header>
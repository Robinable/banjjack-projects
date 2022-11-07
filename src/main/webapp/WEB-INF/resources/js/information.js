window.onload = function(){
    navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
}
function onGeoOk(position){
    const lat = position.coords.latitude; //경도
    const lng = position.coords.longitude;  //위도

    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
}
function onGeoError(){
    alert("위치정보 가져오기 실패");
}
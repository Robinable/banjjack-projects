var hospitalPositions = [
// new kakao.maps.LatLng(37.499590490909185, 127.0263723554437),
];

// 편의점 마커가 표시될 좌표 배열입니다
var pharmacyPositions = [
// new kakao.maps.LatLng(37.497535461505684, 127.02948149502778),
];
var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
let hoImageSrc = '/img/free-icon-hospital-building-2749678.png';
let phaImageSrc = '/img/free-icon-drugstore-4320357.png';
hospitalMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
pharmacyMarkers = []; // 편의점 마커 객체를 가지고 있을 배열입니다
let hodata = [],
phadata = [];
let cp = [];
let map;
let geocoder = new kakao.maps.services.Geocoder();

function create_map(hospitaldata, pharmacydata) {
    navigator.geolocation.getCurrentPosition((pos) => {
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
        center: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
        };
    map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
    hospitaldata = hospitaldata.split("\n");
    //hospitalPositions에 데이터 넣어주기 
    for(let i=1; i<hospitaldata.length; i++){
        let splitHospital = hospitaldata[i].split(',');
        hospitalPositions.push(new kakao.maps.LatLng(splitHospital[5], splitHospital[4]));
        hodata.push(hospitaldata[i]);
    }

    //pharmacyPositions에 데이터 넣어주기
    pharmacydata = pharmacydata.split("\n");
    for(let i=1; i<pharmacydata.length; i++){
        let splitPharmacy = pharmacydata[i].split(',');
        pharmacyPositions.push(new kakao.maps.LatLng(splitPharmacy[5], splitPharmacy[4]));
        phadata.push(pharmacydata[i]);
    }

    createHospitalMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
    createPharmacyMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다

    changeMarker('hospital'); // 지도에 커피숍 마커가 보이도록 설정합니다

    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    });
        
    
    
}

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}

// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;
}


// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다

function createHospitalMarkers() {
    hospitalPositions.forEach(function(data,index){
        // var imageSize = new kakao.maps.Size(64, 64)
        var imageSize = new kakao.maps.Size(22, 26),
                imageOptions = {
                spriteOrigin: new kakao.maps.Point(0, 0),
                // spriteSize: new kakao.maps.Size(36, 98)
                };

        var markerImage = createMarkerImage(hoImageSrc, imageSize, imageOptions);
        var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(data.Ma, data.La),
        image: markerImage,
        });

        let content0 = '<div class="wrap">' +
                '    <div class="info">' +
                '        <div class="title">' +
                '            ' + hodata[index].split(',')[0];
                // '            카카오 스페이스닷원' +
                // '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                
        let content1 = '        </div>' +
        '        <div class="body">' +
        '            <div class="img">' +
        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
        '           </div>' +
        '            <div class="desc">' +
        '                <div class="ellipsis">' + hodata[index].split(',')[1] + '</div>' +
        '                <div class="jibun ellipsis">' + hodata[index].split(',')[3] + '</div>' +
        '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
        '            </div>' +
        '        </div>' +
        '    </div>' +
        '</div>';

        let closeBtn = document.createElement('div');
        closeBtn.setAttribute('class', 'close');
        closeBtn.setAttribute('onclick', 'closeOverlay()');
        closeBtn.setAttribute('title', '닫기');
        closeBtn.onclick = () => {
            CustomOverlay.setMap(null);
        };

        let content = document.createElement('div');
        content.innerHTML = content0 + content1;
        content.querySelector('.title').appendChild(closeBtn);
        
        var CustomOverlay = new kakao.maps.CustomOverlay({
            content: content,
            position: marker.getPosition()
            });

        cp.push(CustomOverlay);

        hospitalMarkers.push(marker);

        // kakao.maps.event.addListener(marker, 'click', function() {
        //     if (clickedOverlay){
        //        clickedOverlay.setMap(null);
        //     }
        //     overlay.setMap(map);
        //     clickedOverlay = overlay;
        // });

        kakao.maps.event.addListener(marker, 'click', function() {
        CustomOverlay.setMap(map);
        });
    })
}

function closeOverlay(q) {
    for(let i=0; i<cp.length; i++){
        cp[i].setMap(null);
    }
}


// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function setHospitalMarkers(map) {
    for (var i = 0; i < hospitalMarkers.length; i++) {
        hospitalMarkers[i].setMap(map);
    }
}

// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
function createPharmacyMarkers() {
    pharmacyPositions.forEach(function(data,index){
        var imageSize = new kakao.maps.Size(22, 26),
                imageOptions = {
                spriteOrigin: new kakao.maps.Point(0, 0),
                // spriteSize: new kakao.maps.Size(36, 98)
                };

        var markerImage = createMarkerImage(phaImageSrc, imageSize, imageOptions);
        var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(data.Ma, data.La),
        image: markerImage,
        });

        let content0 = '<div class="wrap">' +
                '    <div class="info">' +
                '        <div class="title">' +
                '            ' + phadata[index].split(',')[0];
                // '            카카오 스페이스닷원' +
                // '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                
        let content1 = '        </div>' +
        '        <div class="body">' +
        '            <div class="img">' +
        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
        '           </div>' +
        '            <div class="desc">' +
        '                <div class="ellipsis">' + phadata[index].split(',')[1] + '</div>' +
        '                <div class="jibun ellipsis">' + '</div>' +
        '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
        '            </div>' +
        '        </div>' +
        '    </div>' +
        '</div>';

        let closeBtn = document.createElement('div');
        closeBtn.setAttribute('class', 'close');
        closeBtn.setAttribute('onclick', 'closeOverlay()');
        closeBtn.setAttribute('title', '닫기');
        closeBtn.onclick = () => {
            CustomOverlay.setMap(null);
        };

        let content = document.createElement('div');
        content.innerHTML = content0 + content1;
        content.querySelector('.title').appendChild(closeBtn);
        
        var CustomOverlay = new kakao.maps.CustomOverlay({
            content: content,
            position: marker.getPosition()
            });

        cp.push(CustomOverlay);

        pharmacyMarkers.push(marker);

        // kakao.maps.event.addListener(marker, 'click', function() {
        //     if (clickedOverlay){
        //        clickedOverlay.setMap(null);
        //     }
        //     overlay.setMap(map);
        //     clickedOverlay = overlay;
        // });

        kakao.maps.event.addListener(marker, 'click', function() {
        CustomOverlay.setMap(map);
        });
    })
}

// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
function setPharmacyMarkers(map) {
    for (var i = 0; i < pharmacyMarkers.length; i++) {
        pharmacyMarkers[i].setMap(map);
    }
}


// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){

    var hospitalMenu = document.getElementById('hospitalMenu');
    var pharmacyMenu = document.getElementById('pharmacyMenu');

    // 커피숍 카테고리가 클릭됐을 때
    if (type === 'hospital') {

        // 커피숍 카테고리를 선택된 스타일로 변경하고
        hospitalMenu.className = 'menu_selected';

        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        pharmacyMenu.className = '';

        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setHospitalMarkers(map);
        setPharmacyMarkers(null);

    } else if (type === 'pharmacy') { // 편의점 카테고리가 클릭됐을 때

        // 편의점 카테고리를 선택된 스타일로 변경하고
        hospitalMenu.className = '';
        pharmacyMenu.className = 'menu_selected';

        // 편의점 마커들만 지도에 표시하도록 설정합니다
        setHospitalMarkers(null);
        setPharmacyMarkers(map);

    }
}

function re_map(){
    let new_addr = document.getElementById('map_input');
    console.log(new_addr.value);

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(new_addr.value, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            map.setCenter(coords)
        }
    });
}
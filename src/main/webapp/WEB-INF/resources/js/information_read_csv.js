// var geocoder = new kakao.maps.services.Geocoder();
// let results = [];
// let my_datas = [];
// window.onload = function () {
//     //navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
    
//     // geocoder.addressSearch('대구광역시 동구 율하동 1117 롯데마트 4층 동물병원', callback);

//     // fi.forEach(function(e){
//     //     geocoder.addressSearch(e, callback);
//     // })

// }

// function read_csv(e){
//     let file = e.split("\n");

//     // let csv = file[0] + ",위도,경도\r\n";
//     for(let i = 1; i < file.length; i++){
//         let filesplit = file[i].split(",");
//         if (filesplit[1] != undefined && filesplit[1] != ""){
//             // let long = '위도' + i;
//             // let lat = '경도';
//             // console.log(filesplit[1]);
//             // csv += file[i] + "," + long + "," + lat + "\r\n";
            

//             let my_data = {
//                 //사업장명,소재지전체주소,소재지우편번호,소재지전화번호
//                 "사업장명" : "",
//                 "소재지전체주소" : "",
//                 "소재지우편번호" : "",
//                 "소재지전화번호" : "",
//                 "위도": "",
//                 "경도": ""
//             }
//             //사업장명,소재지전체주소,도로명전체주소,도로명우편번호,소재지우편번호,소재지전화번호,위도,경도
//             my_data["사업장명"] = filesplit[0];
//             my_data["소재지전체주소"] = filesplit[1];
//             my_data["소재지우편번호"] = filesplit[2];
//             my_data["소재지전화번호"] = filesplit[3];
            
//             my_datas.push(my_data);
//         }

//     }
//     console.log(my_datas);
//     let count = 0;
//     my_datas.forEach(function(e,index){
//         setTimeout(() => {
//             geocoder.addressSearch(e["소재지전체주소"], callback)
//             console.log(index);
//             count++;
//         }, 100 * index);
        
//     })

//     // console.log(csv);
// }
// function save_check(){
//     if(results.length==my_datas.length){
//         console.log("저장");
//         save_csv(results);
//     }
// }
// function save_csv(data){
//     console.log("save_csv");
    
//     let datas = "";
//     console.log("data lenght : " + data.length + " my_datas length : " + my_datas.length);
//     for(let i = 0; i < data.length; i++){
//         let count = i;
//         my_datas[count]["위도"] = data[i][0].x; //result[0].x;
//         my_datas[count]["경도"] = data[i][0].y; //result[0].y;
//         datas += my_datas[count]["사업장명"] + "," + my_datas[count]["소재지전체주소"] + "," + my_datas[count]["소재지우편번호"] + "," + my_datas[count]["소재지전화번호"] + "," + my_datas[count]["위도"] + "," + my_datas[count]["경도"] + "\r\n";
//         count++;
//     }
//     let file;
//     var sFileName = "dd3.csv";
//     var properties = {type: 'text/csv;charset=utf-8,'}; // Specify the file's mime-type.
//     try {
//     // Specify the filename using the File constructor, but ...
//     file = new File([datas], sFileName, properties);
//     } catch (e) {
//     // ... fall back to the Blob constructor if that isn't supported.
//     file = new Blob([datas], properties);
//     }
//     var url = URL.createObjectURL(file);
//     document.getElementById('link').href = url;
//     //geocoder.addressSearch('해남군 송지면', callback);

// }

// var callback = function(result, status) {
//     if (status === kakao.maps.services.Status.OK) {
//         results.push(result)
//         save_check();
//     }else{
//         let ho = [[{x:0,y:0}]];
//         results.push(ho)
//         console.log("error");
//         console.log(status);
//     }
// };
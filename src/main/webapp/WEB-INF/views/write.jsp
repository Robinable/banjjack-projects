<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
table {margin:100px auto;}
tr:nth-of-type(4) {text-align: right;}
li                {padding:3px}
li:nth-of-type(1) {width:90px; text-align: right;}
li:nth-of-type(2) {width:700px;}
textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}

</style>

</head>
<body>
<table>

  <li>제목 :</li>
  <li>
    <input type="text" maxLength="20">
  </li>



  <li>애완동물 :</li>
  <li>
    <select size="1">
	  <option value="">선택하세요.</option>
	  <option value="개">개</option>
	  <option value="고양이">고양이</option>
	  <option value="기타">기타</option>
	</select>
  </li>



  <li> </li>
  <li>
    <textarea maxLength="500" placeholder="내용을 입력하세요" ></textarea>
  </li>


  <li colspan="2">
    <a class="btn btn-primary">등록</a>
    <a class="btn btn-primary">수정</a>
    <a class="btn btn-primary">삭제</a>
  </li>

</table>

</body>
</html>
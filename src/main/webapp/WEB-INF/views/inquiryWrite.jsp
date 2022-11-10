<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>1대1 문의</title>
    <link rel="stylesheet" href="/css/message.css?aadfs">
 <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script>

    $(function(){

    	   $('form').on('submit', function(e){

              if( $('[name=content]').val() == ''){
                                alert('질문 내용을 입력하세요');

                  			  e.preventDefault();
                  			  e.stopPropagation();
                  		  }
    	 });

     });


    $(document).ready(function() {
        $('#test').on('keyup', function() {
            $('#test_cnt').html("("+$(this).val().length+" / 300)");

            if($(this).val().length > 300) {
                $(this).val($(this).val().substring(0, 300));
                $('#test_cnt').html("(300 / 300)");
                alert("300자 이내로 입력 가능")
            }

        });
    });


    </script>

</head>
<body>
    <section>
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title">1대1 문의</h3>

               <form action="/writeinquiry" method="post">
               <input type="hidden" name="send" value="1234">
                        <div id="write_msg">
                            <ul>
                                <li>
                                    <span class="col1"> 카테고리 </span>
                                    <span class="col2">
                                        <select id = "category" name="category">
                                            <option selected="selected">선택</option>
                                            <option value="1">아이디 정보/보안</option>
                                            <option value="2">이벤트</option>
                                            <option value="3">기타</option>
                                        </select></span>
                                </li>
                                 <li>
                                     <span class="col1">보내는 사람 : </span>
                                     <span class="col2" >1234</span>
                                 </li>

                                <li>
                                    <span class="col1">받는 사람 : </span>
                                    <span class="col2">관리자</span>
                                </li>

                                <li>
                                         <span class="col1">제목 : </span>
                                         <span class="col2"><input type="text" name="title"></span>
                                 </li>

                                <li id="textarea">
                                    <span class="col1">내용 : </span>
                                    <span class="col2"><textarea id="test" name="content"  placeholder="300자 이내로 입력 가능"></textarea><div id="test_cnt">(0 / 300)</div>
                                    </span>
                                </li>
                            </ul>
                            <input type="submit" value="보내기">
                            <li><a href='/inquirylistForm?num=1'>받은 1대1 문의함(관리자용)</a></li>
                        </div>
                </form>
            </div>

        </div>

    </section>

    <!-- <a href="/writeNoteForm" onClick="window.open(this.href, '', 'width=830, height=550'); return false;">쪽지쓰기</a> -->
</body>
</html>
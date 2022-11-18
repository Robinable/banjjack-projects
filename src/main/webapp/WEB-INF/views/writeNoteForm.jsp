<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>쪽지</title>
    <%--    <link rel="stylesheet" href="/css/message.css?aadfs">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <style>
        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none;margin-top: 10px;}

        #message_box .top_buttons{text-align: left; margin: 15px 0px;}
        input[type="text"]{width:70%; margin-bottom: 10px;}

    </style>

    <script>
        var cnt = 0;
        $(function(){
            $('#sub').on('click', function(e){
                if( $('[name=send]').val() == ''){
                    alert('아이디를 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }
                if( $('[name=recept]').val() == ''){
                    alert('받는사람을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }
                if( $('[name=content]').val() == ''){
                    alert('쪽지 내용을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }
            });

            $('#form').on('submit', function(e){
                cnt ++;
                alert("쪽지 보냄")
                if(cnt>1){
                    e.preventDefault();
                    e.stopPropagation();
                }
            })
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
        <h3 id="write_title">쪽지 보내기</h3>
        <div id="message_box">


            <ul class="top_buttons">
                <a class="btn btn-primary btn-sm" href="/receptNote?recept=${user.username}&num=1">받은 쪽지함</a>
                <a class="btn btn-primary btn-sm" href="/sendNote?send=${user.username}&num=1">보낸 쪽지함</a>
            </ul>


            <form id ="form" action="/writenote" method="post">
                <div id="write_msg" class="mb-3">
                    <ul>
                        <li>
                            <label for="exampleFormControlInput1" class="form-label">보내는 사람</label>
                            <input type="text" class="form-control" name="send" id="exampleFormControlInput1" value="${user.username}" readonly>
                        </li>
                        <li>
                            <label for="exampleFormControlInput2" class="form-label">받는 사람</label>
                            <input type="text" class="form-control" name="recept" id="exampleFormControlInput2" value="${reply}">
                        </li>

                        <li id="textarea">
                            <label for="test" class="form-label">내용</label>
                            <textarea class="form-control" name="content" id="test" rows="9" placeholder="300자 이내로 입력 가능" style="resize: none;"></textarea>
                            <div id="test_cnt">(0 / 300)</div>

                        </li>
                        <input class="btn btn-primary" type="submit" id="sub" value="보내기">
                    </ul>

                </div>
            </form>
        </div>

    </div>

</section>
<script type="text/javascript">
    const error = ${error};
    if (error == 1){
        msg = "받는사람의 아이디가 존재하지 않습니다. 다시 확인해 주세요";
    }

    alert(msg);
    let cc = document.getElementById("test");
    cc.value = "${content_value}";
    console.log("${content_value}");
</script>

<!-- <a href="/writeNoteForm" onClick="window.open(this.href, '', 'width=830, height=550'); return false;">쪽지쓰기</a> -->
</body>
</html>
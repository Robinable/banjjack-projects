<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
        rel="stylesheet">
            
        <style>
            div.commentListBox { width:600px; height: auto ;}
            div.commentBigBox { display: flex; padding-bottom: 20px;}
            div.commentIcon { float:left; width:50px; position : relative ;
                             margin-top: auto ; margin-bottom: auto; margin-left:1px ;
                             text-align: center;}
            div.commentBox { float:right; width:530px; }
            div.commentText { width:600px; display: flex ; flex-direction: column;}
            span.commentEditBtn { float:right; margin-right:2px; }
            span.commenlielBtn { float:right; margin-right:2px; }
            span.comWriter > input { width:100px ; border:none; font-weight: 600; font-size: large;} 
            div.commentText { width:540px; margin-top:2px;}
            div.commentInputBox{width:600px; margin-top:30px;}
            textarea { width:600px; resize:none; }
            div.regBtn { float:right;}
        </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   


    </head>
    <body> 
        <div class="commentCount"> 댓글 <span id = "count">0</span></div>
    <!--댓글 리스트 -->
        <div class="commentListBox">
            <div class="commentBigBox">
                <div class="commentIcon">
                    <span class="material-icons-outlined">
                        android
                    </span>
                </div>
                <div class="commentBox">
                    <span class="comWriter"> 
                            <input type="text" id="comWriter" placeholder= userId name="comWriter"> 
                    </span>
                        <!-- 버튼은 등록자 본인만 -->
                    <span class="commenlielBtn">
                        <button id="commenliel"> 삭제 </button>
                    </span>
                    <span class="commentEditBtn">
                        <button id="commentEdit"> 수정 </button>
                    </span>
                    <div class="commentText"> 내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.내용: 샘플입니다.
                        <br>
                    </div>
                </div>
            </div>
        </div>



        <!--댓글 입력부 -->

    <div class="commentInputBox">
        <textarea class="commentInput" id="comInput" cols="80" rows="3" name="comInput" ></textarea>
        <div class="countNum">
            ( 0/ 300)
        </div>
        <div class="regBtn">
            <button id="commentRegist"> 등록</button>
        </div>
    </div>


    <script>
        
        $('.commentInput').on('keyup', function() {
            $('.countNum').html("("+$(this).val().length+" / 300)");
 
            if($(this).val().length > 300) {
                $(this).val($(this).val().substring(0, 300));
                $('.countNum').html("(300 / 300)");
                alert("300자가 초과되었습니다")
                }
            });
        
    </script>

    </body>

</html>
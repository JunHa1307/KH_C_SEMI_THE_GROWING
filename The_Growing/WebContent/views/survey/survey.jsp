<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <div>
        <div>1.
            <div>
                기간 <input type="date" name="period"> ~ <input type="date" name="period2"><br>
                제목 <input type="text" name="sTitle" size="33" placeholder="질문 제목을 입력해주세요" required><br>
                내용 <input type="text" name="sContent" size="33" placeholder="질문 내용을 입력해주세요"><br>
                <input type="radio" name="sCheck"><input type="text" name="item_content" size="35" placeholder="항목 내용을 입력해주세요" required><br>
                <input type="radio" name="sCheck"><input type="text" name="item_content" size="35" placeholder="항목 내용을 입력해주세요" required><br>
                <input type="radio" name="sCheck"><input type="text" name="item_content" size="35" placeholder="항목 내용을 입력해주세요" required><br>
                <div id="empty"></div>
                <button onclick="item_plus();">항목 추가</button> 
                <script>
                    function item_plus(){
                        let empty = document.getElementById("empty");
                        empty.innerHTML+="  <input type='radio' name='sCheck'><input type='text' name='item_content' size='35' placeholder='항목 내용을 입력해주세요' required><br>"
                    }
                </script>
            </div>
        </div>
         <div>2.
            <div>
                기간 <input type="date" name="period"> ~ <input type="date" name="period2"><br>
                제목 <input type="text" name="sTitle" size="33" placeholder="질문 제목을 입력해주세요" required><br>
                내용 <input type="text" name="sContent" size="33" placeholder="질문 내용을 입력해주세요"><br>
            </div>
        </div>
        
             <div>2.
            <div>
                기간 <input type="date" name="period"> ~ <input type="date" name="period2"><br>
                제목 <input type="text" name="sTitle" size="33" placeholder="질문 제목을 입력해주세요" required><br>
                내용 <textarea placeholder="내용을 입력해주세요" style="resize:none;" rows="3" cols="30"></textarea>
            </div>
        </div>
        
         <div id="empty2"></div>
        <button onclick="q1_plus();">객관식 질문 추가</button> 
          <button onclick="q2_plus();">주관식 질문 추가</button>
                <script>
                    function q1_plus(){
                        let empty = document.getElementById("empty2");
                        empty2.innerHTML+=
                        ""
                    }
                </script>
    </div>
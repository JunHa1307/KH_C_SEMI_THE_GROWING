<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
<style>
  #survey_wrap{
    min-height: 800px;
    width: 60%;
    background-color: rgb(253, 253, 253);
    margin: auto;
    
  }
 

  .multiple{
    min-height: 380px;
    width: 700px;
    background-color: rgb(241, 253, 247);
    border-radius: 10px;
    border: 1px solid black;
    padding : 10px;
    margin: auto;
    margin-bottom: 20px;
  }
  
  .short{
    height: 230px;
    width: 700px;
    background-color: rgb(241, 253, 247);
    border-radius: 10px;
    border: 1px solid black;
    padding: 10px;
    margin: auto;
    margin-bottom: 20px;
    
  }
  
  #multiple_table td, #short_table td{
   height: 50px;
  }
  #multiple_table input, #short_table input,  #short_table textarea{
    padding: 8px;
  }
  #multiple_table, #short_table{
    margin: auto;
  }

  .item_plus{
   display: block;
    margin: auto;
  }
  #empty2{
    background-color: antiquewhite;
  }
  .m_plus, .s_plus{
  display: flex;
     margin: auto;
  }

 
</style>
</head>
<body>

        <div id="survey_wrap">
          <h1>설문조사</h1>
          <h2 style="text-align: center;">작성하기</h2>
            <div class="multiple">
             <table  border-collapse:collapse; id="multiple_table">
                <tr>
                  <td width="50">기간</td>
                  <td width="130"><input type="date" name="fDate"></td>
                  <td width="150" style="text-align: center;">~</td>
                  <td width="130"><input type="date" name="lDate"></td>
                </tr>
                <tr>
                  <td>제목</td>
                  <td colspan="3"><input type="text" name="sTitle" size="55" placeholder="질문 제목을 입력해주세요" required></td>
                </tr>
                <tr>
                  <td>내용</td>
                  <td colspan="3"><input type="text" name="sContent" size="55" placeholder="질문 내용을 입력해주세요"></td>
                </tr>
                <tr>
                  <td align="center"><input type="radio" name="sCheck"></td>
                  <td colspan="3"><input type="text" name="item_content" size="55" placeholder="항목 내용을 입력해주세요" required><br></td>
                </tr>
                <tr>
                  <td align="center"><input type="radio" name="sCheck"></td>
                  <td colspan="3"><input type="text" name="item_content" size="55" placeholder="항목 내용을 입력해주세요" required><br></td>
                </tr>
                <tr id="a" >
                  <td align="center"><input type="radio" name="sCheck"></td>
                  <td colspan="3"><input type="text" name="item_content" size="55" placeholder="항목 내용을 입력해주세요" required><br></td>
                </tr>
               
              </table>
                <button class="item_plus">항목 추가</button> 
                <script>
                    $(function(){
                      $(".item_plus").click(function(){
                        let item = "<tr >"+
                  "<td align='center'><input type='radio' name='sCheck'></td>"+
                  "<td colspan='3'><input type='text' name='item_content' size='55' placeholder='항목 내용을 입력해주세요' required><br></td>"+
                "</tr>"
                      $("#multiple_table>tbody>tr:last").after(item);

                      })
                    })
                </script>
        
           </div>
   
        
  
            <div class="short">
              <table  border-collapse:collapse; id="short_table">
                <tr>
                  <td width="50">기간</td>
                  <td width="130"><input type="date" name="fDate"></td>
                  <td width="150" style="text-align: center;">~</td>
                  <td width="130"><input type="date" name="lDate"></td>
                </tr>
                <tr>
                  <td>제목</td>
                  <td colspan="3"><input type="text" name="sTitle" size="55" placeholder="질문 제목을 입력해주세요" required></td>
                </tr>
                <tr>
                  <td>내용</td>
                  <td colspan="3"><textarea type="text" name="sContent"  style="resize:none;" rows="3" cols="57" placeholder="질문 내용을 입력해주세요"></textarea></td>
                </tr>
                </table>
            </div>
    
     
        <div class="empty2"></div>
        
        <button type="button" class="m_plus">객관식 질문 추가</button> 
        <button type="button"class="s_plus">주관식 질문 추가</button>
      

        
                <script>
                    $(function (){
                      $(".m_plus").click(function(){
                        $(".empty2").append($(this).siblings(".multiple").clone(true));
                      });
                      $(".s_plus").click(function(){
                        $(".empty2").append($(this).siblings(".short").clone(true));
                      });
                    })
                </script>
    </div>
  </body>
  </html>
  
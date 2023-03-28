<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!--부트스트랩 알림을 위한 css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- 부트스트랩 게시판 목록을 위한 css -->

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
  /* 버튼 css */
.box {
      display: flex;
      background: #ffffff;
      color: #000000;
      width: 150px;
      height: 50px;
      border-radius: 30px;
    }
    .button_UI {
      float: left;
      width: 150px;
      height: 50px;
      display: block;
      border: none;
      background: none; 
      color: inherit;
      position: relative;
      z-index: 1;
      -webkit-backface-visibility: hidden;
      -moz-osx-font-smoothing: grayscale;
      border-radius: 30px;
      border: 3px solid;
    }
    .button_UI :active{
     color :rgb(137, 180, 166);
    }
    .button_UI:focus {
      outline: none;
    }
    
    .button--winona {
      overflow: hidden;
      padding: 0;
      -webkit-transition: border-color 0.3s, background-color 0.3s;
      transition: border-color 0.3s, background-color 0.3s;
      -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
      transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
    }
    .button--winona::after {
      content: attr(data-text);
      position: absolute;
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      opacity: 0;
      color: rgb(137, 180, 166);
      font-weight: 600;
      -webkit-transform: translate3d(0, 25%, 0);
      transform: translate3d(0, 25%, 0);
    }
    .button--winona::after,
    .button--winona > span {
      padding: 10px;
      -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
      transition: transform 0.3s, opacity 0.3s;
      -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
      transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
      display: block;
      font-weight: 600;
    }
    .button--winona:hover {
      border-color: rgb(137, 180, 166);
      background-color: rgba(255, 255, 255, 0.1);
    }
    
    .button--winona:hover::after {
      opacity: 1;
      -webkit-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
    }
    .button--winona:hover > span {
      opacity: 0;
      -webkit-transform: translate3d(0, -25%, 0);
      transform: translate3d(0, -25%, 0);
    }
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
    padding-bottom : 60px;
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

  #button_align,#bu_align{
    border : 1px red solid;
    width: 350px;
    margin: auto;
    
  }
  #button_align>button, #bu_align>button{
  	margin-right:10px;
  }

  *{
        
        font-family: 'Gowun Dodum', sans-serif;
        
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
              <div id="button_align"> 
                <button class="item_plus button_UI button--winona" data-text="항목 추가">항목 추가</button> 
                <button class="item_minus button_UI button--winona" data-text="항목 삭제">항목 삭제</button> 
              </div>
                <script>
                    $(function(){ 
                      $(".item_plus").click(function(){
                        let item = "<tr >"+
                  "<td align='center'><input type='radio' name='sCheck'></td>"+
                  "<td colspan='3'><input type='text' name='item_content' size='55' placeholder='항목 내용을 입력해주세요' required><br></td>"+
                "</tr>"
                $(this).parents('div').siblings('table').find("tr:last").after(item);

                      })

                      $(".item_minus").click(function(){
                       if( $(this).parents('div').siblings('table').find("input[name=sCheck]").length > 2){
                        $(this).parents('div').siblings('table').find("tr:last").remove();
                       }
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
                  <td colspan="3"><textarea type="text" name="sContent"  style="resize:none;" rows="3" cols="56.5" placeholder="질문 내용을 입력해주세요"></textarea></td>
                </tr>
                </table>
            </div>
    
     
        <div class="empty2"></div>
        
        <div id="bu_align">
        <button type="button" class="m_plus button_UI button--winona" data-text="객관식 질문 추가">객관식 질문 추가</button> 
        <button type="button"class="s_plus button_UI button--winona" data-text="주관식 질문 추가">주관식 질문 추가</button>
      </div>

        
                <script>
                    $(function (){
                      $(".m_plus").click(function(){
                        $(".empty2").append($(this).parents('div').siblings(".multiple").clone(true));
                      });
                      $(".s_plus").click(function(){
                        $(".empty2").append($(this).parents('div').siblings(".short").clone(true));
                      });
                    })
                </script>
    </div>
  </body>
  </html>
  
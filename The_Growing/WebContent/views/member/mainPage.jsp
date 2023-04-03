<%@page import="com.kh.member.model.vo.SnsLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="com.kh.classes.model.vo.Class , java.util.ArrayList, com.kh.member.model.vo.Member"%>
<%
   String contextPath = request.getContextPath();
   ArrayList<Class> list = (ArrayList<Class>) request.getAttribute("list");
   ArrayList<String> tableList = (ArrayList<String>) request.getAttribute("tableList");
   ArrayList<String> calendarList = (ArrayList<String>) request.getAttribute("calendarList");
   Member loginUser = (Member) session.getAttribute("loginUser");
   SnsLogin snsLoginUser = (SnsLogin) session.getAttribute("snsLoginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TheGrowing</title>
<link rel="stylesheet"
   href="<%= contextPath %>/resources/css/mainPage.css">

<style>
@media only screen and (min-width: 780px) {
   .other-info {
      font-size: 0.8vw;
   }
   .other-info h3 {
      font-size: 1.6vw;
   }
}

@media only screen and (max-width: 780px) {
   .other-info {
      font-size: 2vw;
   }
}
</style>

</head>
<body>
   <%@ include file="/views/common/header.jsp"%>
	<main class="contentBox">
		<!-- 상단컨텐츠 -->
		<section class="myInfo">
			<div class="myProfile">
				<div class="myProfile-img">
				<% try{
				    if(loginUser.getFilePath() == null){
				    	String filePath = snsLoginUser.getFilePath();
						loginUser.setFilePath(filePath);
				    } %>
				    <img
						src="<%= loginUser.getFilePath() %>"
						alt=""
						onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">  
				<% }catch(NullPointerException e){ %>
				    <img src="<%= contextPath%>/resources/image/noImage.png">
				    
				<% } %>
				
				</div>
				<span class="myProfile-name"> <%= loginUser.getUserName() + " " + ( loginUser.getUserLevel() == 1 ? "선생님" : loginUser.getUserLevel() == 2 ? "부모님" : "학생") %>
				</span>
				<button class="button_UI button--winona" data-text="마이페이지">
					<span>마이페이지</span>
				</button>
				<% try{
					System.out.println(snsLoginUser.getSnsType());
					if(snsLoginUser.getSnsType() == "1"){ %>
						<button type="button" onclick="kakaoLogout();"
							class="button_UI button--winona" data-text="로그아웃">
							<a href="javascript:void(0)">
								<span>로그아웃</span>
							</a>
						</button>
				<% } else if(snsLoginUser.getSnsType() == "3"){ %>
						<button onclick="googleLogout();"
							class="button_UI button--winona" data-text="로그아웃">
							<span>로그아웃</span>
						</button>
				<% } else { %>
					<button onclick="location.href='logout.me'"
						class="button_UI button--winona" data-text="로그아웃">
						<span>로그아웃</span>
					</button>
				<% }} catch(NullPointerException e) {%>
					<button onclick="location.href='logout.me'"
						class="button_UI button--winona" data-text="로그아웃">
						<span>로그아웃</span>
					</button>
				<% } %>
			</div>
			<section class="myClass">
				<div class="myClass-info">
					<% if(list.size() != 0){ %>
						<% for(int i = 0; i < list.size();i++){ %>
							<div id="class<%= i %>" class="myClass-list">
								<div class="myClass-img" onclick="moveToBoard();">
									<img
										src="<%= contextPath +list.get(i).getFilePath()+list.get(i).getChangeName() %>"
										alt="클래스 프로필"
										onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
								</div>
								<div class="myClass-text-list">
									<div class="myClass-text"><h6><%= list.get(i).getClassTypeName()%><%=" "+ (list.get(i).getClassGrade()+"").substring(5) %>학년<br><%= list.get(i).getClassName() %></h6></div>
									<div class="myClass-text">
										가입자 수 :
										<%= list.get(i).getUserCount()%>명
									</div>
									<%-- vvv 이 div는 줄바꿈하면 안됨 vvv--%>
									<div class="myClass-text"><%= list.get(i).getTeacherName()%> 선생님</div>
								</div>
							</div>
						<% } %>
					<% } else { %>
						<div id="class0" class="myClass-list" onclick="moveToBoard();">
							<div class="myClass-img">
								<img src="" alt="클래스 프로필"
									onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
							</div>
							<div class="myClass-text-list">
								<div class="myClass-text">가입된 클래스가 없습니다.</div>
							</div>
						</div>
					<% } %>
				</div>
				<nav class="myClass-btn"
					style="background-image: url('<%= contextPath %>/resources/image/houses-fill.svg');">
					<img src="<%= contextPath %>/resources/image/houses-fill.svg"
						alt="클래스 더보기" width="0" height="90%"> <span>클래스<br>더보기
					</span>
				</nav>
				<%if( loginUser.getUserLevel() == 1) {%>
					<div class="myClass-btn" data-toggle="modal"
						data-target="#newClassModal"
						style="background-image: url('<%= contextPath %>/resources/image/house-add-fill.svg');">
						<img src="<%= contextPath %>/resources/image/house-add-fill.svg"
							alt="새 클래스 만들기" width="0" height="90%"> <span>새 클래스<br>만들기
						</span>
					</div>
				<%} else { %>
					<nav class="myClass-btn" onclick="ClassSearch(구현안됨);"
						style="background-image: url('<%= contextPath %>/resources/image/house-add-fill.svg');">
						<img src="<%= contextPath %>/resources/image/house-add-fill.svg"
							alt=" 클래스 찾기" width="0" height="90%"> <span>클래스<br>찾기
						</span>
					</nav>
				<% } %>
				<div class="myClass-btn" data-toggle="modal"
					data-target="#classCode"
					style="background-image: url('<%= contextPath %>/resources/image/door-open-fill.svg');">
					<img src="<%= contextPath %>/resources/image/door-open-fill.svg"
						alt="초대코드로 가입하기" width="0" height="90%"> <span>초대코드로<br>가입
					</span>
				</div>
			</section>
		</section>

		<section class="today-date">
			오늘은 <b>2023년 03월 23일 목요일</b> 이에요! 행복한 하루 되세요~
		</section>

		<!-- 하단 컨텐츠 -->
		<section class="other-info">
			<!-- 급식표 -->
			<div class="lunch"></div>
			<div class="timeTable">
				<h3>시간표</h3>
				<div>
					<div id="time-table" style="border-radius: 10px;"></div>
				</div>
				<div class="table-btn">
					<button type="button" class="button_UI button--winona"
						data-text="업데이트" onclick="tableUpdate();">업데이트</button>
					<button type="button" class="button_UI button--winona"
						data-text="행 추가" onclick="insertRow();">행 추가</button>
				</div>
			</div>
			<!-- 캘린더 -->
			<div id='calendar-container' class="schedule">
				<div id='calendar'></div>
				<div class="table-btn">
					<button id="calendar-button" type="button" class="button_UI button--winona"
							data-text="업데이트">업데이트</button>
				</div>
			</div>
		</section>

      <!-- modal-wrap -->
      <div>
         <!-- 새 클래스 만들기 모달창 -->
         <div id="newClassModal" class="modal fade" id="registerModal"
            tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
               <div class="modal-content">
                  <div class="modal-header">
                     <h1 style="font-weight: 700;">새 클래스 만들기</h1>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>

                  <form action="classEnrollForm.c" method="post"
                     enctype="multipart/form-data" id="classEnrollForm">
                     <div class="modal-body">
                        <div class="title">
                           <h2>학교</h2>
                        </div>

                        <div class="title_box">
                           <input class="school_search" type="text" name="classTypeName"
                              placeholder="내용을 입력해주세요">
                        </div>

                        <div class="info">
                           <h2>연도</h2>
                           <h2>학년</h2>
                           <h2 class="class_name1">클래스 이름</h2>
                           <h2 class="class_name1">선생님 이름</h2>
                        </div>

                        <div class="info_box">
                           <input class="year" type="number" name="classYear" min="2010"
                              max="2099" step="1" value="2023"> <input class="grade"
                              type="number" name="classGrade" min="1" max="6" step="1"
                              value="1"> <input class="class_name2" type="text"
                              name="className" placeholder="학교이름을 입력해주세요"> <input
                              class="class_name2" type="text" name="teacherName"
                              placeholder="선생님 이름을 입력하세요">
                        </div>
                        <div class="info">
                           <h2>관할 교육청</h2>
                        </div>
                        <div class="info_box">
                           <select name="atCode" form="classEnrollForm">
                              <option value="Z00">없음</option>
                              <option value="B10">서울특별시교육청</option>
                              <option value="C10">부산광역시교육청</option>
                              <option value="D10">대구광역시교육청</option>
                              <option value="E10">인천광역시교육청</option>
                              <option value="F10">광주광역시교육청</option>
                              <option value="G10">대전광역시교육청</option>
                              <option value="H10">울산광역시교육청</option>
                              <option value="I10">세종특별자치시교육청</option>
                              <option value="J10">경기도교육청</option>
                              <option value="K10">강원도교육청</option>
                              <option value="M10">충청북도교육청</option>
                              <option value="N10">충청남도교육청</option>
                              <option value="P10">전라북도교육청</option>
                              <option value="Q10">전라남도교육청</option>
                              <option value="R10">경상북도교육청</option>
                              <option value="S10">경상남도교육청</option>
                              <option value="T10">제주특별자치도교육청</option>
                              <option value="V10">재외한국학교교육청</option>
                           </select>
                        </div>
                        <h2>대표 이미지 설정</h2>
                        <div class="profile_img_area">
                           <img class="prof_img" src=""
                              onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
                        </div>
                        <div id="file-area" style="display: none;">
                           <input type="file" id="classProfile" name="upfile"
                              onchange="loadImg(this);">
                        </div>
                        <div class="box_1" style="margin-bottom: 0;">
                           <div class="box">
                              <button type="button"
                                 class="button_UI button--winona fileUpdate" data-text="수정">
                                 <span>수정</span>
                              </button>
                           </div>
                           <div class="box">
                              <button type="button"
                                 class="button_UI button--winona fileDelete" data-text="삭제">
                                 <span>삭제</span>
                              </button>
                           </div>
                        </div>
                     </div>

                     <div class="modal-footer">
                        <div class="box">
                           <button class="button_UI button--winona" data-dismiss="modal"
                              data-text="취소">
                              <span>취소</span>
                           </button>
                        </div>
                        <div class="box">
                           <button type="submit" id="btn_register"
                              class="button_UI button--winona" data-text="완료">
                              <span>완료</span>
                           </button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         <!-- 시간표 테이블 모달창 -->
         <div id="tableModal" class="modal fade" id="registerModal"
            tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="modalLabel"></h5>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <div id="time-table1" style="border-radius: 10px;"></div>
                  </div>

                  <div class="modal-footer">
                     <button type="button" id="btn_register" class="btn btn-primary"
                        data-dismiss="modal">닫기</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- 초대코드로 가입 모달창 -->
         <div id="classCode" class="modal fade" id="registerModal"
            tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
                  <form action="classEnrollForm.c" method="get">
                     <div class="modal-body">
                        <h3 style="display: inline-block; font-weight: 700;">초대코드로
                           가입하기</h3>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                        <h5>선생님께 전달받은 초대 코드를 입력하세요.</h5>
                        <input type="tel" maxlength="1" name="code0" class="codeItem">
                        <input type="tel" maxlength="1" name="code1" class="codeItem">
                        <input type="tel" maxlength="1" name="code2" class="codeItem">
                        <input type="tel" maxlength="1" name="code3" class="codeItem">
                        <input type="tel" maxlength="1" name="code4" class="codeItem">
                        <input type="tel" maxlength="1" name="code5" class="codeItem">
                     </div>

                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                           data-dismiss="modal">취소</button>
                        <button type="submit" id="btn_register" class="btn btn-primary">확인</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>


	</main>
	<script src="<%= contextPath %>/resources/js/calendar.js"></script>
	<script src="<%= contextPath %>/resources/js/logout.js"></script>
	<script>
      $(function () {
        $(".myClass-info").slick({ // 슬라이드 만들기
          slide: "div", //슬라이드 되어야 할 태그 ex) div, li
          infinite: true, //무한 반복 옵션
          slidesToShow: 1, // 한 화면에 보여질 컨텐츠 개수
          slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
          speed: 100, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
          arrows: true, // 옆으로 이동하는 화살표 표시 여부
          dots: false, // 스크롤바 아래 점으로 페이지네이션 여부
          autoplay: false, // 자동 스크롤 사용 여부
          pauseOnHover: true, // 슬라이드 이동 시 마우스 호버하면 슬라이더 멈추게 설정
          vertical: false, // 세로 방향 슬라이드 옵션
          prevArrow:
            "<button type='button' class='slick-prev'>이전</button>", // 이전 화살표 모양 설정
          nextArrow: "<button type='button' class='slick-next'>다음</button>", // 다음 화살표 모양 설정
          draggable: true, //드래그 가능 여부
        });
         $(".slick-prev,.slick-next").css("height","40%").css("background-color","#209dce").css("border-radius","2vw");
      });
    </script>
   <script>
       let index = 0;
       let atptCodeArr = [];
       let schulCodeArr = [];
       let classList = []; 
       
       // 보여줄 클래스 클래스 수에 따라  변경
       <% for(int i = 0; i < list.size(); i++){%>
          atptCodeArr.push("<%= list.get(i).getAtptOfcdcScCode()%>");
          schulCodeArr.push("<%= list.get(i).getSdSchulCode()%>");
         classList.push("<%= list.get(i).getClassNo()%>");
         
       <%}%>
       
       // 오늘 날짜 생성 (moment.js 라는 날라이브러리도있음 참고)
       function getToday(){
           var date = new Date();
           var year = date.getFullYear();
           var month = ("0" + (1 + date.getMonth())).slice(-2);
           var day = ("0" + date.getDate()).slice(-2);
	        return year + month + day;
	    }
	    
	    let week = ['일', '월', '화', '수', '목', '금', '토']; // 날짜 년월일 만들기
    	let today = getToday();
	    let todayYear = today.substring(0,4);
	    let todayMonth = today.substring(4,6);
	    let todayDay = today.substring(6,8);
	    $(".today-date>b").text(todayYear + "년 " + todayMonth + "월 " + todayDay + "일 " + week[new Date(todayYear+"-"+todayMonth+"-"+todayDay).getDay()]+"요일");
	    
	 	// 캘린더 생성
       	let cData = <%= calendarList %>;
        calendar(cData[index],"<%= contextPath %>",classList[index]);
	    
	    // 급식표 생성
	    function lunch(atptCode,schulCode,day){
	    	$.ajax({	    				
	    		url : "https://open.neis.go.kr/hub/mealServiceDietInfo?Type=jsonp&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=" + atptCode + "&SD_SCHUL_CODE="+ schulCode +"&MLSV_YMD="+day,
	    		method : 'GET',
	    		contentType:'application/json;charset=utf-8',
	    		dataType:'jsonp',
	    		
	    		success:function(result){
	    			if(typeof result.mealServiceDietInfo != "undefined"){
		    			$(".lunch").html("<h3>오늘의 급식표</h3><br>"+result.mealServiceDietInfo[1].row[0].DDISH_NM+
		    					"<br><br> <span style='font-size:0.6vw;'>* 요리명에 표시된 번호는 알레르기를 유발할수 있는 식재료입니다<br><br>"+
		    					"(1.난류, 2.우유, 3.메밀, 4.땅콩, 5.대두, 6.밀, 7.고등어, 8.게, 9.새우,<br> 10.돼지고기, 11.복숭아, 12.토마토, 13.아황산염, 14.호두, 15.닭고기, 16.쇠고기, 17.오징어, 18.조개류(굴,전복,홍합 등)</span>")
	    			}else{
	    				$(".lunch").html("<h3>내용이 없습니다</h3>" + result.RESULT.MESSAGE);
	    			}
	    		},
	    		error:function(error,status,msg){
	    			alert("상태코드 " + status + "에러메시지" + msg );
	    		}
	    	});
	    }
	    lunch(atptCodeArr[index],schulCodeArr[index],today);
	    
	    // 클래스 슬라이드 변화시 이벤트
	    $(".myClass-info").on('afterChange', function(event, slick, direction){
	    	index = $(".slick-current>div>div").attr("id").substr(5);
	    	lunch(atptCodeArr[index],schulCodeArr[index],today);
	    	calendar(cData[index].,"<%= contextPath %>",classList[index]);
		    table.clearData();
		    table.updateOrAddData(tabledata[index]);
	    });
	    
	    // 클래스 이미지 클릭 시 클래스 게시판으로 이동
	    function moveToBoard(){
	    	
	    	let cno = classList[index];
	    	
	    	location.href="<%=contextPath%>/boardmove.bo?cno="+ cno;
	    }
	    
    </script>
	<script>
    	// 클래스별 테이블 데이터 배열
		let tabledata = <%= tableList %>;
		
		// 테이블 수정 권한 부여

        let editCheck = function(cell){ 
         
            let isTeacher = false;
            let teacherName = $(".slick-current>div>div .myClass-text").eq(2).text();
            let name = $(".myProfile-name").text().trim();
            
            
            <% if(loginUser.getUserLevel() == 1){ %>
               if(name == teacherName){
                  isTeacher = true;
               }
            <% } %> 
            
            return isTeacher;
        }
      
      // 테이블 생성
        let table = new Tabulator("#time-table", { 
            height: "100%", // 높이 지정(css 높이 가능)
            data: tabledata[index], // 테이블 데이터 설정
            layout: "fitDataFill", // 데이터에 맞춰서 보이기(보이는 방식 설정)
            columns: [ // 테이블 열 설정( 선생님일때 포매터 : editor <- 수정 , 아닐 때 : textarea <- 조회)
            	{formatter:"buttonCross", title:"삭제", headerSort:false, cellClick:function(e, cell){ // 행 삭제 버튼 열
    		  		if(confirm('정말 이 행을 삭제하시겠습니까?'))
    		    		  cell.getRow().delete();
	  				}
            	},
                { title: "제목", field: "name", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "월요일", field: "mon", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "화요일", field: "tue", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "수요일", field: "wed", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "목요일", field: "thur", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "금요일", field: "fri", editor:"input", editable:editCheck, variableHeight: true, headerSort: false }    
            ],
        });

    	 // 테이블 업데이트 db저장

        function tableUpdate() {
           let arr = new Array();
            for (let i = 0; i < $(".tabulator-row").length; i++) {
              let obj = new Object();
                let cell = $(".tabulator-row").eq(i).children(".tabulator-cell");
                obj.name= cell.eq(1).text().trim();
                obj.mon = cell.eq(2).text().trim();
                obj.tue = cell.eq(3).text().trim();
                obj.wed = cell.eq(4).text().trim();
                obj.thur= cell.eq(5).text().trim();
                obj.fri = cell.eq(6).text().trim();
                arr.push(obj);
            }
            arr = JSON.stringify(arr); // JSON 배열로 만들어서 데이터 보내기
            
            $.ajax({
             url : "<%= contextPath %>/tableUpdate.c",
             method : 'POST',
             data : {arr:arr , cno : classList[index]},       
             dataType : 'text',
             success:function(result){
                if(result != 'Fail'){
                   
                      alert("수정되었습니다");
                      location.reload();
                }else{
                   alert("수정 실패");
                }
             },
             error:function(error,status,msg){
                alert("상태코드 " + status + "에러메시지" + msg );
             }
          });
        };
        
        // 테이블행 추가
        function insertRow(){
	        table.addRow({name: "", mon: "", tue: "", wed: "", thur: "", fri: ""}, true)
	        .then(function(row){
	           row.getCell("name").edit();
	        });
	    };
	    
	 	// 테이블 행 더블클릭 시 뷰 모달창
	    table.on("rowDblClick", function(e, row){
	    	$("#time-table1").html(document.getElementById('time-table').cloneNode(true));
	    	$('#tableModal').modal("show");
		});
	 	
	    <% if( loginUser.getUserLevel() != 1) {%>
	    	$(".table-btn").css("display","none");
	    <% } %>
	    
    </script>
    <script>
		//버튼 UI 애니메이션
        $('.button_UI').on('click', function () {
            $(this).css('color', 'rgb(137, 180, 166)');
            $(this).siblings(".button_UI").css('color', "black");
        });
        
		// 새 클래스 만들기 파일 선택
		$(".prof_img, .fileUpdate").on('click',function(){
			$("#classProfile").click();
		});
		
		// 새 클래스 만들기 파일 삭제
		$(".fileDelete").on('click',function(){
			$(".prof_img").attr("src", "<%= contextPath %>/resources/image/noImage.png");
		    $("#classProfile").val("");
		});
		
		// 새 클래스 만들기 이미지 미리보기 && 파일 업로드
		function loadImg(inputFile){
					
					if(inputFile.files.length != 0){
						
						let reader = new FileReader();
						
						reader.readAsDataURL(inputFile.files[0]);
						
						reader.onload = function(e){
							
							let url = e.target.result;
							
							$(".prof_img").attr("src",url);
						}	
				
					}else {
						
						$(".prof_img").removeAttr("src");
					}
				}

    </script>
</body>
</html>
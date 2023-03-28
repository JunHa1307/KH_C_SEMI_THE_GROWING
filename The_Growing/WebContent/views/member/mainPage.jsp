<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.classes.model.vo.Class , java.util.ArrayList, com.kh.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	ArrayList<Class> list = (ArrayList<Class>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
%>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TheGrowing</title>
<link rel="stylesheet" href="<%= contextPath %>/resources/css/mainPage.css">

<style>
	@media only screen and (min-width: 780px) {
		.other-info{
			font-size:0.8vw;
		}
		.other-info h3{
			font-size:1.6vw;
		}
	}
	@media only screen and (max-width: 780px) {
		.other-info{
			font-size:2vw;
		}
	}
</style>

</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
		<div class="contentBox">
			<!-- 상단컨텐츠 -->
			<div class="myInfo">
				<div class="myProfile">
					<div class="myProfile-img">
						<img src="<%= contextPath+loginUser.getFilePath()+loginUser.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
					</div>
					<span class="myProfile-name">
						<%= loginUser.getUserName() + " " + ( loginUser.getUserLevel() == 1 ? "선생님" : loginUser.getUserLevel() == 2 ? "부모님" : "학생") %>
					</span>
					<button class="button_UI button--winona" data-text="마이페이지">
						<span>마이페이지</span>
					</button>
					<button onclick="location.href='logout.me'" class="button_UI button--winona" data-text="로그아웃">
						<span>로그아웃</span>
					</button>
				</div>
				<div class="myClass">
					<div class="myClass-info">
					<% if(list.size() != 0){ %>
						<% for(int i = 0; i < list.size();i++){ %>
							<div  id="class<%= i %>" class="myClass-list">
								<div class="myClass-img" onclick="moveToBoard();">
									<img src="<%= contextPath +list.get(i).getFilePath()+list.get(i).getChangeName() %>" alt="클래스 프로필" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
								</div>							
								<div class="myClass-text-list">
									<div class="myClass-text"><%= list.get(i).getClassTypeName()%><%=" "+ (list.get(i).getClassGrade()+"").substring(4) %>학년<br><%= list.get(i).getClassName() %></div>
									<div class="myClass-text">가입자 수 : <%= list.get(i).getUserCount()%>명</div>
									<div class="myClass-text"><%= list.get(i).getTeacherName()%> 선생님</div>
								</div>
							</div>		
						<% } %>
					<% } else { %>
						<div  id="class0" class="myClass-list" onclick="moveToBoard();">
								<div class="myClass-img">
									<img src="" alt="클래스 프로필" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
								</div>							
								<div class="myClass-text-list">
									<div class="myClass-text">가입된 클래스가 없습니다.</div>
								</div>
							</div>		
					<% } %>
					</div>
					<div class="myClass-btn" style="background-image: url('<%= contextPath %>/resources/image/houses-fill.svg');">
						<img src="<%= contextPath %>/resources/image/houses-fill.svg" alt="클래스 더보기" width="0" height="90%"> 
						<span>클래스<br>더보기</span>
					</div>
					<%if( loginUser.getUserLevel() == 1) {%>
						<div class="myClass-btn" data-toggle="modal" data-target="#newClassModal" style="background-image: url('<%= contextPath %>/resources/image/house-add-fill.svg');">
							<img src="<%= contextPath %>/resources/image/house-add-fill.svg" alt="새 클래스 만들기" width="0" height="90%">
							<span>새 클래스<br>만들기</span>
						</div>
					<%} else { %>
					<div class="myClass-btn" onclick="ClassSearch(구현안됨);" style="background-image: url('<%= contextPath %>/resources/image/house-add-fill.svg');">
							<img src="<%= contextPath %>/resources/image/house-add-fill.svg" alt=" 클래스 찾기" width="0" height="90%">
							<span>클래스<br>찾기</span>
						</div>
					<% } %>
					<div class="myClass-btn" data-toggle="modal" data-target="#classCode" style="background-image: url('<%= contextPath %>/resources/image/door-open-fill.svg');">
						<img src="<%= contextPath %>/resources/image/door-open-fill.svg" alt="초대코드로 가입하기"width="0" height="90%">
						<span>초대코드로<br>가입</span>
					</div>
				</div>
			</div>
			
			<div class="today-date">
				오늘은 <b>2023년 03월 23일 목요일</b> 이에요! 행복한 하루 되세요~
			</div>
			
			<!-- 하단 컨텐츠 -->
			<div class="other-info">
				<!-- 급식표 -->
				<div class="lunch">
				</div>
				<div class="timeTable">
					<h3>시간표</h3>
					<div>
						<div id="time-table" style="border-radius: 10px;"></div>
					</div>					
					<div class="table-btn">
						<button type="button" class="button_UI button--winona" data-text="업데이트" onclick="tableUpdate();">업데이트</button>
						<button type="button" class="button_UI button--winona" data-text="행 추가" onclick="insertRow();">행 추가</button>
					</div>
				</div>
				<!-- 캘린더 -->
				<div id='calendar-container' class="schedule">
					<div id='calendar'></div>
				</div>
			</div>
			
			<!-- modal-wrap -->
			<div>
				<!-- 새 클래스 만들기 모달창 -->
				<div id="newClassModal" class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true" >
					<div class="modal-dialog modal-dialog-centered modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h1 style="font-weight:700;">새 클래스 만들기</h1>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							
							<form action="classEnrollForm.c" method="post" enctype="multipart/form-data" id="classEnrollForm">
								<div class="modal-body">
					                <div class="title">
					                    <h2>학교</h2>
					                </div>
					
					                <div class="title_box">
					                    <input class="school_search" type="text" name="classTypeName" placeholder="내용을 입력해주세요">
					                </div>
					
					                <div class="info">
					                    <h2>연도</h2>
					                    <h2>학년</h2>
					                    <h2 class="class_name1">클래스 이름</h2>
					                    <h2 class="class_name1">선생님 이름</h2>
					                </div>
					
					                <div class="info_box">
				                        <input class="year" type="number" name="classYear" min="2010" max="2099" step="1" value="2023">
				                        <input class="grade" type="number" name="classGrade" min="1" max="6" step="1" value="1">
				                        <input class="class_name2" type="text" name="className" placeholder="학교이름을 입력해주세요">
				                        <input class="class_name2" type="text" name="teacherName" placeholder="선생님 이름을 입력하세요">
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
					                    <img class="prof_img" src="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">                          
					                </div>
					                <div id="file-area" style="display:none;">
										<input type="file" id="classProfile" name="upfile" onchange="loadImg(this);">
									</div>
					                <div class="box_1" style="margin-bottom:0;">
					                    <div class="box">
					                        <button type="button" class="button_UI button--winona fileUpdate" data-text="수정"><span>수정</span></button>
					                    </div>
					                    <div class="box">
					                        <button type="button" class="button_UI button--winona fileDelete" data-text="삭제"><span>삭제</span></button>
					                    </div>
					                </div>      
								</div>
								
								<div class="modal-footer">
				                    <div class="box">
				                        <button class="button_UI button--winona" data-dismiss="modal" data-text="취소"><span>취소</span></button>
				                    </div>
				                    <div class="box">
				                        <button type="submit" id="btn_register" class="button_UI button--winona" data-text="완료"><span>완료</span></button>
				                    </div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 시간표 테이블 모달창 -->
				<div id="tableModal" class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true" >
					<div class="modal-dialog modal-dialog-centered modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modalLabel"></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div id="time-table1" style="border-radius: 10px;"></div>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								<button type="button" id="btn_register" class="btn btn-primary" onclick="tableUpdate();">확인</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 초대코드로 가입 모달창 -->
				<div id="classCode" class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true" >
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<form action="classEnrollForm.c" method="get">
								<div class="modal-body">
									<h3 style="display:inline-block;font-weight:700;">초대코드로 가입하기</h3>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<button type="submit" id="btn_register" class="btn btn-primary">확인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
				
		</div>
	<script>
	//버튼 UI 애니메이션
        $('.button_UI').on('click', function () {
            $(this).css('color', 'rgb(137, 180, 166)');
            $(this).siblings(".button_UI").css('color', "black");
        });
        
		$(".prof_img, .fileUpdate").on('click',function(){
			$("#classProfile").click();
		});
		
		$(".fileDelete").on('click',function(){
			$(".prof_img").attr("src", "<%= contextPath %>/resources/image/noImage.png");
		    $("#classProfile").val("");
		});
		function loadImg(inputFile){
					// inputFile : 현재 변화가 생긴 input type="file"의 요소
					
					/*
						파일 선택시 length = 1, 파일 선택 취소시 length = 0 배열안의 내용이 비어있게 됨
						length값을 가지고 파일의 존재유무를 알 수 있다.
						
						files속성은 업로드된 파일의 정보를 "배열"형식으로 여러개 묶어서 반환, length: 그 배열의 크기를 의미
					*/
					if(inputFile.files.length != 0){
						// 선택된 파일이 존재할 경우에 선택된 파일들을 읽어들여서 그 영역에 맞는 곳에 미리보기 추가
						
						// 파일을 읽어들일 FileReader 객체 생성
						let reader = new FileReader();
						
						// 파일을 읽어들이는 메소드 -> 어느 파일을 읽을 지 매개변수에 제시해줘야함
						// 0번째 인덱스에 담긴 파일정보를 제시
						// -> 해당 파일을 읽어들이는 순간 해당파일만의 고유한 url 부여됨
						// -> 해당 url을 src속성값으로 제시
						reader.readAsDataURL(inputFile.files[0]);
						
						// 파일 읽기가 완료되었을 때 실행할 함수 정의
						reader.onload = function(e){// e.target.result에 고유한 url부여됨.
							// 각 영역에 맞춰서 이미지 미리보기 기능 제시
							let url = e.target.result;
							
							$(".prof_img").attr("src",url);
						}	
				
					}else {
						// 선택된 파일이 없을경우 미리보기도 함께 사라지게끔 작업.
						$(".prof_img").removeAttr("src");
					}
				}
    </script>
	<script>
        let tabledata = [
            { id: 1, name: "09:00 ~ 09:50", mon: "12", tue: "red", wed: "", thur: "ekrtdd", fri: "ekrtdd" },
            { id: 2, name: "10:00 ~ 10:50", mon: "1", tue: "blue", wed: "14/05/1982", thur: "ekrtdd", fri: "" },
            { id: 3, name: "11:00 ~ 11:50", mon: "42", tue: "green", wed: "22/05/1982", thur: "ekrtdd", fri: "스마트학원수학" },
            { id: 4, name: "12:00 ~ 12:50", mon: "125", tue: "orange", wed: "01/08/1980", thur: "밥먹기", fri: "ekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdf\nekrtasasekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdfekrtasasdffekrtasasdfekrtasasdfekrtasasdfdfekrtasasdfekrtasasdfekrtasasdf" },
            { id: 5, name: "13:00 ~ 13:50", mon: "16", tue: "yellow", wed: "31/01/1999", thur: "ekrtdd", fri: "ekrtdd" },
            { id: 6, name: "14:00 ~ 14:50", mon: "16", tue: "yellow", wed: "31/01/1999", thur: "ekrtdd", fri: "ekrtdd" },
            { id: 7, name: "15:00 ~ 15:50", mon: "16", tue: "yellow", wed: "31/01/1999", thur: "ekrtdd", fri: "ekrtdd" },
            { id: 8, name: "16:00 ~ 16:50", mon: "16", tue: "yellow", wed: "31/01/1999", thur: "ekrtdd", fri: "ekrtdd" },
            { id: 9, name: "17:00 ~ 17:50", mon: "16", tue: "yellow", wed: "31/01/1999", thur: "ekrtdd" },
        ];
        
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
		
        // id "time-table"인 tabulator 테이블 만들기
       
        let table = new Tabulator("#time-table", {
            height: "100%", // 높이 지정(css 높이 가능)
            data: tabledata, // 테이블 데이터 설정
            layout: "fitData", // 데이터에 맞춰서 보이기(보이는 방식 설정)
            columns: [ // 테이블 열 설정( 선생님일때 포매터 : editor <- 수정 , 아닐 때 : textarea <- 조회)
                { title: "", field: "name", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "월요일", field: "mon", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "화요일", field: "tue", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "수요일", field: "wed", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "목요일", field: "thur", editor:"input", editable:editCheck, variableHeight: true, headerSort: false },
                { title: "금요일", field: "fri", editor:"input", editable:editCheck, variableHeight: true, headerSort: false }
            ],	
        });
	   
        function tableUpdate() {
        	let arr = new Array();
            for (let i = 0; i < $(".tabulator-row").length; i++) {
        		let obj = new Object();
                let cell = $(".tabulator-row").eq(i).children(".tabulator-cell");
                obj.name= cell.eq(0).text();
                obj.mon = cell.eq(1).text();
                obj.tue = cell.eq(2).text();
                obj.wed = cell.eq(3).text();
                obj.thur= cell.eq(4).text();
                obj.fri = cell.eq(5).text();
                obj.sat = cell.eq(6).text();
                //JSON.stringify(obj);
                arr.push(obj);
            }
            console.log(JSON.stringify(arr) );
            arr = JSON.stringify(arr);
            $.ajax({
	    		url : "<%=contextPath%>/tableUpdate.c",
	    		method : 'POST',
	    		data : {arr},	    		
	    		success:function(result){
	    			if(result != null){
	    				
    					table.replaceData(result);
		                alert("수정되었습니다");
		                
	    			}else{
	    				alert("수정 실패");
	    			}
	    		},
	    		error:function(error,status,msg){
	    			alert("상태코드 " + status + "에러메시지" + msg );
	    		}
	    	});
        };
        
        function insertRow(){
        	console.log("1");
	        table.addRow({name: "", mon: "", tue: "", wed: "", thur: "", fri: ""}, true)
	        .then(function(row){
	           row.getCell("name").edit();
	        });
	    };
        // 행을 클릭했을 때 이벤트
        /* table.on("rowClick", function(e, row){
        	$("#time-table1").html(document.getElementById('time-table').cloneNode(true));
        	$('#tableModal').modal("show");
        }); */
    </script>
	<script>
        (function () {
            $(function () {
                // calendar element 취득
                var calendarEl = $('#calendar')[0];
                // full-calendar 생성하기
                var calendar = new FullCalendar.Calendar(calendarEl, { // calendar 높이 설정
                    expandRows: true, // 화면에 맞게 높이 재설정
                    slotMinTime: '08:00', // Day 캘린더에서 시작 시간
                    slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
                    // 해더에 표시할 툴바
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },
                    initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                    navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
                    editable: true, // 수정 가능?
                    selectable: true, // 달력 일자 드래그 설정가능
                    nowIndicator: true, // 현재 시간 마크
                    dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                    locale: 'ko', // 한국어 설정
                    //   eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                    //     console.log(obj);
                    //   },
                    //   eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                    //     console.log(obj);
                    //   },
                    //   eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                    //     console.log(obj);
                    //   },
                    select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                        var title = prompt('일정을 입력하세요 : ');
                        if (title) {
                            calendar.addEvent({
                                title: title,
                                start: arg.start,
                                end: arg.end,
                                allDay: arg.allDay
                            })
                        }
                        calendar.unselect()
                    },
                    events: [
                      	
                      ]
                });
                // 캘린더 랜더링
                calendar.render();
            });
        })();
    </script>
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
    	<% for(int i = 0; i < list.size(); i++){%>
    		atptCodeArr.push("<%= list.get(i).getAtptOfcdcScCode()%>");
    		schulCodeArr.push("<%= list.get(i).getSdSchulCode()%>");
			classList.push("<%= list.get(i).getClassNo()%>");
    	<%}%>
    	
	    function getToday(){
	        var date = new Date();
	        var year = date.getFullYear();
	        var month = ("0" + (1 + date.getMonth())).slice(-2);
	        var day = ("0" + date.getDate()).slice(-2);

	        return year + month + day;
	    }
	    
	    let week = ['일', '월', '화', '수', '목', '금', '토'];
    	let date = getToday();
	    let todayYear = date.substring(0,4);
	    let todayMonth = date.substring(4,6);
	    let todayDay = date.substring(6,8);
	    $(".today-date>b").text(todayYear + "년 " + todayMonth + "월 " + todayDay + "일 " + week[new Date(todayYear+"-"+todayMonth+"-"+todayDay).getDay()]+"요일");
	    
	    function lunch(){
	    	$.ajax({
	    		// 급식 가져오는 나이스포털 api
				/* ATPT_OFCDC_SC_CODE = 교육청 코드 SD_SCHUL_CODE = 학교 코드 MLSV_YMD = 가져올 날짜*/	    				
	    		url : "https://open.neis.go.kr/hub/mealServiceDietInfo?Type=jsonp&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=" + atptCodeArr[index] + "&SD_SCHUL_CODE="+ schulCodeArr[index] +"&MLSV_YMD="+(date),
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
	    lunch();
	    $(".myClass-info").on('afterChange', function(event, slick, direction){
	    	index = $(".slick-current>div>div").attr("id").substr(5);
		    lunch();
		    table.clearData();
		    table.updateOrAddData(tabledata);
	    });
	    
	    function moveToBoard(){
	    	
	    	cno = classList[index];
	    	
	    	location.href="/boardmove.bo?cno="+ cno;
	    }
	    
    </script>
</body>
</html>
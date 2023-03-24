<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--부트스트랩-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<!-- tabulator 테이블 라이브러리 -->
<link href="https://unpkg.com/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
<script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>
<!-- fullcalendar 캘린더 라이브러리 CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style>
/* div{
            border: 1px solid red;
        } */

/* 게시판 헤더 및 정보(게시판마다 공통) */
* {
	font-family: 'Gowun Dodum', sans-serif;
}

/* .wrap{
            width:100%;
            height:100%;
        } */
#header {
	display: inline-flex;
}

#searchBtn>img {
	width: 20px;
}

#search {
	margin-left: 390px;
}

#searchBtn {
	border: 1px solid black;
	height: 50px;
	border-radius: 10px;
	margin-top: 20px;
}

#logo {
	width: 100px;
}

#logoBtn {
	margin-left: 100px;
}

#seachClass {
	width: 700px;
	border: none;
	outline: none;
}

#header {
	width: 100%;
	height: 10%;
	margin-top: 10px;
}

#info>div {
	display: table-cell;
	width: 25%;
}

#classInfo, #userInfo {
	padding-left: 50px;
	vertical-align: middle;
}

#classInfo>div, #userInfo>div {
	font-size: large;
	font-weight: 900;
}

#info {
	width: 100%;
	margin-top: 20px;
	display: table;
	height: 20%;
	background-color: #cff0cc;
}

#pSchool, #pUser {
	padding-left: 300px;
}

.profile {
	margin-top: 10px;
	margin-bottom: 10px;
	width: 150px;
	border-radius: 50%;
}

.btnStyle {
	border: none;
	background: none;
	cursor: pointer;
}

/* 버튼호버시 이벤트 css부여 */
.btnStyle:hover {
	color: #209dce;
	transition: all .3s ease
}

.dropdown {
	margin-left: 350px;
}

.dropdown>button {
	background: none;
	border: none;
	border-radius: 40%;
	margin-top: 20px;
}

.dropdown-item {
	cursor: pointer;
}

#seachClass {
	background: none;
}

#alarmIcon {
	width: 30px;
}

.dropdown>button:hover {
	background-color: #cff0cc;
}

button:focus {
	outline: none;
}

/* 헤더 끝 */
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

.button_UI :active {
	color: rgb(137, 180, 166);
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

.button--winona::after, .button--winona>span {
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

.button--winona:hover>span {
	opacity: 0;
	-webkit-transform: translate3d(0, -25%, 0);
	transform: translate3d(0, -25%, 0);
}

/* 버튼 끝 */
.contentBox {
	width: 1500px;
	min-height: 900px;
	overflow: hidden;
	margin: auto;
	padding-top: 2em;
}

.myInfo {
	width: 100%;
	height: 22em;
	box-sizing: border-box;
}

.myProfile, .myClass, .today-date, .timeTable, .lunch, .schedule {
	border: 1px solid gray;
	border-radius: 1em;
}

.myProfile {
	width: 20%;
	min-width: 20%;
	height: 100%;
	padding: 1em 0 1em 0;
	margin-right: 1em;
	float: left;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	align-items: center;
}

.myProfile-name {
	background-color: #209dce;
	color: #ffffff;
	width: 7rem;
	height: 2em;
	text-align: center;
	border-radius: 0.5em;
	font-weight: 700;
	line-height: 2em;
}

.myProfile-img {
	width: 60%;
	min-width: 30%;
	height: 50%;
	min-height: 30%;
	border-radius: 50%;
	overflow: hidden;
	display: flex;
	justify-content: center;
}

.myProfile-img>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.myClass {
	width: 78.7%;
	min-width: 10%;
	height: 100%;
	min-height: 10%;
	padding: 1em;
	float: left;
	display: flex;
	align-items: center;
}

.myClass-img {
	width: 60%;
	height: 70%;
	border-radius: 50%;
	overflow: hidden;
	display: inline-block;
	text-align: center;
}

.myClass-img>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	cursor: pointer;
}

.myClass-btn {
	width: 20%;
	height: 80%;
	margin: 1em;
	text-align: center;
	cursor: pointer;
}

.myClass-btn>img {
	border-radius: 10em;
}

.myClass-btn>span {
	padding: 1em;
	display: flex;
	justify-content: center;
	font-size: large;
	font-weight: 700;
}

.today-date {
	width: 100%;
	height: 3em;
	margin: 1em 0 1em 0;
	text-align: center;
	line-height: 3em;
}

.timeTable {
	width: 40%;
	margin: 0 1em 0 1em;
	padding: 1em;
}

.table-btn {
	padding-top: 1em;
	margin-left: 35%;
}

.lunch {
	width: 20%;
	padding: 1em;
	display: flex;
	flex-direction: column;
	text-align: center;
}

.schedule {
	width: 40%;
	padding: 1em
}
</style>
</head>

<body>
	<div class="wrap">
		<div id="header">
			<button id="logoBtn" class="btnStyle" type="button">
				<img id="logo"
					src="resources/KakaoTalk_20230317_141025465-removebg-preview.png">
			</button>
			<div id="search">
				<button id="searchBtn" type="button">
					<input id="seachClass" type="text" placeholder="찾으시는 클래스를 입력해주세요.">
					<img src="resources/searchIcon.png">
				</button>
			</div>
			<div class="dropdown">
				<button class="btn btn-secondary" type="button"id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"aria-expanded="false">

					<img id="alarmIcon" src="resources/알림.png" />
				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">알림3</a> <a class="dropdown-item"href="#">알림2</a> 
					<a class="dropdown-item" href="#">알림1</a>
				</div>
			</div>
		</div>
		<hr>
		<div class="contentBox">
			<div class="myInfo">
				<div class="myProfile">
					<div class="myProfile-img">
						<img src="/resources/image/bono.jpg" alt="">
					</div>
					<span class="myProfile-name">사용자이름</span>
					<button class="button_UI button--winona" data-text="마이페이지">
						<span>마이페이지</span>
					</button>
					<button class="button_UI button--winona" data-text="로그아웃">
						<span>로그아웃</span>
					</button>
				</div>
				<div class="myClass">
					<div style="width: 35%; height: 100%;">
						<div class="myClass-img">
							<img src="/resources/image/bono.jpg" alt="클래스 프로필">
						</div>
						<div style="width: 40%; float: right;">
							<div>가나다바라 선생님</div>
							<div>가입자 수 : 12340명</div>
						</div>
						<div>신성 초등학교 1학년 준하반</div>
					</div>
					<div class="myClass-btn">
						<img src="/resources/image/flower.jpg" alt="클래스 더보기" width="100%" height="90%"> 
						<span>클래스 더보기</span>
					</div>
					<div class="myClass-btn">
						<img src="/resources/image/flower.jpg" alt="새 클래스 만들기"width="100%" height="90%"> 
						<span>새 클래스 만들기</span>
					</div>
					<div class="myClass-btn">
						<img src="/resources/image/flower.jpg" alt="초대코드로 가입하기"width="100%" height="90%">
						<span>초대코드로 가입하기</span>
					</div>
				</div>
			</div>
			<div class="today-date">
				오늘은 <b>2023년 03월 23일 목요일</b> 이에요! 행복한 하루 되세요~
			</div>
			<div style="display: flex;">
				<div class="lunch">
				</div>
				<div class="timeTable">
					<h3>시간표</h3>
					<div>
						<div id="time-table" style="border-radius: 10px;"></div>
					</div>
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
									<button type="button" id="btn_register" class="btn btn-primary">확인</button>
								</div>
							</div>
						</div>
					</div>					
					<div class="table-btn">
						<button type="button" class="button_UI button--winona" onclick="tableUpdate();">업데이트</button>
					</div>
				</div>
				<div id='calendar-container' class="schedule">
					<div id='calendar'></div>
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

        //create Tabulator on DOM element with id "time-table"
        let table = new Tabulator("#time-table", {
            height: "100%", // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
            data: tabledata, //assign data to table
            layout: "fitDataFill", //fit columns to width of table (optional)
            columns: [ //Define Table Columns 선생님일때 : editor, 아닐 때 : textarea
                { title: "", field: "name", formatter: "textarea", variableHeight: true, headerSort: false },
                { title: "월요일", field: "mon", formatter: "textarea", variableHeight: true, headerSort: false },
                { title: "화요일", field: "tue", formatter: "textarea", variableHeight: true, headerSort: false },
                { title: "수요일", field: "wed", formatter: "textarea", variableHeight: true, headerSort: false },
                { title: "목요일", field: "thur", formatter: "textarea", variableHeight: true, headerSort: false },
                { title: "금요일", field: "fri", editor: "input", variableHeight: true, headerSort: false }
            ],
        });

        function tableUpdate() {
            for (let i = 0; i < $(".tabulator-row").length; i++) {
                let cell = $(".tabulator-row").eq(i).children(".tabulator-cell");
                table.updateRow(i + 1, {
                    name: cell.eq(0).text(), mon: cell.eq(1).text(), tue: cell.eq(2).text(),
                    wed: cell.eq(3).text(), thur: cell.eq(4).text(), fri: cell.eq(5).text(), sat: cell.eq(6).text()
                });
            }
            alert("수정되었습니다");
        }

        // 행을 클릭했을 때 이벤트
        table.on("rowClick", function(e, row){
        	$("#time-table1").html(document.getElementById('time-table').cloneNode(true));
        	$('#tableModal').modal("show");
        });
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
    	$.ajax({
    		/* url : 'https://open.neis.go.kr/hub/schoolInfo?KEY=42f9059625d34f7f989f556b3a16de4f&Type=json&SCHUL_NM=신성초등학교', */
			/* ATPT_OFCDC_SC_CODE = 교육청 코드 SD_SCHUL_CODE = 학교 코드 MLSV_YMD = 가져올 날짜*/	    				
    		url : 'https://open.neis.go.kr/hub/mealServiceDietInfo?Type=jsonp&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=T10&SD_SCHUL_CODE=9290083&MLSV_YMD=20230324',
    		method : 'GET',
    		contentType:'application/json;charset=utf-8',
    		dataType:'jsonp',
    		
    		success:function(result){
    			$(".lunch").html("<h3>오늘의 급식표</h3><br><br>"+result.mealServiceDietInfo[1].row[0].DDISH_NM)
    		},
    		error:function(error,status,msg){
    			alert("상태코드 " + status + "에러메시지" + msg );
    		}
    	});
    </script>
</body>

</html>
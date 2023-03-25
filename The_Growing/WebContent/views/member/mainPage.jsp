<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../../resources/css/mainPage.css">

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
		<%@ include file="../common/header.jsp" %>
		<div class="contentBox">
			<div class="myInfo">
				<div class="myProfile">
					<div class="myProfile-img">
						<img src="../../resources/image/bono.jpg" alt="">
					</div>
					<span class="myProfile-name">사용자 이름</span>
					<button class="button_UI button--winona" data-text="마이페이지">
						<span>마이페이지</span>
					</button>
					<button class="button_UI button--winona" data-text="로그아웃">
						<span>로그아웃</span>
					</button>
				</div>
				<div class="myClass">
					<div class="myClass-info">
						<div class="myClass-list">
							<div class="myClass-img">
								<img src="../../resources/image/bono.jpg" alt="클래스 프로필">
							</div>
							<div class="myClass-text-list">
								<div class="myClass-text">가나다라바1 초등학교 이1학년<br>준하반</div>
								<div class="myClass-text">가입자 수 : 12340명</div>
								<div class="myClass-text">가나다바라 선생님</div>
							</div>
						</div>
						<div class="myClass-list">
							<div class="myClass-img">
								<img src="../../resources/image/flower.jpg" alt="클래스 프로필">
							</div>
							<div class="myClass-text-list">
								<div class="myClass-text">세명 초등학교 3학년<br>예솔반</div>
								<div class="myClass-text">가입자 수 : 20명</div>
								<div class="myClass-text">문동은 선생님</div>
							</div>
						</div>
					</div>
					<div class="myClass-btn">
						<img src="../../resources/image/iconsample.png" alt="클래스 더보기" width="100%" height="90%"> 
						<span>클래스 더보기</span>
					</div>
					<div class="myClass-btn">
						<img src="../../resources/image/iconsample2.png" alt="새 클래스 만들기"width="100%" height="90%">
						<span>새 클래스<br>만들기</span>
					</div>
					<div class="myClass-btn">
						<img src="../../resources/image/treelogo.png" alt="초대코드로 가입하기"width="100%" height="90%">
						<span>초대코드로<br>가입</span>
					</div>
				</div>
			</div>
			<div class="today-date">
				오늘은 <b>2023년 03월 23일 목요일</b> 이에요! 행복한 하루 되세요~
			</div>
			<!-- 하단 메뉴 -->
			<div class="other-info">
				<!-- 급식표 -->
				<div class="lunch">
				</div>
				<div class="timeTable">
					<h3>시간표</h3>
					<div>
						<div id="time-table" style="border-radius: 10px;"></div>
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
					<div class="table-btn">
						<button type="button" class="button_UI button--winona" data-text="업데이트" onclick="tableUpdate();">업데이트</button>
					</div>
				</div>
				<!-- 캘린더 -->
				<div id='calendar-container' class="schedule">
					<div id='calendar'></div>
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

        // id "time-table"인 tabulator 테이블 만들기
        let table = new Tabulator("#time-table", {
            height: "100%", // 높이 지정(css 높이 가능)
            data: tabledata, // 테이블 데이터 설정
            layout: "fitDataFill", // 데이터에 맞춰서 보이기(보이는 방식 설정)
            columns: [ // 테이블 열 설정( 선생님일때 포매터 : editor <- 수정 , 아닐 때 : textarea <- 조회)
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
    		// 급식 가져오는 나이스포털 api
    		/* url : 'https://open.neis.go.kr/hub/schoolInfo?KEY=42f9059625d34f7f989f556b3a16de4f&Type=json&SCHUL_NM=신성초등학교', */
			/* ATPT_OFCDC_SC_CODE = 교육청 코드 SD_SCHUL_CODE = 학교 코드 MLSV_YMD = 가져올 날짜*/	    				
    		url : 'https://open.neis.go.kr/hub/mealServiceDietInfo?Type=jsonp&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=T10&SD_SCHUL_CODE=9290083&MLSV_YMD=20230324',
    		method : 'GET',
    		contentType:'application/json;charset=utf-8',
    		dataType:'jsonp',
    		
    		success:function(result){
    			if(result != undefined || result != null){
	    			$(".lunch").html("<h3>오늘의 급식표</h3><br>"+result.mealServiceDietInfo[1].row[0].DDISH_NM+
	    					"<br><br> <span style='font-size:0.6vw;'>* 요리명에 표시된 번호는 알레르기를 유발할수 있는 식재료입니다<br><br>"+
	    					"(1.난류, 2.우유, 3.메밀, 4.땅콩, 5.대두, 6.밀, 7.고등어, 8.게, 9.새우,<br> 10.돼지고기, 11.복숭아, 12.토마토, 13.아황산염, 14.호두, 15.닭고기, 16.쇠고기, 17.오징어, 18.조개류(굴,전복,홍합 등)</span>")
    			}else{
    				$(".lunch").html("<h3>급식이 없습니다</h3>");
    			}
    		},
    		error:function(error,status,msg){
    			alert("상태코드 " + status + "에러메시지" + msg );
    		}
    	});
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
</body>
</html>
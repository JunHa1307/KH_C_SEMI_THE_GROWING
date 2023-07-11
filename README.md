# KH_C_SEMI_THE_Growing

학급 관리 & 커뮤니티 사이트
================================================================
선생님과 학부모와 학생 모두가
"다양하고 풍성한 정보"를
"편리"하고
"안전하게 소통"할 수 있도록 기획

--------------------------------------------------------------------------------------------


류준하(JunHa1307) 장하은(hasusungbin, JangHaEun) 오현지(hongdii) 이충영(cylee0328) 오민석(ohy794)
================================================================

--------------------------------------------------------------------------------------------

소개 ppt
================================================================

[https://www.canva.com/design/DAFdDG-dqc8/3Wg3zdhd6wvgospYQQkOag/edit?utm_content=DAFdDG-dqc8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton](https://www.canva.com/design/DAFdDG-dqc8/tMEWDxaZ3OvVO3rdmM65fw/view?utm_content=DAFdDG-dqc8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink)

--------------------------------------------------------------------------------------------

사용 언어 & API & 라이브러리
================================================================
Java(11.0.17, eclipse 2020.09), Oracle DataBase(sqldeveloper 11g Standard Edition), JavaScript html css

Apach Tomcat 9.0 , JQuery 3.6.3

Bootstrap 4.5.3 , Tabulator , sweetalert2 , summernote, AOS(Animate on scroll) ,

slick , FullCalendar, chart.js

나이스 교육정보 개방포털 - 학교기본정보 API , 급식 식단 정보 API

KaKao , Naver , Google Login API

--------------------------------------------------------------------------------------------

주요 기능
================================================================
로그인, API 이용 로그인, 회원가입, 알림, 사용자 정보 CRUD

시간표, 급식표, 일정표, 클래스 CRUD, 임시계정생성, 클래스 정보 , 회원 정보 CRUD

게시판(알림장, 자유게시판, 상담게시판), 
비밀글 & 비밀댓글, 댓글, 좋아요, 조회수, 검색, 인쇄, 파일 다운로드, 스크랩, CRUD

출석 체크 & 설문 조사 CRUD

전 페이지 Css 미디어 쿼리 적용하여 반응형 웹 구현

--------------------------------------------------------------------------------------------

목차
================================================================
  
  - [로그인 페이지](#로그인-페이지)
  - 
  - [메인 페이지](#메인-페이지)
  - [지도 페이지](#지도-페이지)
  - [분양 페이지](#분양-페이지)
  - [알림 페이지](#알림-페이지)
  - [일반 회원 마이 페이지](#일반-회원-마이-페이지)
  - [공인중개사 마이 페이지](#공인중개사-회원-마이-페이지)
  - [매물 페이지](#매물-페이지)
  - [관리자 페이지](#관리자-페이지)

--------------------------------------------------------------------------------------------
세부 기능
================================================================


<h4>[로그인 페이지]</h4>
<details>
  <summary>회원가입</summary>
  <div markdown="1">
  </div>
</details>
<hr>
--------------------------------------------------------------------------------------------

summernote, classes 제외 cloc 코드 분석
================================================================

Language &nbsp;&nbsp;&nbsp;&nbsp; files &nbsp;&nbsp;&nbsp;&nbsp; blank &nbsp;&nbsp;&nbsp;&nbsp; comment &nbsp;&nbsp;&nbsp;&nbsp; code &nbsp;&nbsp;&nbsp;&nbsp; scale   &nbsp;&nbsp;&nbsp;&nbsp; 3rd gem. &nbsp;&nbsp;&nbsp;&nbsp; equiv

JSP &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 40 &nbsp;&nbsp;&nbsp;&nbsp; 1814 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 473 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10061 &nbsp;&nbsp;&nbsp;&nbsp; x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.48 = &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14890.28

Java &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 89 &nbsp;&nbsp;&nbsp;&nbsp; 2870 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1380 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6833 &nbsp;&nbsp;&nbsp;&nbsp; x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.36 = &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9292.88

CSS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 146 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6833 &nbsp;&nbsp;&nbsp;&nbsp; x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.00 = &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 855.00

XML &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 73 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 604 &nbsp;&nbsp;&nbsp;&nbsp; x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.90 = &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1147.60

Javascript &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 99 &nbsp;&nbsp;&nbsp;&nbsp; x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.48 = &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 146.52

================================================================

SUM: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 141 &nbsp;&nbsp;&nbsp;&nbsp; 4918 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1886 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18452 &nbsp;&nbsp;&nbsp;&nbsp; x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.43 = &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 26332.28

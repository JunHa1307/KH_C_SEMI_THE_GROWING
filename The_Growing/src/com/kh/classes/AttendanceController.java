package com.kh.classes;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AttendanceController
 */
@WebServlet("/attendance.bo")
public class AttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ClassService service = new ClassService();
		
		int cno = (int)request.getSession().getAttribute("cno");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		
		Class cInfo = service.selectClass(cno, uno);
		
		
		request.setAttribute("cInfo", cInfo);
		
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		int month  = Integer.parseInt(df.format(currentCalendar.get(Calendar.MONTH) + 1));
		int lastDay =  Integer.parseInt(df.format(currentCalendar.getActualMaximum(Calendar.DAY_OF_MONTH )));
		
		request.setAttribute("month", month);
		request.setAttribute("lastDay", lastDay);
		
		ArrayList<String> attendTable = service.selectAttendTable(cno, month);
		ArrayList<String> memberInfo = service.selectClassMemberName(cno);
		ArrayList<String> memberName = new ArrayList<String>();
		ArrayList<String> memberUno = new ArrayList<String>();
		
		if(memberInfo.size() == 0) {
			request.setAttribute("errorMsg", "이 클래스에는 출석부에 등록할 학생이 없습니다.");
			 
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
		}else {
			
			for(int i = 0; i < memberInfo.size(); i++) {// 멤버 이름 추출
				if(i%2 == 0) {
					memberName.add(memberInfo.get(i));
				}else {
					memberUno.add(memberInfo.get(i));
				}
			}
			Collections.sort(memberName);// 정렬
			if(attendTable.size() == 0) {// 클래스에 출석체크 표가 없을 때 새로 생성
				 
				ArrayList<String> arr = new ArrayList<String>();
				
				for(int i = 0; i < memberName.size(); i++) {//필요없는 문자 제거
					
					arr.add(addAttendMember(memberName.get(i),lastDay).replace("[", "").replace("]", ""));
				}
				
				int result = service.insertAttendTable(cno,arr.toString(),month);// 출석체크 표 추가
				
				if(result > 0) {
					attendTable = service.selectAttendTable(cno, month);
					request.setAttribute("attendTable", attendTable);
				 
					request.getRequestDispatcher("views/board/attendance.jsp").forward(request,response); 
					 
				}else { 
					request.setAttribute("errorMsg", "출석부 생성에 실패 했습니다.");
					 
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
				} 
			}else {// 클래스에 출석체크 표가 없다면 표 업데이트 || 기존 표 표시
				
				ArrayList<String> tableCheck = new ArrayList<String>();
				for(int i = 0; i < attendTable.size(); i++) { // 불필요 문자 제거
					tableCheck.add(attendTable.toString().replace("[","").replace("]","").split(",")[i].split("/")[0].trim());
				}
				Collections.sort(tableCheck); // 정렬
				boolean isUpdated = true;
				
				// 정렬을 한 후에 글자가 다른 인덱스 찾기
				// 둘 중 하나에 있다면 넘어가고 없다면 없는 곳에 추가
				// 다시 정렬
				if(tableCheck.size() > memberName.size()) { // 출석체크표가 더 많을 때(회원이 탈퇴했을 때)
					for(int i = 0; i < tableCheck.size(); i++) {
							for(int j = memberName.size(); j < tableCheck.size(); j++) { // 더미(회원이 빈 곳) 넣어서 사이즈 통일
								memberName.add(j," ");
							}
							String memberstr = memberName.get(i);
							if(!tableCheck.get(i).equals(memberstr)) { // 다르면 update 필요
								isUpdated = false;
								if(tableCheck.contains(memberstr) && (Collections.frequency(tableCheck, memberstr) == Collections.frequency(memberName, memberstr))) {
									continue; // 동일한 문자가 같은 수로 존재한다면 다음으로 넘어감
								}else if(!memberstr.equals(" ")){ // 더미값이 아니라면 추가
									attendTable.add(addAttendMember(memberstr,lastDay));
									tableCheck.add(memberstr);
									Collections.sort(tableCheck);
								}else { // 더미라면 삭제
									attendTable.remove(i);
									tableCheck.remove(i);
								}
							}
					}
				}else if (tableCheck.size() < memberName.size()) { // 출석체크표가 더 적을 때 (회원이 등록되었을 때)
					for(int i = 0; i < memberName.size(); i++) {
						for(int j = tableCheck.size(); j < memberName.size(); j++) {
							tableCheck.add(j," ");
						}
						String memberstr = memberName.get(i);
						if(!tableCheck.get(i).equals(memberstr)) {
							isUpdated = false;
							if(tableCheck.contains(memberstr) && (Collections.frequency(tableCheck, memberstr) == Collections.frequency(memberName, memberstr))) {
								continue;
							}else if(tableCheck.get(i).equals(" ")){ // 더미(출석체크에 없다) 라면 추가
								attendTable.add(addAttendMember(memberstr,lastDay));
								tableCheck.add(memberstr);
								Collections.sort(tableCheck);
							}else {
								attendTable.remove(i);
								memberName.remove(i);
							}
						}
					}
				}else { // 회원 수 는 같지만 클래스 멤버가 다를 때 (등록 탈퇴 수가 다를 때)
					for(int i = 0; i < tableCheck.size(); i++) {
						String memberstr = memberName.get(i);
						if(!tableCheck.get(i).equals(memberstr)) {
							isUpdated = false;
							if(tableCheck.contains(memberstr) && (Collections.frequency(tableCheck, memberstr) == Collections.frequency(memberName, memberstr))) {
								continue;
							}else if(memberName.contains(tableCheck.get(i))){ // 출석표 i번째 학생은 있고 멤버 i 학생은 없다면
								attendTable.add(addAttendMember(memberstr,lastDay));
								tableCheck.add(memberstr);
								Collections.sort(tableCheck);
							}else { // 출석표에 클래스 멤버에 없는 학생이 등록되어있다면
								attendTable.remove(i);
								tableCheck.remove(i);
								Collections.sort(tableCheck);
							}
						}
					}
				}
				
				 if(!isUpdated) {
					int result = service.updateAttendTable(attendTable.toString(), cno, month);
						
					if(result > 0) {
						attendTable = service.selectAttendTable(cno, month);
						request.setAttribute("attendTable", attendTable);
					 
						request.getRequestDispatcher("views/board/attendance.jsp").forward(request,response); 
						 
					}else { 
						request.setAttribute("errorMsg", "출석부 생성에 실패 했습니다.");
						 
						RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
					} 
				 }else {
					 request.setAttribute("attendTable", attendTable);
					 request.getRequestDispatcher("views/board/attendance.jsp").forward(request,response); 				 
				 }
			}
		}
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int month = Integer.parseInt(request.getParameter("month"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		ArrayList<String> arr = new ArrayList<String>(Arrays.asList(request.getParameter("arr")));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = 0;

		if(loginUser.getUserLevel() == 1) {
			result = new ClassService().updateAttendTable(arr.toString().replace("[", "").replace("]", "").replace("\"", ""), cno, month);
		}
		
		if(result > 0) {
			response.getWriter().print("Success");
			 
		}else { 
			response.getWriter().print("Fail");
		} 
		
		
	}
	
	protected String addAttendMember(String name, int lastDay) {
		
		ArrayList<String> str = new ArrayList<String>();
		String day = "";
		day += name+"/";
		for(int j = 0; j < lastDay; j++) {
			day += "X";
		}
		str.add(day);
		
		return str.toString();
	}

}

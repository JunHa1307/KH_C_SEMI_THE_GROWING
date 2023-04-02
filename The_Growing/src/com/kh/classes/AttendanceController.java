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
		
		for(int i = 0; i < memberInfo.size(); i++) {
			if(i%2 == 0) {
				memberName.add(memberInfo.get(i));
			}else {
				memberUno.add(memberInfo.get(i));
			}
		}
		Collections.sort(memberName);
		if(attendTable.size() == 0) { 
			 
			ArrayList<String> arr = new ArrayList<String>();
			
			for(int i = 0; i < memberName.size(); i++) {
				
				arr.add(addAttendMember(memberName.get(i),lastDay).replace("[", "").replace("]", ""));
			}
			
			int result = service.insertAttendTable(cno,arr.toString(),month);
			
			if(result > 0) {
				attendTable = service.selectAttendTable(cno, month);
				request.setAttribute("attendTable", attendTable);
			 
				request.getRequestDispatcher("views/board/attendance.jsp").forward(request,response); 
				 
			}else { 
				request.setAttribute("errorMsg", "출석부 생성에 실패 했습니다.");
				 
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
			} 
		}else {
			
			ArrayList<String> tableCheck = new ArrayList<String>();
			for(int i = 0; i < attendTable.size(); i++) {
				tableCheck.add(attendTable.toString().replace("[","").split(",")[i].split("/")[0].trim());
			}
			Collections.sort(tableCheck);
			boolean isUpdated = true;

			for(int i = 0; i < tableCheck.size(); i++) {
				String memberstr = memberName.get(i);
				
				if(!tableCheck.get(i).equals(memberstr)) {
					isUpdated = false;
					if(tableCheck.get(i-1).equals(memberstr)) {							
						attendTable.add(addAttendMember(memberstr,lastDay));
						tableCheck.add(memberstr);
						Collections.sort(tableCheck);
					}else if(tableCheck.get(i+1).equals(memberstr)){
						attendTable.remove(i);
						tableCheck.remove(i);
					}else {
						attendTable.add(addAttendMember(memberstr,lastDay));
						tableCheck.add(memberstr);
						Collections.sort(tableCheck);
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
			result = new ClassService().updateAttendTable(arr.toString().replace("\"", ""), cno, month);
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

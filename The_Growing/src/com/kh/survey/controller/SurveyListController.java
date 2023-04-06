package com.kh.survey.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.survey.model.service.SurveyService;
import com.kh.survey.model.vo.Survey;

/**
 * Servlet implementation class SurveyListController
 */
@WebServlet("/list.su")
public class SurveyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = (int)request.getSession().getAttribute("cno");
		ArrayList<Survey> surveyList = new SurveyService().selectSurveyList(cno);
		

		Calendar cal =Calendar.getInstance();
		Date date = Date.valueOf(cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH));
		
		for(int i = 0; i < surveyList.size(); i++) {
			if(date.after(surveyList.get(i).getLastDate()) && surveyList.get(i).getStatus().contains("Y")) {
				int result = new SurveyService().updateSurveyStatus(surveyList.get(i).getSurveyNo());
				if(result > 0) {
					surveyList.get(i).setStatus("N");
				}
			}
		}
		
		request.setAttribute("surveyList", surveyList);
		
		request.getRequestDispatcher("views/survey/surveyList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sno = Integer.parseInt(request.getParameter("sno"));
		int result = new SurveyService().updateSurveyStatus(sno);
		
		if(result > 0) {
			response.getWriter().print("Success");
		}else {
			response.getWriter().print("Fail");
		}
	}

}

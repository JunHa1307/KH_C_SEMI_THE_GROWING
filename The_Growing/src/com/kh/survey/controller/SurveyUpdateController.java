package com.kh.survey.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.survey.model.service.SurveyService;
import com.kh.survey.model.vo.Question;
import com.kh.survey.model.vo.Survey;

/**
 * Servlet implementation class SurveyUpdateController
 */
@WebServlet("/update.su")
public class SurveyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SurveyService sService = new SurveyService();
		
		int surveyNo = Integer.parseInt(request.getParameter("sno"));
		
		Survey s = sService.selectSurvey(surveyNo);
		Question q = sService.selectQuestion(surveyNo);
		request.setAttribute("s", s);
		request.setAttribute("q", q);
		
		request.getRequestDispatcher("views/survey/surveyUpdateform.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int quesNo = Integer.parseInt(request.getParameter("qNo"));
		
		int surveyNo = Integer.parseInt(request.getParameter("sno"));
		String title = request.getParameter("survey_title");
		Date fDate = Date.valueOf(request.getParameter("fDate"));
		Date lDate = Date.valueOf(request.getParameter("lDate"));
		
		String[] questionType = request.getParameterValues("type"); 
		String[] mTitle = request.getParameterValues("mTitle");
		String[] mContent = request.getParameterValues("mContent");
		String[] itemCheck = request.getParameterValues("itemCheck");
		String[] itemContent = request.getParameterValues("itemContent");
		String[] sTitle = request.getParameterValues("sTitle");
		String[] sContent = request.getParameterValues("sContent");
		
		
		Survey s = new Survey();
		s.setTitle(title);
		s.setSurveyNo(surveyNo);
		s.setFirstDate(fDate);
		s.setLastDate(lDate);
		
		
		int result1 = new SurveyService().updateSurvey(s);
		
		if(result1 > 0) {
			Question q = new Question();
			q.setQuesType(questionType);
			q.setmTitle(mTitle);
			q.setmContent(mContent);
			q.setItemNo(itemCheck);
			q.setItemContent(itemContent);
			q.setsTitle(sTitle);
			q.setRefSno(s.getSurveyNo());
			
			int result2 = new SurveyService().updateQuestion(q);
			
			if(result2 > 0) {
				request.getSession().setAttribute("alertMsg", "설문 수정 성공");
				
				response.sendRedirect(request.getContextPath()+"/list.su");
			}else {
				request.setAttribute("errorMsg", "설문 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}else {
			request.setAttribute("errorMsg", "설문 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}
	
		
}

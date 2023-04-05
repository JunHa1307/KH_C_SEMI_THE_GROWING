package com.kh.survey.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.survey.model.service.SurveyService;
import com.kh.survey.model.vo.Question;
import com.kh.survey.model.vo.Survey;

/**
 * Servlet implementation class SurveyInsertFormController
 */
@WebServlet("/insert.su")
public class SurveyInsertFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyInsertFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String surveyTitle = request.getParameter("survey_title");
		
		Date fDate = Date.valueOf(request.getParameter("fDate"));
		Date lDate = Date.valueOf(request.getParameter("lDate"));
		int cno = (int)request.getSession().getAttribute("cno");
		
		String[] questionType = request.getParameterValues("type"); 
		String[] mTitle = request.getParameterValues("mTitle"); 
		String[] mContent = request.getParameterValues("mContent"); 
		String[] itemCheck = request.getParameterValues("itemCheck");
		String[] itemContent = request.getParameterValues("itemContent"); 
		String[] sTitle = request.getParameterValues("sTitle"); 
		String[] sContent = request.getParameterValues("sContent"); 
		
		SurveyService service = new SurveyService();
		
		Survey survey = new Survey(surveyTitle, fDate, lDate, cno);
		
		int result1 = service.insertSurvey(survey);
		
		if(result1 > 0) {
			
			survey = service.selectSurvey(surveyTitle,fDate,cno);
			
			Question ques = new Question();
			
			ques.setQuesType(questionType);
			ques.setRefSno(survey.getSurveyNo());
			ques.setsTitle(sTitle);
			ques.setsContent(sContent);
			ques.setmTitle(mTitle);
			ques.setmContent(mContent);
			ques.setItemNo(itemCheck);
			ques.setItemContent(itemContent);
			
			int result2 = service.insertQuestion(ques);
			
			if(result2 > 0) {
				request.getSession().setAttribute("alertMsg", "설문 작성 성공");
				
				response.sendRedirect(request.getContextPath()+"/list.su");
			}else {
				request.setAttribute("errorMsg", "설문 생성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}else {
			request.setAttribute("errorMsg", "설문 생성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}

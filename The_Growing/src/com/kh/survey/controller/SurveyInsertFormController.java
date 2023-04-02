package com.kh.survey.controller;

import java.io.IOException;
import java.sql.Date;

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
		int cno = 2;
		
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
			
			survey = service.selectSurvey(fDate,cno);
			
			Question ques = new Question();
			
			ques.setQuesType(questionType);
			ques.setRefSno(survey.getSurveyNo());
			ques.setsTitle(sTitle);
			ques.setsContent(sContent);
			ques.setmTitle(mTitle);
			ques.setmContent(mContent);
			ques.setItemNo(itemCheck);
			ques.setItemContent(itemContent);
			
			System.out.println(ques.toString());
			
			int result2 = service.insertQuestion(ques);
			/*  가져올 때 이런 방식으로
			int mIndex = 0;
			int sIndex = 0;
			int j = 0;
			for(int i = 0; i < questionType.length; i++) {
				if(questionType[i].equals("1")) {
					
					System.out.print("객관식 제목 : " + mTitle[mIndex] + " ");
					System.out.print("내용 : " + mContent[mIndex] + " ");
					int k = j;
					for(; j < k + Integer.parseInt(itemCheck[mIndex]); j++) {					
						System.out.print("항목 내용 : " + itemContent[j] + " ");
					}
					mIndex++;
				}else {
					System.out.print("주관식 제목 : " + sTitle[sIndex] + " ");
					System.out.println("내용 : " + sContent[sIndex]);
					sIndex++;
				}
			}
			*/
			
			if(result2 > 0) {
				request.getSession().setAttribute("alertMsg", "설문 작성 성공");
				response.sendRedirect(request.getContextPath()+"/slist.su");
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

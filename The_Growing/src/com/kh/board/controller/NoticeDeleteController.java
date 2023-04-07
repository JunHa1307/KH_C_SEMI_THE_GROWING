package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/folderDelete.do")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
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
	@ResponseBody
	@RequestMapping(value="/folderDelete.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public int folderDelete(HttpServletRequest request, @RequestParam(value="checkBoxArr[]") List<String> checkBoxArr 
	, @ModelAttribute("archiveFolder") ArchiveFolder archiveFolder) throws Exception {
	    int result = 0;
	    String checkNum = "";

	    for(String str : checkBoxArr){
	    checkNum = str;
	    archiveFolder.setFolderSeq(checkNum);
	    folderService.archiveFolderDelete(archiveFolder);
	    }
	  return result;
	}

}

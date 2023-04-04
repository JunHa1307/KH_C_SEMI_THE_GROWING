package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	public ArrayList<Board> selectAlbumList() {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectAlbumList(conn);
		close(conn);
		return list;
	}

	public int insertAlbumBoard(Board b, ArrayList<Attachment> list, int cno, int uno) {

		Connection conn = getConnection();

		int result1 = new BoardDao().insertAlbumBoard(conn, b, cno, uno);

		int result2 = new BoardDao().insertAttachmentList(conn, list, cno, uno);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;
	}
	
	public ArrayList<Attachment> selectAttachList(int cno){
		Connection conn = getConnection();
			
			ArrayList<Attachment> list = new BoardDao().selectAttachList(conn, cno);
			
			close(conn);
			
			return list;
		}

	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	public Attachment selectAttachment(int boardNo) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, boardNo);
		
		close(conn);
		
		return at;
	}
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo){
		
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	public int insertBoard(Board b , ArrayList<Attachment> list, int cno, int uno) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b, cno, uno);
		
		
		int result2 = new BoardDao().insertAttachmentList(conn, list, cno, uno);
		
		
		
		if(result1 > 0 && result2 > 0) {
			
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
}

package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.Attachment;

public class BoardService {

	public ArrayList<Board> selectAlbumList(int cno) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectAlbumList(conn, cno);
		close(conn);
		return list;
	}

	public int insertAlbumBoard(Board b, ArrayList<Attachment> list) {

		Connection conn = getConnection();

		int result1 = new BoardDao().insertAlbumBoard(conn, b);
		int result2 =0;
		if(result1>0) {
			
			result2 = new BoardDao().insertAttachmentList(conn, list);
		}


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
	
	public int insertReply(String content, int bno, int writer) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, content, bno, writer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	public ArrayList<Reply> selectReplyList (int bno){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, bno);
		
		close(conn);
		
		return list; 
	}
	
	public ArrayList<Attachment> selectAlbumInnerList (int bno){
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new BoardDao().selectAlbumInnerList(conn, bno);
		
		close(conn);
		
		return list; 
	}
	
	public Board selectAlbumBoard (int bno){
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectAlbumBoard(conn, bno);
		
		close(conn);
		
		return b; 
	}

}

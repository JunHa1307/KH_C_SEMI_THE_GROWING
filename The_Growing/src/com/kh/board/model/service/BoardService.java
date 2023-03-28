package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.Attachment;

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

}

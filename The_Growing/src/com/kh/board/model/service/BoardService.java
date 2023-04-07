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
	public int updateBoard(Board b,ArrayList<Attachment> list) {

		
		Connection conn = getConnection() ;
		
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1; // 애초에 insert나 update문이 실행조차 되지 않을 경우를 대비해서 1로 초기화 시킴 
		
		// 새롭게 첨부된 파일이 있는 경우에만 update, insert문을 실행시킴. 
		for(int i=0; i<list.size(); i++) {
			if(list.get(i)!=null) {
				System.out.println(list.get(i).toString());
				// 기존에 첨부파일이 있었을 경우 => update문을 실행하기 위해서 fileNo값이 필요함. 
				if(list.get(i).getFileNo() != 0) {
					int result12 = new BoardDao().deleteAttachment(conn, list.get(i).getRefBno(), list.get(i).getFileLevel()); 
					result2 = new BoardDao().reInsertAttachment(conn, list.get(i));
				}else { // 기존에 첨부파일이 없는 경우 => insert문에는 fileNo값이 필요없어서 at객체에 fileNo값이 안담겨있음 
					result2 = new BoardDao().reInsertAttachment(conn, list.get(i));
				}
			}
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	public int insertNotice(Board b) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertNotice(conn, b);
		
		// 트랜잭션처리
		if(result > 0) { // 성공
			//커밋
			commit(conn);
		}else { // 실패
			//롤백
			rollback(conn);
		}
		
		// 사용한 자원 반납. conn.close();
		close(conn);
		
		// 컨트롤로에게 결과값 반환(처리된 행의 갯수)
		return result;
	}
	
	public ArrayList<Board> selectNoticeList(int refCno) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectNoticeList(conn, refCno);
		close(conn);
		return list;
	}
}

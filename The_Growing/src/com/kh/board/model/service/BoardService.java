package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.NoticeCheck;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.Reply;

import com.kh.board.model.vo.Scrap;
import com.kh.common.JDBCTemplate;

import com.kh.classes.model.dao.ClassDao;
import com.kh.classes.model.vo.Class;

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
	
	public int insertReply(String content, int bno, int writer, String lock) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, content, bno, writer, lock);
		Board b = new BoardDao().selectBoard(conn, bno);
		
		 if(writer != b.getRefUno()) {
			 int insertNotice = new BoardDao().insertReplyNotice(conn, b.getRefUno(), writer, bno,b.getRefCno()); 
		 }
		
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
	

	public int deleteBoard(int bno, int uno, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno, uno);
		
		int result2 = 1;
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i) != null) {
				result2 = new BoardDao().deleteAttachment(conn, bno, list.get(i).getFileLevel());
			}
		}
		
		if(result > 0 && result2> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result * result2;
		
	}
	
	public int deleteAttachment(int bno, int level) {
		Connection conn = getConnection();
		
		int result =new BoardDao().deleteAttachment(conn, bno, level);
	
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int selectLike(int bno, int uno) {
		Connection conn = getConnection();
		int like  = new BoardDao().selectLike(conn, bno, uno);
		close(conn);
		return like;
	}
	
	public int deleteLike(int bno,  int uno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteLike(conn, bno, uno);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int insertLike(int bno,  int uno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertLike(conn, bno, uno);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int selectLikeCount(int bno) {
		Connection conn = getConnection();
		int like  = new BoardDao().selectLikeCount(conn, bno);
		close(conn);
		return like;
	}
	
	public ArrayList<Board> selectList(PageInfo pi, int cno){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi, cno);
		
		close(conn);
		
		return list;
	}
	public int selectListCount(int cno) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn, cno);
		
		close(conn);
		
		return listCount;
		
	}
	public int selectBoardListCount(int cno, int boardType) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectBoardListCount(conn, cno, boardType);
		
		close(conn);
		
		return listCount;
		
	}



	
	public ArrayList<Board> selectBoardList(PageInfo pi, int boardType, int cno){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, pi, boardType, cno);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> selectBoardList(PageInfo pi, int boardType, int cno, String search){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, pi, boardType, cno, search);
		
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
  
	
	 public int insertNotice(Board b) {
	 
	 Connection conn = getConnection();
	 
	 int result = new BoardDao().insertNotice(conn, b); 
	 Class c = new ClassDao().selectClass(conn, b.getRefCno(), b.getRefUno()); 
	 int count = new ClassDao().selectClassMemberCount(conn, c.getClassCode()); 
	 
	 for(int i = 1; i<= (count==0?1:count); i ++) { 
		 int result1 = new BoardDao().insertBoardNotice(conn,c.getClassCode(), i, b.getRefUno()); 
	 }
	 
	 if(result > 0) {
		 commit(conn);
	 }else {
		 rollback(conn); 
	 }
	 
	 close(conn);
	 
	 return result; 
	 }
	 
	
	public ArrayList<Board> selectNoticeList(int refCno) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectNoticeList(conn, refCno);
		close(conn);
		return list;
	}
	
	public Board selectNotice (int bno){
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectNotice(conn, bno);
		
		close(conn);
		
		return b; 
	}
	
	public Board updateNotice(Board b) {

		Connection conn = getConnection();
		
		int result = new BoardDao().updateNotice(conn, b);
		
		Board updateNotice = null;
		
		if(result > 0) { // 성공
			commit(conn);
			
			updateNotice = new BoardDao().selectNotice(conn, b.getBoardNo());

		}else {
			rollback(conn);
		}
		
		close(conn);
    		return updateNotice;
	}
		

	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	public int updateBoard(Board b) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, b);

		if(result > 0 ) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	


	
	public int insertBoard(Board b ) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
	

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
		
	}
	
	public int deleteBoard(int boardNo, int userNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo, userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteReply(conn, replyNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteNotice(int[] arr) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteNotice(conn, arr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	



public Reply selectReply(int rno ) {
	Connection conn = getConnection();
	
	Reply r = new BoardDao().selectReply(conn, rno);
	
	close(conn);
	
	return r;
}

public int selectCountReply(int bno ) {
	Connection conn = getConnection();
	
	int r = new BoardDao().selectCountReply(conn, bno);
	
	close(conn);
	
	return r;
}

	public int insertNoticeCheck(int uno, int cno, int bno, String checkUserName, int userLevel) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertNoticeCheck(conn, uno, cno, bno, checkUserName, userLevel);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	public ArrayList<NoticeCheck> selectUserName(int cno, int bno) {
		Connection conn = getConnection();
		
		ArrayList<NoticeCheck> noticeCheckList  = new BoardDao().selectUserName(conn, cno, bno);
		close(conn);
		
		return noticeCheckList;
	}
	
	public int twoNoCheck(int uno, int cno) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().twoNoCheck(conn, uno, cno);

		close(conn);
		
		return result;
	}
	
	public int threeNoCheck(int uno, int cno, int bno) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().threeNoCheck(conn, uno, cno, bno);

		close(conn);
		
		return result;
	}


	public int selectScrap(int bno,  int uno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().selectScrap(conn, bno, uno);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int insertScrap(int bno,  int uno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertScrap(conn, bno, uno);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int deleteScrap(int bno,  int uno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteScrap(conn, bno, uno);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Scrap> selectScrapList(int uno) {
		Connection conn = getConnection();
		
		ArrayList<Scrap> list = new BoardDao().selectScrapList(conn, uno);
		
		close(conn);
		
		return list;
		
	}
	
	public Scrap selectScrapForMy(int bno, int uno) {
		Connection conn = getConnection();
		
		Scrap s = new BoardDao().selectScrapForMy(conn, bno, uno);
		
		close(conn);
		
		return s;
		
	}
	
	public ArrayList<Integer> selectMyScrapList(int uno) {
		Connection conn = getConnection();
		
		ArrayList<Integer> list = new BoardDao().selectMyScrapList(conn, uno);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Board> selectMyScrapList2(int uno, ArrayList<Integer> arr) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectMyScrapList2(conn, uno, arr);
		
		close(conn);
		
		return list;
		
	}
	
}

package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.NoticeCheck;
import com.kh.board.model.vo.PageInfo;

import com.kh.board.model.vo.Reply;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;


public class BoardDao {
private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectAlbumList(Connection conn, int cno) {
		 
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAlbumList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {

				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				b.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	

	public int insertAlbumBoard(Connection conn, Board b) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAlbumBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setInt(4, b.getRefUno());
			pstmt.setInt(5, b.getRefCno());
	
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		int result = 1;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(Attachment at : list) {
			
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
			

				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
public ArrayList<Attachment> selectAttachList(Connection conn, int cno){
		
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectAttachList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
						
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



public int insertReply(Connection conn, String content, int bno, int writer) {
	int result = 0;
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("insertReply");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, content);
		pstmt.setInt(2, bno);
		pstmt.setInt(3, writer);
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	
	return result;
}

public ArrayList<Reply> selectReplyList(Connection conn, int bno){
	ArrayList<Reply> list = new ArrayList<>();
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectReplyList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {

			Reply r = new Reply();
			r.setReplyNo(rset.getInt("REPLY_NO"));
			r.setReplyContent(rset.getString("REPLY_CONTENT"));
			r.setCreateDate(rset.getString("CREATE_DATE"));
			r.setReplyWriter(rset.getString("USER_ID"));
			r.setFilePath(rset.getString("FILE_PATH"));
			r.setChangeName(rset.getString("CHANGE_NAME"));
			list.add(r);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	return list;
	
	
}


public ArrayList<Attachment> selectAlbumInnerList(Connection conn, int bno){
	ArrayList<Attachment> list = new ArrayList<>();
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectAlbumInnerList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {

			Attachment at = new Attachment();
			at.setFileNo(rset.getInt("FILE_NO"));
			at.setFilePath(rset.getString("FILE_PATH"));
			at.setChangeName(rset.getString("CHANGE_NAME"));
			at.setFileLevel(rset.getInt("FILE_LEVEL"));
			list.add(at);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	return list;
	
	
}


public Board selectAlbumBoard(Connection conn, int bno){
	Board b = null;
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectAlbumBoard");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {

			b = new Board();
			b.setBoardNo(rset.getInt("BOARD_NO"));
			b.setBoardTitle(rset.getString("BOARD_TITLE"));
			b.setBoardContent(rset.getString("BOARD_CONTENT"));
			b.setUserId(rset.getString("USER_ID"));
			b.setCreateDate(rset.getDate("CREATE_DATE"));
			b.setFilePath(rset.getString("FILE_PATH"));
			b.setChangeName(rset.getString("CHANGE_NAME"));
		
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	return b;
	
	
}

public int updateBoard(Connection conn, Board b) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("updateBoard");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, b.getBoardTitle() );
		pstmt.setString(2, b.getBoardContent());
		pstmt.setInt(3, b.getBoardNo());
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
}

public int updateAttachment(Connection conn, ArrayList<Attachment> list) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("updateAttachment");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		for(int i =1; i<=list.size(); i++) {
		pstmt.setString(1,list.get(i-1).getOriginName());
		pstmt.setString(2,list.get(i-1).getChangeName());
		pstmt.setString(3, list.get(i-1).getFilePath());
		pstmt.setInt(4, list.get(i-1).getFileNo());
		pstmt.setInt(5, list.get(i-1).getFileLevel());
		
		}
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
	
}

public int reInsertAttachment(Connection conn, Attachment at) {
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("reInsertAttachment");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		
			pstmt.setInt(1, at.getRefBno());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			pstmt.setInt(5, at.getFileLevel());
		
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
}

public int deleteAttachment(Connection conn, int bno, int filelevel) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("deleteAttachment");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setInt(1,bno);
		pstmt.setInt(2,filelevel);
	
		
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
	
}


public int deleteBoard(Connection conn, int bno) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("deleteBoard");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
	
	
}


public int selectLike(Connection conn, int bno, int uno){
	int like = 0;
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectLike");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		pstmt.setInt(2, uno);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {

			like = 1;
		
		
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	return like;
	
	
}

public int deleteLike(Connection conn, int bno, int uno) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("deleteLike");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		pstmt.setInt(2, uno);
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
	
}

public int insertLike(Connection conn, int bno, int uno) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("insertLike");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		pstmt.setInt(2, uno);
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
	
}


public int selectLikeCount(Connection conn, int bno){
	int like = 0;
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectLikeCount");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {

			like =rset.getInt("LIKES");
		
		
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	return like;
	
	
}

public ArrayList<Board> selectList(Connection conn, PageInfo pi, int cno){
	
	ArrayList<Board> list = new ArrayList<>();
	
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		/*
		 * boardLimit가 10이라고 가정
		 * currentPage 1을 요청시 -> 1 ~ 10 
		 * currentPage 2을 요청시 -> 11 ~ 20
		 * currentPage n을 요청시 -> 시작값 : (currentPage -1) * boardLimit + 1 ~ 시작값 + boardLimit -1 
		 */
		int startRow = ( pi.getCurrentPage() -1 ) * pi.getBoardLimit() + 1 ;
		int endRow = startRow + pi.getBoardLimit() -1; 
		
		pstmt.setInt(1, cno);
		pstmt.setInt(2, startRow);
		pstmt.setInt(3, endRow);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			Board b = new Board();
			b.setBoardNo(rset.getInt("BOARD_NO"));
			b.setBoardType(rset.getInt("BOARD_TYPE"));
			b.setBoardTitle(rset.getString("BOARD_TITLE"));
			b.setUserId(rset.getString("USER_ID"));
			b.setCreateDate(rset.getDate("CREATE_DATE"));
								
			list.add(b);
					
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return list;
}

public ArrayList<Board> selectBoardList(Connection conn, PageInfo pi, int boardType, int cno){
	
ArrayList<Board> list = new ArrayList<>();

PreparedStatement pstmt = null;

ResultSet rset = null;

String sql = prop.getProperty("selectBoardList");

try {
	pstmt = conn.prepareStatement(sql);
	int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
	int endRow = startRow + pi.getBoardLimit() - 1;
	
	pstmt.setInt(1, boardType);
	pstmt.setInt(2, cno);
	pstmt.setInt(3, startRow);
	pstmt.setInt(4, endRow);
	


	rset = pstmt.executeQuery();
	while(rset.next()) {
		Board b = new Board();
		b.setBoardNo(rset.getInt("BOARD_NO"));
		b.setUserId(rset.getString("USER_ID"));
		b.setBoardTitle(rset.getString("BOARD_TITLE"));
		b.setCreateDate(rset.getDate("CREATE_DATE"));
		b.setRefCno(rset.getInt("REF_CNO"));		
		b.setCount(rset.getInt("BOARD_COUNT"));
				           
		list.add(b);
	}
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	close(rset);
	close(pstmt);
}
return list;

}


public int selectListCount(Connection conn, int cno) {
	int listCount = 0; 
	
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectListCount");
	/*
	 * SELECT COUNT(*) AS COUNT
	 * FROM BOARD
	 * WHERE STATUS = 'Y'
	 *   AND BOARD_TYPE = 1
	 * 
	 */
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cno);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			listCount = rset.getInt("COUNT");
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return listCount;
}

public int selectBoardListCount(Connection conn, int cno, int boardType) {
	int listCount = 0; 
	
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectBoardListCount");
	/*
	 * SELECT COUNT(*) AS COUNT
	 * FROM BOARD
	 * WHERE STATUS = 'Y'
	 *   AND BOARD_TYPE = 1
	 * 
	 */
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cno);
		pstmt.setInt(2, boardType);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			listCount = rset.getInt("COUNT");
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return listCount;
}


public int insertBoard(Connection conn, Board b) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("insertBoard");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, b.getBoardType());
		pstmt.setString(2, b.getBoardTitle());
		pstmt.setString(3, b.getBoardContent());
		pstmt.setInt(4, b.getRefUno());
		pstmt.setInt(5, b.getRefCno());

		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
}

public int deleteBoard(Connection conn, int boardNo, int userNo) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("deleteBoard");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.setInt(2, userNo);
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
}

public int deleteReply(Connection conn, int replyNo) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("deleteReply");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, replyNo);
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
}

public int increaseCount(Connection conn , int boardNo) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("increaseCount");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		
		result = pstmt.executeUpdate();
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
}

public Board selectBoard(Connection conn, int boardNo) {
	
	Board b = null;
	
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectBoard");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			b = new Board();
			b.setBoardNo(rset.getInt("BOARD_NO")); 
			b.setBoardType(rset.getInt("BOARD_TYPE"));
			b.setBoardTitle(rset.getString("BOARD_TITLE"));
			b.setUserId(rset.getString("USER_ID"));
			b.setcDate(rset.getString("C_DATE"));
			b.setBoardContent(rset.getString("BOARD_CONTENT"));
					   
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return b;
}

	public int insertNotice(Connection conn, Board b) {
		//Insert문 => 처리된 행의 갯수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b.getBoardType());
			pstmt.setInt(2, b.getRefUno());
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardContent());
			pstmt.setInt(5, b.getRefCno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Board> selectNoticeList(Connection conn, int refCno) {
		 
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, refCno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {

				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Board selectNotice(Connection conn, int bno){
		Board b = null;
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setUserId(rset.getString("USER_ID"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	
	}
	
	public int updateNotice(Connection conn, Board b) {
		
		// UPDATE문 => 반환값 처리된 행의 갯수가 반환됨
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNotice");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteNotice(Connection conn, int[] arr) {
		
		int result = 1;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i = 0; i<arr.length; i++) {
				pstmt.setInt(1, arr[i]);
				result *= pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
	
	public Reply selectReply(Connection conn, int rno) {
		
		Reply r = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Reply();
				r.setReplyContent(rset.getString("REPLY_CONTENT"));
				r.setReplyNo(rset.getInt("REPLY_NO"));	   
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	public int selectCountReply(Connection conn, int bno) {
		
		int r =0;
    		String sql = prop.getProperty("selectCountReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				r = rset.getInt("R_COUNT");
				  
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
		

	public int insertNoticeCheck(Connection conn, int uno, int cno, int bno, String checkUserName, int userLevel) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNoticeCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			pstmt.setInt(2, cno);
			pstmt.setInt(3, bno);
			pstmt.setString(4, checkUserName);
			pstmt.setInt(5, userLevel);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<NoticeCheck> selectUserName(Connection conn, int cno, int bno) {
		 
		ArrayList<NoticeCheck> noticeCheckList = new ArrayList<>();

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		

		String sql = prop.getProperty("selectUserName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			pstmt.setInt(2, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {


				NoticeCheck c = new NoticeCheck();
				c.setUserName(rset.getString("USER_NAME"));
				c.setRefUno(rset.getInt("REF_UNO"));
				c.setRefCno(cno);
				c.setRefBno(bno);
				
				noticeCheckList.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeCheckList;
	}
	
  
  
  
	public int twoNoCheck(Connection conn, int uno, int cno) {
		
		int result = 0;

		PreparedStatement pstmt = null;
		// ResultSet은 db에서 질의결과 창에 나오는  
		// 그에해당하는 
 		ResultSet rset = null;
		
		String sql = prop.getProperty("twoNoCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			pstmt.setInt(2, cno);
			
			rset = pstmt.executeQuery();
			
			// 다음행이 존재한다면 값을 result에 넣기
			// select문일때만 rset.next()사용해서 다음행이 있는지없는지 검사
			// 다음행이 있다면 result변수에 컬럼의 값 얻어오기
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return result;
				
	}
	
public int threeNoCheck(Connection conn, int uno, int cno, int bno) {
		
		int result = 0;

		PreparedStatement pstmt = null;
		// ResultSet은 db에서 질의결과 창에 나오는  
		// 그에해당하는 
 		ResultSet rset = null;
		
		String sql = prop.getProperty("threeNoCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			pstmt.setInt(2, cno);
			pstmt.setInt(3, bno);
			
			rset = pstmt.executeQuery();
			
			// 다음행이 존재한다면 값을 result에 넣기
			// select문일때만 rset.next()사용해서 다음행이 있는지없는지 검사
			// 다음행이 있다면 result변수에 컬럼의 값 얻어오기
			if(rset.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return result;
				
	}
	
}


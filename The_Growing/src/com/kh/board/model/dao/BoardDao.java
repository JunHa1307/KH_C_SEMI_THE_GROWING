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
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.Attachment;

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

}


package com.kh.classes.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.classes.model.vo.Class;
import com.kh.common.model.vo.Attachment;

public class ClassDao {
	private Properties prop = new Properties();

	public ClassDao() {
		try {
			prop.loadFromXML(new FileInputStream(ClassDao.class.getResource("/sql/classes/class-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Class> selectClassList(Connection conn, int userNo) {

		ArrayList<Class> list = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectClassList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Class c = new Class(rset.getInt("REF_CNO"), rset.getInt("CLASS_GRADE"),
						rset.getInt("CLASS_CODE"), rset.getString("CLASS_NAME"), rset.getString("CLASS_TYPE_NAME"),
						rset.getString("CHANGE_NAME"),rset.getString("FILE_PATH"),rset.getString("TEACHER_NAME"),
						rset.getString("ATPT_OFCDC_SC_CODE"),rset.getInt("SD_SCHUL_CODE"),rset.getInt("USER_COUNT"));
				list.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertClass(Connection conn, Class c) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertClass");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getClassGrade());
			pstmt.setInt(2, c.getClassCode());
			pstmt.setString(3, c.getClassName());
			pstmt.setString(4, c.getClassTypeName());
			pstmt.setString(5, c.getTeacherName());
			pstmt.setString(6, c.getAtptOfcdcScCode());
			pstmt.setString(7, c.getSdSchulCode()+"");
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	public int insertClassMember(Connection conn, int classCode, int userNo, int studentNo) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertClassMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, classCode);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, studentNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	public int insertClassAttachment(Connection conn, Attachment at, int classCode) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertClassAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, classCode);
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<String> selectTableList(Connection conn, int userNo) {

		ArrayList<String> tableList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectTableList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				String table = rset.getString("TIME_TABLE_CONTENT");
				if(table != null) {
					tableList.add(table);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return tableList;
	}
	
	public int insertTable(Connection conn, int classCode, String row) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertTable");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, classCode);
			pstmt.setString(2, row);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	public int updateTable(Connection conn, int classNo, String arr) {
		
		// UPDATE臾� => 諛섑솚媛� 泥섎━�맂 �뻾�쓽 媛��닔媛� 諛섑솚�맖
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateTable");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, arr);
			pstmt.setInt(2, classNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	 public Class selectClass(Connection conn, int cno, int uno) {

	      Class cInfo = null;

	      PreparedStatement pstmt = null;

	      ResultSet rset = null;

	      String sql = prop.getProperty("selectClass");

	      try {
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, cno);
	         pstmt.setInt(2, uno);
	         
	         rset = pstmt.executeQuery();
	         if (rset.next()) {
	            cInfo = new Class();
	            cInfo.setClassNo(rset.getInt("CLASS_NO"));
	            cInfo.setClassName( rset.getString("CLASS_NAME"));
	            cInfo.setClassGrade(rset.getInt("CLASS_GRADE"));
	            cInfo.setClassTypeName(rset.getString("CLASS_TYPE_NAME"));
	            cInfo.setTeacherName(rset.getString("TEACHER_NAME"));
	            cInfo.setUserCount(rset.getInt("USER_COUNT"));
	            cInfo.setChangeName(rset.getString("CHANGE_NAME"));
	            cInfo.setFilePath(rset.getString("FILE_PATH"));
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      return cInfo;
	   }

	 public ArrayList<Class> selectMyClass(Connection conn, int userNo) {

			ArrayList<Class> list = new ArrayList<>();

			PreparedStatement pstmt = null;

			ResultSet rset = null;

			String sql = prop.getProperty("selectMyClass");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, userNo);
				
				rset = pstmt.executeQuery();
				while (rset.next()) {
					Class c = new Class();
		            c.setClassNo(rset.getInt("REF_CNO"));
		            c.setClassDate(rset.getInt("CLASS_DATE"));
		            c.setClassGrade(rset.getInt("CLASS_GRADE"));
		            c.setClassName( rset.getString("CLASS_NAME"));
		            c.setClassTypeName(rset.getString("CLASS_TYPE_NAME"));
		            c.setTeacherName(rset.getString("TEACHER_NAME"));
		            c.setUserCount(rset.getInt("USER_COUNT"));
		            c.setChangeName(rset.getString("CHANGE_NAME"));
		            c.setFilePath(rset.getString("FILE_PATH"));
					list.add(c);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
	
	public ArrayList<String> selectCalendarList(Connection conn, int userNo) {

		ArrayList<String> calendarList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectCalendarList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				String calendar = rset.getString("S_CONTENT");
				if(calendar != null) {
					calendarList.add(calendar);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return calendarList;
	}
	
	public int insertCalendar(Connection conn, int classCode, String data) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertCalendar");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, data);
			pstmt.setInt(2, classCode);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	public int updateCalendar(Connection conn, int classNo, String arr) {
		
		// UPDATE臾� => 諛섑솚媛� 泥섎━�맂 �뻾�쓽 媛��닔媛� 諛섑솚�맖
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCalendar");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, arr);
			pstmt.setInt(2, classNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	 public ArrayList<String> selectAttendTable(Connection conn, int cno, int month) {
	
		ArrayList<String> attendTable = new ArrayList<String>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttendTable");
		
		try {
		   pstmt = conn.prepareStatement(sql);
		
		   pstmt.setInt(1, cno);
		   pstmt.setInt(2, month);
		     
		   rset = pstmt.executeQuery();
		   if (rset.next()) {
			   attendTable = new ArrayList<String>(Arrays.asList(rset.getString("A_CONTENT").split(",")));
	       }
		
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   close(rset);
		   close(pstmt);
		}
		return attendTable;
	 }	
	 
	public int insertAttendTable(Connection conn, int cno, String arr, int month) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAttendTable");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			pstmt.setString(2, arr);
			pstmt.setInt(3, month);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	public ArrayList<String> selectClassMemberName(Connection conn, int cno) {
		
		ArrayList<String> memberName = new ArrayList<String>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectClassMemberName");
		
		try {
		   pstmt = conn.prepareStatement(sql);
		
		   pstmt.setInt(1, cno);
		     
		   rset = pstmt.executeQuery();
		   
		   while (rset.next()) {
			   memberName.add(rset.getString("USER_NAME"));
			   memberName.add(rset.getInt("REF_UNO")+"");
	       }
		
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   close(rset);
		   close(pstmt);
		}
		return memberName;
	 }	
	
	public int updateAttendTable(Connection conn, String arr, int classNo, int month) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttendTable");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, arr);
			pstmt.setInt(2, classNo);
			pstmt.setInt(3, month);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateClass(Connection conn, Class c, int uno) {
		
		// UPDATE臾� => 諛섑솚媛� 泥섎━�맂 �뻾�쓽 媛��닔媛� 諛섑솚�맖
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateClass");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getClassGrade());
			pstmt.setString(2, c.getClassName());
			pstmt.setInt(3, c.getClassNo());
			pstmt.setInt(4, uno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertNewAttachment(Connection conn, Attachment at) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertNewAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, at.getRefCno());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Attachment selectAttachment(Connection conn, int cno) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setUploadDate(rset.getDate("UPLOAD_DATE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	/*
	 * public int deleteClass(Connection conn, int cno) { int result = 0;
	 * 
	 * PreparedStatement pstmt = null;
	 * 
	 * String sql = prop.getProperty("deleteClass");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, userId); pstmt.setString(2, userPwd);
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
	 * 
	 * return result;
	 * 
	 * }
	 */
	
}

package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.MemberNotice;
import com.kh.member.model.vo.SnsLogin;


public class MemberDao {
	
	private Properties prop = new Properties();

	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Member m) {
		//Insert문 => 처리된 행의 갯수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setInt(6, m.getUserLevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int insertMemberApi(Connection conn, Member loginUser, SnsLogin snsLoginUser) {
		//Insert문 => 처리된 행의 갯수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMemberApi");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, loginUser.getUserId());
			pstmt.setString(2, loginUser.getUserName());
			pstmt.setInt(3, loginUser.getUserLevel());
			pstmt.setString(4, snsLoginUser.getSnsId());
			pstmt.setString(5, snsLoginUser.getSnsName());
			pstmt.setString(6, snsLoginUser.getSnsType());
			pstmt.setString(7, snsLoginUser.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int idCheck(Connection conn, String userId) {
		
		int result = 0;

		PreparedStatement pstmt = null;
		// ResultSet은 db에서 질의결과 창에 나오는  
		// 그에해당하는 
 		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// pstmt ? 값 채우기
			pstmt.setString(1, userId);
			
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
	
	public int idNlevelCheck(Connection conn, String userId, int userLevel) {
		
		int result = 0;

		PreparedStatement pstmt = null;
		// ResultSet은 db에서 질의결과 창에 나오는  
		// 그에해당하는 
 		ResultSet rset = null;
		
		String sql = prop.getProperty("idNlevelCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// pstmt ? 값 채우기
			pstmt.setString(1, userId);
			pstmt.setInt(2, userLevel);
			
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
	
	public Member loginMember(Connection conn, String userId, String userPwd, int userLevel) {
		
		// Select문 => ResultSet객체(조회된 행은 1개이거나 없거나)
		Member m = null;
		
		ResultSet rset= null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			pstmt.setInt(3, userLevel);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
						       rset.getString("USER_ID"),
						       rset.getString("USER_PWD"),
						       rset.getString("USER_NAME"),
						       rset.getString("PHONE"),
						       rset.getString("ADDRESS"),
						       rset.getDate("ENROLL_DATE"),
						       rset.getDate("MODIFY_DATE"),
						       rset.getString("STATUS"),
						       rset.getString("CHILDREN_NAME"),
						       rset.getInt("USER_LEVEL"),
						       rset.getString("CHANGE_NAME"),
						       rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return m;		
	}

	public Member snsLoginMember(Connection conn, int userNo, String snsId, int userLevel) {
		
		// Select문 => ResultSet객체(조회된 행은 1개이거나 없거나)
		Member m = null;
		
		ResultSet rset= null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("snsLoginMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, snsId);
			pstmt.setInt(3, userLevel);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
						       rset.getString("USER_ID"),
						       rset.getString("USER_PWD"),
						       rset.getString("USER_NAME"),
						       rset.getString("PHONE"),
						       rset.getString("ADDRESS"),
						       rset.getDate("ENROLL_DATE"),
						       rset.getDate("MODIFY_DATE"),
						       rset.getString("STATUS"),
						       rset.getString("CHILDREN_NAME"),
						       rset.getInt("USER_LEVEL"),
						       rset.getString("CHANGE_NAME"),
						       rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return m;		
	}	
	
	
public Member loginMemberInfo(Connection conn, int uno) {
		
		// Select문 => ResultSet객체(조회된 행은 1개이거나 없거나)
		Member m = null;
		
		ResultSet rset= null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMemberInfo");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
						       rset.getString("USER_ID"),
						       rset.getString("USER_PWD"),
						       rset.getString("USER_NAME"),
						       rset.getString("PHONE"),
						       rset.getString("ADDRESS"),
						       rset.getDate("ENROLL_DATE"),
						       rset.getDate("MODIFY_DATE"),
						       rset.getString("STATUS"),
						       rset.getString("CHILDREN_NAME"),
						       rset.getInt("USER_LEVEL"));
						 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return m;		
	}
	
	public int selectUserNo(Connection conn, String userId, int userLevel) {
		
		// Select문 => ResultSet객체(조회된 행은 1개이거나 없거나)
		Member m = null;
		
		ResultSet rset= null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectUserNo");
		
		int userNo = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, userLevel);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userNo = rset.getInt("USER_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return userNo;		
	}	
		
	public int deleteMember(Connection conn, String userId, String userPwd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			
		}
		return result;
				
					
	}
	
	public String[] selectSnsType(Connection conn, int uno) {
		String[] snsType = new String[2];
		
		PreparedStatement pstmt = null;
		
		ResultSet rset= null;
		
		String sql = prop.getProperty("selectSnsType");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				snsType[0] = rset.getInt("SNS_TYPE")+"";
				snsType[1] = rset.getString("SNS_ENROLL_DATE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return snsType;
	}
		
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getChildrenName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setInt(6, m.getUserNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
		
	public int selectAttachmentNo(Connection conn, String changeName) {
		int ano = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset= null;
		
		String sql = prop.getProperty("selectAttachmentNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, changeName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ano = rset.getInt("FILE_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ano;
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
	
	public int deleteAttachment(Connection conn, int uno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			
		}
		return result;
					
	}
	
	public int reInsertAttachment(Connection conn, Attachment at) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("reInsertAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, at.getRefUno());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePassword(Connection conn, int uno, String oldPwd, String newPwd) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updatePassword");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setInt(2, uno);
			pstmt.setString(3, oldPwd);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public ArrayList<Member> selectUserName(Connection conn, int uno) {
		 
		ArrayList<Member> noticeCheckList = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {

				Member m = new Member();
				m.setUserNo(uno);
				m.setUserName(rset.getString("USER_NAME"));
				
				noticeCheckList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeCheckList;
	}

	
	public ArrayList<Member> selectMemberList(Connection conn, int classNo) {

		ArrayList<Member> memberList = new ArrayList<Member>();
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectMemberList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, classNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				memberList.add(new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
						rset.getString("USER_NAME"), rset.getString("PHONE"), rset.getString("ADDRESS"),
						rset.getDate("ENROLL_DATE"), rset.getDate("MODIFY_DATE"), rset.getString("STATUS"),
						rset.getString("CHILDREN_NAME"), rset.getInt("USER_LEVEL"), rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberList;
	}

	public Member selectMember(Connection conn, int userNo) {
		Member m = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				m = new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
						rset.getString("USER_NAME"), rset.getString("PHONE"), rset.getString("ADDRESS"),
						rset.getDate("ENROLL_DATE"), rset.getDate("MODIFY_DATE"), rset.getString("STATUS"),
						rset.getString("CHILDREN_NAME"), rset.getInt("USER_LEVEL"), rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return m;
	}
	
	public ArrayList<MemberNotice> selectMemberNoticeList(Connection conn, int uno){
		ArrayList<MemberNotice> list = new ArrayList<MemberNotice>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new MemberNotice(
						rset.getInt("REF_UNO"), rset.getInt("REF_CNO"), rset.getInt("INTERACTION_NO"), rset.getInt("REF_BNO"), rset.getString("NOTICE_DATE"),
						rset.getInt("NOTICE_TYPE"), rset.getString("USER_NAME"), rset.getString("INTERACTION_NAME"), rset.getString("CLASS_NAME"), rset.getString("BOARD_TITLE")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
}

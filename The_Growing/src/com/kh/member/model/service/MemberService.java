package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.SnsLogin;

public class MemberService {
	
	public int insertMember(Member m) {
		// 반환형 int : 처리된 행의 갯수.
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		// 트랜잭션처리
		if(result > 0) { // 성공
			//커밋
			JDBCTemplate.commit(conn);
		}else { // 실패
			//롤백
			JDBCTemplate.rollback(conn);
		}
		
		// 사용한 자원 반납. conn.close();
		JDBCTemplate.close(conn);
		
		// 컨트롤로에게 결과값 반환(처리된 행의 갯수)
		return result;
	}
	
	public int insertMemberApi(Member loginUser, SnsLogin snsLoginUser) {
		// 반환형 int : 처리된 행의 갯수.
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMemberApi(conn, loginUser, snsLoginUser);
		
		// 트랜잭션처리
		if(result > 0) { // 성공
			//커밋
			JDBCTemplate.commit(conn);
		}else { // 실패
			//롤백
			JDBCTemplate.rollback(conn);
		}
		
		// 사용한 자원 반납. conn.close();
		JDBCTemplate.close(conn);
		
		// 컨트롤로에게 결과값 반환(처리된 행의 갯수)
		return result;
	}
	
	public int idCheck(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		// MemberDao()에서 sql문 실행
		int result = new MemberDao().idCheck(conn, userId);

		// 트랜잭션 처리 안해도됨
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int idNlevelCheck(String userId, int userLevel) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		// MemberDao()에서 sql문 실행
		int result = new MemberDao().idNlevelCheck(conn, userId, userLevel);

		// 트랜잭션 처리 안해도됨
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public Member loginMember(String userId, String userPwd, int userLevel) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd, userLevel);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	public Member snsLoginMember(int userNo, String snsId, int userLevel) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().snsLoginMember(conn, userNo, snsId, userLevel);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	public Member loginMemberInfo(int uno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMemberInfo(conn, uno);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	public int selectUserNo(String userId, int userLevel) {
		Connection conn = JDBCTemplate.getConnection();
		
		int userNo = new MemberDao().selectUserNo(conn, userId, userLevel);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userNo;
	}
	
	public int deleteMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
			} else {
				rollback(conn);
			}

			close(conn);
		return result;
	}
	
	public int[] selectSnsType(int uno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int[] type = new MemberDao().selectSnsType(conn, uno);
		
		return type;
	}
	
	public int updateMember(Member m) {
		Connection conn = getConnection() ;
		
		int result= new MemberDao().updateMember(conn, m);
	
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;	
	}
	
	public int selectAttachmentNo(String changeName) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int ano = new MemberDao().selectAttachmentNo(conn,changeName);
		
		return ano;
	}
	
	public int updateAttachment(Attachment at) {
		
		Connection conn = getConnection();

		int result = 1;

		if (at != null) {
			if (at.getFileNo() != 0) {
				result = new MemberDao().updateAttachment(conn, at);
			}else {	
				result = new MemberDao().reInsertAttachment(conn, at);
			}
		}

		if ( result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updatePassword(int uno, String oldPwd, String newPwd) {
		
		Connection conn = getConnection();

		int result = new MemberDao().updatePassword(conn, uno, oldPwd, newPwd);

		if ( result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	

	public ArrayList<Member> selectUserName(int uno) {
		Connection conn = getConnection();
		
		ArrayList<Member> noticeCheckList  = new MemberDao().selectUserName(conn, uno);
		close(conn);
		
		return noticeCheckList;
	}
	

}

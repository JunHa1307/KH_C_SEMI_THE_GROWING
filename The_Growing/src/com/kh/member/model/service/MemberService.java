package com.kh.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

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
	
	public int idCheck(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		// MemberDao()에서 sql문 실행
		int result = new MemberDao().idCheck(conn, userId);

		// 트랜잭션 처리 안해도됨
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
}

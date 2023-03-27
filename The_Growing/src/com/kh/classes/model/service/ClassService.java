package com.kh.classes.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.classes.model.dao.ClassDao;
import com.kh.classes.model.vo.Class;
import com.kh.common.model.vo.Attachment;

public class ClassService {
	
	public ArrayList<Class> selectClassList(int userNo) {
		Connection conn = getConnection();

		ArrayList<Class> list = new ClassDao().selectClassList(conn, userNo);

		close(conn);

		return list;

	}
	
	public int insertClass(Class c, Attachment at, int refUno) {

		Connection conn = getConnection();

		int result1 = new ClassDao().insertClass(conn, c, c.getClassCode());
		int result2 = new ClassDao().insertClassMember(conn, refUno, c.getClassCode());
		// attachment테이블 등록여부 판단할 변수
		int result3 = 1;// 1로 미리 선언과 동시에 초기화 시키는 이유는 attachment테이블에 insert문이 실행되지 않을 수 있으므로

		if (at != null) {
			result3 = new ClassDao().updateAttachment(conn, at);
		}

		// 트랜잭션 처리
		if (result1 > 0 && result2 > 0 && result3 > 0) {
			// 첨부파일이 없는 경우 insert가 성공했을 때도 result2는 여전히 0이기 때문에 rollback처리가 될 수 있음
			// 따라서 애초에 result2의 값을 1로 초기화시켜줘야한다
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2 * result3; // 혹시 하나라도 실패해서 0이 반환될경우 실패값을 반환하기위해 곱셈결과를 리턴
	}
}

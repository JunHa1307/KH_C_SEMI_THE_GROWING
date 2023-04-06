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

		int result1 = new ClassDao().insertClass(conn, c);
		int result2 = new ClassDao().insertClassMember(conn, c.getClassCode(), refUno, 0);
		int result4 = new ClassDao().insertTable(conn, c.getClassCode(), "[{\"name\":\"\",\"mon\":\"\",\"tue\":\"\",\"wed\":\"\",\"thur\":\"\",\"fri\":\"\",\"sat\":\"\"}]");
		int result5 = new ClassDao().insertCalendar(conn, c.getClassCode(), "[]");
		
		// attachment�뀒�씠釉� �벑濡앹뿬遺� �뙋�떒�븷 蹂��닔
		int result3 = 1;// 1濡� 誘몃━ �꽑�뼵怨� �룞�떆�뿉 珥덇린�솕 �떆�궎�뒗 �씠�쑀�뒗 attachment�뀒�씠釉붿뿉 insert臾몄씠 �떎�뻾�릺吏� �븡�쓣 �닔 �엳�쑝誘�濡�

		if (at != null) {
			result3 = new ClassDao().insertClassAttachment(conn, at, c.getClassCode());
		}

		// �듃�옖�옲�뀡 泥섎━
		if (result1 > 0 && result2 > 0 && result3 > 0) {
			// 泥⑤��뙆�씪�씠 �뾾�뒗 寃쎌슦 insert媛� �꽦怨듯뻽�쓣 �븣�룄 result2�뒗 �뿬�쟾�엳 0�씠湲� �븣臾몄뿉 rollback泥섎━媛� �맆 �닔 �엳�쓬
			// �뵲�씪�꽌 �븷珥덉뿉 result2�쓽 媛믪쓣 1濡� 珥덇린�솕�떆耳쒖쨾�빞�븳�떎
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2 * result3 * result4 * result5; // �샊�떆 �븯�굹�씪�룄 �떎�뙣�빐�꽌 0�씠 諛섑솚�맆寃쎌슦 �떎�뙣媛믪쓣 諛섑솚�븯湲곗쐞�빐 怨깆뀍寃곌낵瑜� 由ы꽩
	}
	
	public int insertClassMember(int code, int userNo) {
		Connection conn = getConnection();
		
		int result = new ClassDao().insertClassMember(conn, code, userNo, 0);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<String> selectTableList(int userNo) {
		
		Connection conn = getConnection();

		ArrayList<String> list = new ClassDao().selectTableList(conn, userNo);

		close(conn);

		return list;

	}
	
	public int updateTable(int classNo, String arr) {
		
		Connection conn = getConnection();
		
		int result = new ClassDao().updateTable(conn, classNo, arr);
		
		if(result > 0) { // �꽦怨�
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	public Class selectClass(int cno, int uno) {
	      Connection conn = getConnection();

	      Class cInfo = new ClassDao().selectClass(conn, cno, uno);

	      close(conn);

	      return cInfo;

	   }
	public ArrayList<Class> selectMyClass(int userNo) {
		Connection conn = getConnection();

		ArrayList<Class> list = new ClassDao().selectMyClass(conn, userNo);
		
		close(conn);

		return list;

	}
	
	public ArrayList<String> selectCalendarList(int userNo) {
		
		Connection conn = getConnection();

		ArrayList<String> list = new ClassDao().selectCalendarList(conn, userNo);

		close(conn);

		return list;

	}
	


	public int updateCalendar(int classNo, String arr) {
		
		Connection conn = getConnection();
		
		int result = new ClassDao().updateCalendar(conn, classNo, arr);
		
		if(result > 0) { 
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	
	public ArrayList<String> selectAttendTable(int cno, int month) {
	      Connection conn = getConnection();

	      ArrayList<String> attendTable = new ClassDao().selectAttendTable(conn, cno, month);
	      close(conn);

	      return attendTable;

	}
	
	public int insertAttendTable(int cno, String arr, int month) {
		Connection conn = getConnection();
		
		int result = new ClassDao().insertAttendTable(conn, cno, arr, month);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<String> selectClassMemberName(int cno) {
	      Connection conn = getConnection();

	      ArrayList<String> memberName = new ClassDao().selectClassMemberName(conn, cno);
	      close(conn);

	      return memberName;
	}
	
	public int updateAttendTable(String arr, int classNo, int month) {
		
		Connection conn = getConnection();
		
		int result = new ClassDao().updateAttendTable(conn, arr, classNo, month);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	
	public int updateClass(Class c, Attachment at, int uno) {
		
		Connection conn = getConnection();
		
		int result1 = new ClassDao().updateClass(conn, c, uno);
		
		int result2 = 1;
		
		/* Class updateClass = null; */
 		
		if(at != null) {
			if(at.getFileNo() != 0) {
				result2 = new ClassDao().updateAttachment(conn,at);
			}else {
				result2 = new ClassDao().insertNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
			
			/* updateClass = new ClassDao().selectClass(conn, c.getClassNo(), uno); */
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result1*result2;
	}
	
	public Attachment selectAttachment(int cno) {
		Connection conn = getConnection();
		
		Attachment at = new ClassDao().selectAttachment(conn, cno);
		
		close(conn);
		
		return at;
	}
	
	/*
	 * public int deleteClass(int cno, Attachment at) {
	 * 
	 * Connection conn = getConnection();
	 * 
	 * int result = new ClassDao().deleteClass(conn, cno); int result2 = 1;
	 * 
	 * if( at != null) { result2 = new ClassDao().deleteAttachment(conn, cno); }
	 * 
	 * if(result > 0 && result2 > 0 ) { commit(conn); }else { rollback(conn); }
	 * close(conn);
	 * 
	 * return result*result2; }
	 */
}

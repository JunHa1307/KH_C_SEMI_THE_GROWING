package com.kh.classes.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.classes.model.dao.ClassDao;
import com.kh.classes.model.vo.Class;

public class ClassService {
	
	public ArrayList<Class> selectClassList(int userNo) {
		Connection conn = getConnection();

		ArrayList<Class> list = new ClassDao().selectClassList(conn, userNo);

		close(conn);

		return list;

	}
}

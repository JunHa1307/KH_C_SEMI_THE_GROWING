package com.kh.board.model.vo;

public class NoticeCheck {
	
	private int refUno; 
	private int refCno;
	private int refBno;
	private String userName;
	private int userLevel;
	
	public NoticeCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeCheck(int refUno, int refCno, int refBno, String userName, int userLevel) {
		super();
		this.refUno = refUno;
		this.refCno = refCno;
		this.refBno = refBno;
		this.userName = userName;
		this.userLevel = userLevel;
	}

	public int getRefUno() {
		return refUno;
	}

	public void setRefUno(int refUno) {
		this.refUno = refUno;
	}

	public int getRefCno() {
		return refCno;
	}

	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	@Override
	public String toString() {
		return "NoticeCheck [refUno=" + refUno + ", refCno=" + refCno + ", refBno=" + refBno + ", userName=" + userName
				+ ", userLevel=" + userLevel + "]";
	}
	
	
}

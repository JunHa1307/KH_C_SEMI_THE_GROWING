package com.kh.member.model.vo;

import java.sql.Timestamp;

public class MemberNotice {
	private int refUno;
	private int refCno;
	private int interactionNo;
	private int refBno;
	private Timestamp noticeDate;
	private int noticeType;
	private String userName;
	private String interactionName;
	private String className;
	private String boardTitle;
	
	public MemberNotice() {
		super();
	}
	
	public MemberNotice(int refUno, int refCno, int interactionNo, int refBno, Timestamp noticeDate, int noticeType,
			String userName, String interactionName, String className, String boardTitle) {
		super();
		this.refUno = refUno;
		this.refCno = refCno;
		this.interactionNo = interactionNo;
		this.refBno = refBno;
		this.noticeDate = noticeDate;
		this.noticeType = noticeType;
		this.userName = userName;
		this.interactionName = interactionName;
		this.className = className;
		this.boardTitle = boardTitle;
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

	public int getInteractionNo() {
		return interactionNo;
	}

	public void setInteractionNo(int interactionNo) {
		this.interactionNo = interactionNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public Timestamp getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getInteractionName() {
		return interactionName;
	}

	public void setInteractionName(String interactionName) {
		this.interactionName = interactionName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
}

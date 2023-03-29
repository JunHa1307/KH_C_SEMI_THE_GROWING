package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private int boardType;
	private int refUno;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private int likes;
	private Date createDate;
	private String status;
	private String secretStatus;
	private int refCno;
	
	public Board() {
		super();
	}

	public Board(int boardNo, int boardType, int refUno, String boardTitle, String boardContent, int boardCount,
			int likes, Date createDate, String status, String secretStatus, int refCno) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.refUno = refUno;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.likes = likes;
		this.createDate = createDate;
		this.status = status;
		this.secretStatus = secretStatus;
		this.refCno = refCno;
	}
	
	
	
	public Board(int boardNo,  String boardTitle, int refUno, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.refUno = refUno;
		this.boardTitle = boardTitle;
		this.createDate = createDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public int getRefUno() {
		return refUno;
	}

	public void setRefUno(int refUno) {
		this.refUno = refUno;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSecretStatus() {
		return secretStatus;
	}

	public void setSecretStatus(String secretStatus) {
		this.secretStatus = secretStatus;
	}

	public int getRefCno() {
		return refCno;
	}

	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", refUno=" + refUno + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount + ", likes=" + likes
				+ ", createDate=" + createDate + ", status=" + status + ", secretStatus=" + secretStatus + ", refCno="
				+ refCno + "]";
	}
	
	
	
}

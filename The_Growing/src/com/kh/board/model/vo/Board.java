package com.kh.board.model.vo;

import java.sql.Date;

public class Board {

//	BOARD_NO
//	BOARD_TYPE
//	REF_UNO
//	BOARD_TITLE
//	BOARD_CONTENT
//	BOARD_COUNT
//	LIKES
//	CREATE_DATE
//	STATUS
//	SECRET_STATUS
//	REF_CNO
	
//	NUMBER
//	NUMBER
//	NUMBER
//	VARCHAR2(60 BYTE)
//	VARCHAR2(3000 BYTE)
//	NUMBER
//	NUMBER
//	DATE
//	VARCHAR2(1 BYTE)
//	VARCHAR2(1 BYTE)
//	NUMBER
	
	private int boardNo;
	private int boardType; //게시글타입(1~5)
	private int refUno; 
	private String boardTitle;
	private String boardContent;
	private int count;
	private int likes;
	private Date createDate;
	private String status;
	private String secretStatus;
	private int refCno;
	private String userId;
	private String titleImg; 
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Board(int boardNo, int boardType, int refUno, String boardTitle, String boardContent, int count, int likes,
			Date createDate, String status, String secretStatus, int refCno, String userId, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.refUno = refUno;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.likes = likes;
		this.createDate = createDate;
		this.status = status;
		this.secretStatus = secretStatus;
		this.refCno = refCno;
		this.userId = userId;
		this.titleImg = titleImg;
	}

	
	public Board(int boardNo, String userId, String boardTitle, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.createDate = createDate;
	}
	
	


	public Board(int boardNo, int boardType, String boardTitle, int refUno, Date createDate, String boardContent) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.refUno = refUno;
		this.createDate = createDate;
		this.boardContent = boardContent;
	}



	public int getBoardNo() {
		return boardNo;
	}


	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
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



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
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



	public String getTitleImg() {
		return titleImg;
	}



	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}



	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", refUno=" + refUno + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", count=" + count + ", likes=" + likes
				+ ", createDate=" + createDate + ", status=" + status + ", secretStatus=" + secretStatus + ", refCno="
				+ refCno + "]";
	}
	
	
	
	
	
}

package com.kh.board.model.vo;

import java.sql.Date;

public class Reply {


//	REPLY_NO	NUMBER
//	REF_BNO	NUMBER
//	REPLY_WRITER	NUMBER
//	REPLY_CONTENT	VARCHAR2(500 BYTE)
//	CREATE_DATE	DATE
//	STATUS	VARCHAR2(1 BYTE)
//	REPLY_SECRET	VARCHAR2(1 BYTE)
	
	private int replyNo;
	private int refBno;
	private String replyWriter;
	private String replyContent;
	private String createDate;
	private String status;
	private String replySecret;
	private int rCount;
	private String filePath;
	private String changeName;
	
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reply(int replyNo, int refBno, String replyWriter, String replyContent, String createDate, String status,

			String replySecret) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
		this.replySecret = replySecret;
	}


	
	
	
	public Reply(int replyNo, int refBno, String replyWriter, String replyContent, String createDate, String status,
			String replySecret, int rCount) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
		this.replySecret = replySecret;
		this.rCount = rCount;
	}

	
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}



	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {

		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {

		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReplySecret() {
		return replySecret;
	}

	public void setReplySecret(String replySecret) {
		this.replySecret = replySecret;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", refBno=" + refBno + ", replyWriter=" + replyWriter + ", replyContent="
				+ replyContent + ", createDate=" + createDate + ", status=" + status + ", replySecret=" + replySecret
				+ ", rCount=" + rCount + ", filePath=" + filePath + ", changeName=" + changeName + "]";
	}




	

}

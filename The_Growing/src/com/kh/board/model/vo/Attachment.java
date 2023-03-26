package com.kh.board.model.vo;

import java.sql.Date;

public class Attachment {
	
//	FILE_NO	NUMBER
//	REF_BNO	NUMBER
//	REF_UNO	NUMBER
//	REF_CNO	NUMBER
//	ORIGIN_NAME	VARCHAR2(300 BYTE)
//	CHANGE_NAME	VARCHAR2(300 BYTE)
//	FILE_PATH	VARCHAR2(1000 BYTE)
//	UPLOAD_DATE	DATE
//	FILE_LEVEL	NUMBER
	
	private int fileNo;
	private int refBno;
	private int refUno;
	private int refCno;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel; // 파일레벨(1:메인사진/2:사이드사진)
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Attachment(int fileNo, int refBno, int refUno, int refCno, String originName, String changeName,
			String filePath, Date uploadDate, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.refBno = refBno;
		this.refUno = refUno;
		this.refCno = refCno;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
	}
	
	
	public int getFileNo() {
		return fileNo;
	}
	
	
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	
	
	public int getRefBno() {
		return refBno;
	}
	
	
	public void setRefBno(int refBno) {
		this.refBno = refBno;
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
	
	
	public String getOriginName() {
		return originName;
	}
	
	
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	
	
	public String getChangeName() {
		return changeName;
	}
	
	
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	
	
	public String getFilePath() {
		return filePath;
	}
	
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	public Date getUploadDate() {
		return uploadDate;
	}
	
	
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	
	public int getFileLevel() {
		return fileLevel;
	}
	
	
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	
	
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refBno=" + refBno + ", refUno=" + refUno + ", refCno=" + refCno
				+ ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + "]";
	}
	
	
	
	
	
	
	

}

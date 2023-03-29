package com.kh.member.model.vo;

import java.sql.Date;

public class SnsLogin {
	
	/*
	 * USER_NO SNS_ID SNS_NAME SNS_TYPE PROFILE_IMAGE_NAME FILE_PATH SNS_ENROLL_DATE
	 * STATUS
	 */
	
	private int userNo;
	private String snsId;
	private String snsName;
	private String snsType;
	private String profileImageName;
	private String filePath;
	private Date snsEnrollDate;
	private String status;
	
	public SnsLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SnsLogin(int userNo, String snsId, String snsName, String snsType, String profileImageName, String filePath,
			Date snsEnrollDate, String status) {
		super();
		this.userNo = userNo;
		this.snsId = snsId;
		this.snsName = snsName;
		this.snsType = snsType;
		this.profileImageName = profileImageName;
		this.filePath = filePath;
		this.snsEnrollDate = snsEnrollDate;
		this.status = status;
	}

	public SnsLogin(String snsId, String snsName, String snsType, String filePath) {
		super();
		
		this.snsId = snsId;
		this.snsName = snsName;
		this.snsType = snsType;
		this.filePath = filePath;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	
	public String getSnsName() {
		return snsName;
	}

	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}

	public String getSnsType() {
		return snsType;
	}

	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}

	public String getProfileImageName() {
		return profileImageName;
	}

	public void setProfileImageName(String profileImageName) {
		this.profileImageName = profileImageName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getSnsEnrollDate() {
		return snsEnrollDate;
	}

	public void setSnsEnrollDate(Date snsEnrollDate) {
		this.snsEnrollDate = snsEnrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SnsLogin [userNo=" + userNo + ", snsId=" + snsId + ", snsType=" + snsType + ", profileImageName="
				+ profileImageName + ", filePath=" + filePath + ", snsEnrollDate=" + snsEnrollDate + ", status="
				+ status + "]";
	}
	
	
}

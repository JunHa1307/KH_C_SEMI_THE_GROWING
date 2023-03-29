package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
//	USER_NO
//	USER_ID
//	USER_PWD
//	USER_NAME
//	PHONE
//	ADDRESS
//	ENROLL_DATE
//	MODIFY_DATE
//	STATUS
//	CHILDREN_NAME
//	USER_LEVEL
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String address;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String childrenName;
	private int userLevel; // 1:선,2:부,3:학
	
	public Member() {
		super();
	}

	public Member(int userNo, String userId, String userPwd, String userName, String phone, String address,
			Date enrollDate, Date modifyDate, String status, String childrenName, int userLevel) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.childrenName = childrenName;
		this.userLevel = userLevel;
	}
	
	public Member(String userId, String userPwd, String userName, String phone, String address, int userLevel) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.userLevel = userLevel;
	}
	
	public Member(String snsId, String snsName, int userLevel) {
		super();
		this.userId = snsId;
		this.userName = snsName;
		this.userLevel = userLevel;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getChildrenName() {
		return childrenName;
	}

	public void setChildrenName(String childrenName) {
		this.childrenName = childrenName;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", address=" + address + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", childrenName=" + childrenName + ", userLevel=" + userLevel
				+ "]";
	}
}

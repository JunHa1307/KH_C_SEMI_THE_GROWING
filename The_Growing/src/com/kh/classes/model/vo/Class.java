package com.kh.classes.model.vo;

public class Class {
	private int classNo;
	private int classGrade;
	private int classCode;
	private String className;
	private String classTypeName;
	private String changeName;
	private String filePath;
	private String teacherName;
	private String atptOfcdcScCode;
	private int sdSchulCode;
	private int userCount;

	public Class() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Class(int classNo, int classGrade, int classCode, String className, String classTypeName, String changeName,
			String filePath, String teacherName, String atptOfcdcScCode, int sdSchulCode, int userCount) {
		super();
		this.classNo = classNo;
		this.classGrade = classGrade;
		this.classCode = classCode;
		this.className = className;
		this.classTypeName = classTypeName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.teacherName = teacherName;
		this.atptOfcdcScCode = atptOfcdcScCode;
		this.sdSchulCode = sdSchulCode;
		this.userCount = userCount;
	}

	public Class(int classNo, int classGrade, int classCode, String className, String classTypeName, String changeName,
			String filePath, String teacherName, int userCount) {
		super();
		this.classNo = classNo;
		this.classGrade = classGrade;
		this.classCode = classCode;
		this.className = className;
		this.classTypeName = classTypeName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.teacherName = teacherName;
		this.userCount = userCount;
	}

	
	
	public Class(int classNo, int classGrade, int classCode, String className, String classTypeName, String teacherName,
			String atptOfcdcScCode, int sdSchulCode) {
		super();
		this.classNo = classNo;
		this.classGrade = classGrade;
		this.classCode = classCode;
		this.className = className;
		this.classTypeName = classTypeName;
		this.teacherName = teacherName;
		this.atptOfcdcScCode = atptOfcdcScCode;
		this.sdSchulCode = sdSchulCode;
	}

	public Class(int classNo, int classCode) {
		super();
		this.classNo = classNo;
		this.classCode = classCode;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getClassGrade() {
		return classGrade;
	}

	public void setClassGrade(int classGrade) {
		this.classGrade = classGrade;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassTypeName() {
		return classTypeName;
	}

	public void setClassTypeName(String classTypeName) {
		this.classTypeName = classTypeName;
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

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getAtptOfcdcScCode() {
		return atptOfcdcScCode;
	}

	public void setAtptOfcdcScCode(String atptOfcdcScCode) {
		this.atptOfcdcScCode = atptOfcdcScCode;
	}

	public int getSdSchulCode() {
		return sdSchulCode;
	}

	public void setSdSchulCode(int sdSchulCode) {
		this.sdSchulCode = sdSchulCode;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	@Override
	public String toString() {
		return "Class [classNo=" + classNo + ", classGrade=" + classGrade + ", classCode=" + classCode + ", className="
				+ className + ", classTypeName=" + classTypeName + "]";
	}

}

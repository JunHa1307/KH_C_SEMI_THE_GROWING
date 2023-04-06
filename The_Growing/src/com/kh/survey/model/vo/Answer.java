package com.kh.survey.model.vo;

import java.sql.Date;
import java.util.Arrays;

public class Answer {
	private int refQno;
	private int refUno;
	private Date submitDate;
	private String[] writeAns;
	private String[] itemAns;
	private String userName;
	private String childName;
	
	public Answer() {
		super();
	}

	public Answer(int refQno, int refUno, Date submitDate, String[] writeAns, String[] itemAns) {
		super();
		this.refQno = refQno;
		this.refUno = refUno;
		this.submitDate = submitDate;
		this.writeAns = writeAns;
		this.itemAns = itemAns;
	}
	
	public Answer(int refQno, int refUno, String[] writeAns, String[] itemAns) {
		super();
		this.refQno = refQno;
		this.refUno = refUno;
		this.writeAns = writeAns;
		this.itemAns = itemAns;
	}

	public int getRefQno() {
		return refQno;
	}

	public void setRefQno(int refQno) {
		this.refQno = refQno;
	}

	public int getRefUno() {
		return refUno;
	}

	public void setRefUno(int refUno) {
		this.refUno = refUno;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public String[] getWriteAns() {
		return writeAns;
	}

	public void setWriteAns(String[] writeAns) {
		this.writeAns = writeAns;
	}

	public String[] getItemAns() {
		return itemAns;
	}

	public void setItemAns(String[] itemAns) {
		this.itemAns = itemAns;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getChildName() {
		return childName;
	}

	public void setChildName(String childName) {
		this.childName = childName;
	}

	@Override
	public String toString() {
		return "Answer [refQno=" + refQno + ", refUno=" + refUno + ", submitDate=" + submitDate + ", writeAns="
				+ Arrays.toString(writeAns) + ", itemAns=" + Arrays.toString(itemAns) + ", userName=" + userName
				+ ", childName=" + childName + "]";
	}
	
}

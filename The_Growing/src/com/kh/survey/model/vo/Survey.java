package com.kh.survey.model.vo;

import java.sql.Date;

public class Survey {
	private int surveyNo;
	private String title;
	private int surveyCount;
	private Date firstDate;
	private Date lastDate;
	private String status;
	private int refCno;
	
	public Survey() {
		super();
	}

	public Survey(int surveyNo, String title, int surveyCount, Date firstDate, Date lastDate, String status,
			int refCno) {
		super();
		this.surveyNo = surveyNo;
		this.title = title;
		this.surveyCount = surveyCount;
		this.firstDate = firstDate;
		this.lastDate = lastDate;
		this.status = status;
		this.refCno = refCno;
	}

	public Survey(String title, Date firstDate, Date lastDate, int refCno) {
		super();
		this.title = title;
		this.firstDate = firstDate;
		this.lastDate = lastDate;
		this.refCno = refCno;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getSurveyCount() {
		return surveyCount;
	}

	public void setSurveyCount(int surveyCount) {
		this.surveyCount = surveyCount;
	}

	public Date getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(Date firstDate) {
		this.firstDate = firstDate;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRefCno() {
		return refCno;
	}

	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}

	@Override
	public String toString() {
		return "Survey [surveyNo=" + surveyNo + ", title=" + title + ", surveyCount=" + surveyCount + ", firstDate="
				+ firstDate + ", lastDate=" + lastDate + ", status=" + status + ", refCno=" + refCno + "]";
	}
}

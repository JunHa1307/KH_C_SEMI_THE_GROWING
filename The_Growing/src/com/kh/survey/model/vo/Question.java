package com.kh.survey.model.vo;

import java.util.Arrays;

public class Question {
	private int quesNo;
	private int refSno;
	private String[] quesType;
	private String[] sTitle;
	private String[] sContent;
	private String[] mTitle;
	private String[] mContent;
	private String[] itemNo;
	private String[] itemContent;
	
	public Question() {
		super();
	}

	public Question(int quesNo, int refSno, String[] quesType, String[] sTitle, String[] sContent, String[] mTitle,
			String[] mContent, String[] itemNo, String[] itemContent) {
		super();
		this.quesNo = quesNo;
		this.refSno = refSno;
		this.quesType = quesType;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.itemNo = itemNo;
		this.itemContent = itemContent;
	}

	public int getQuesNo() {
		return quesNo;
	}

	public void setQuesNo(int quesNo) {
		this.quesNo = quesNo;
	}

	public int getRefSno() {
		return refSno;
	}

	public void setRefSno(int refSno) {
		this.refSno = refSno;
	}

	public String[] getQuesType() {
		return quesType;
	}

	public void setQuesType(String[] quesType) {
		this.quesType = quesType;
	}

	public String[] getsTitle() {
		return sTitle;
	}

	public void setsTitle(String[] sTitle) {
		this.sTitle = sTitle;
	}

	public String[] getsContent() {
		return sContent;
	}

	public void setsContent(String[] sContent) {
		this.sContent = sContent;
	}

	public String[] getmTitle() {
		return mTitle;
	}

	public void setmTitle(String[] mTitle) {
		this.mTitle = mTitle;
	}

	public String[] getmContent() {
		return mContent;
	}

	public void setmContent(String[] mContent) {
		this.mContent = mContent;
	}

	public String[] getItemNo() {
		return itemNo;
	}

	public void setItemNo(String[] itemNo) {
		this.itemNo = itemNo;
	}

	public String[] getItemContent() {
		return itemContent;
	}

	public void setItemContent(String[] itemContent) {
		this.itemContent = itemContent;
	}

	@Override
	public String toString() {
		return "Question [quesNo=" + quesNo + ", refSno=" + refSno + ", quesType="
				+ Arrays.toString(quesType) + ", sTitle=" + Arrays.toString(sTitle) + ", sContent="
				+ Arrays.toString(sContent) + ", mTitle=" + Arrays.toString(mTitle) + ", mContent="
				+ Arrays.toString(mContent) + ", itemNo=" + Arrays.toString(itemNo) + ", itemContent="
				+ Arrays.toString(itemContent) + "]";
	}
	
}

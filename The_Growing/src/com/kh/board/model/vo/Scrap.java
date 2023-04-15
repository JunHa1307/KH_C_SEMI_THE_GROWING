package com.kh.board.model.vo;

public class Scrap {

	private int refUno;
	private int refBno;
	
	public Scrap() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Scrap(int refUno, int refBno) {
		super();
		this.refUno = refUno;
		this.refBno = refBno;
	}

	public int getRefUno() {
		return refUno;
	}

	public void setRefUno(int refUno) {
		this.refUno = refUno;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	@Override
	public String toString() {
		return "Scrap [refUno=" + refUno + ", refBno=" + refBno + "]";
	}

}

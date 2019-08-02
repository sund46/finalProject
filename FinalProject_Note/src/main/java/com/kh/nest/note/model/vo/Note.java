package com.kh.nest.note.model.vo;

import java.io.Serializable;

public class Note implements Serializable {
	private static final long serialVersionUID = 3000L;
	
	private int nno;
	private int mno;
	private int nbno;
	private int spaceno;
	private String ntitle;
	private String ncontent;
	private String sharescope;
	private String trashcan;
	
	public Note() {}

	public Note(int nno, int mno, int nbno, int spaceno, String ntitle, String ncontent, String sharescope,
			String trashcan) {
		super();
		this.nno = nno;
		this.mno = mno;
		this.nbno = nbno;
		this.spaceno = spaceno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.sharescope = sharescope;
		this.trashcan = trashcan;
	}

	public Note(int mno, String trashcan) {
		super();
		this.mno = mno;
		this.trashcan = trashcan;
	}

	
	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getNbno() {
		return nbno;
	}

	public void setNbno(int nbno) {
		this.nbno = nbno;
	}

	public int getSpaceno() {
		return spaceno;
	}

	public void setSpaceno(int spaceno) {
		this.spaceno = spaceno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getSharescope() {
		return sharescope;
	}

	public void setSharescope(String sharescope) {
		this.sharescope = sharescope;
	}

	public String getTrashcan() {
		return trashcan;
	}

	public void setTrashcan(String trashcan) {
		this.trashcan = trashcan;
	}

	

	@Override
	public String toString() {
		return "Note [nno=" + nno + ", mno=" + mno + ", nbno=" + nbno + ", spaceno=" + spaceno + ", ntitle=" + ntitle
				+ ", ncontent=" + ncontent + ", sharescope=" + sharescope + ", trashcan=" + trashcan + "]";
	}

	
}

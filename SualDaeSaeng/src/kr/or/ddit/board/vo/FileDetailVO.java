package kr.or.ddit.board.vo;

import java.time.LocalDate;

public class FileDetailVO {
	
	private int file_no;
	private String file_savepath;
	private String file_ogname;
	private String file_savednm;
	private int file_size;
	private String file_ext;
	private LocalDate file_dt;

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public String getFile_savepath() {
		return file_savepath;
	}

	public void setFile_savepath(String file_savepath) {
		this.file_savepath = file_savepath;
	}

	public String getFile_ogname() {
		return file_ogname;
	}

	public void setFile_ogname(String file_ogname) {
		this.file_ogname = file_ogname;
	}

	public String getFile_savednm() {
		return file_savednm;
	}

	public void setFile_savednm(String file_savednm) {
		this.file_savednm = file_savednm;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public String getFile_ext() {
		return file_ext;
	}

	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}

	public LocalDate getFile_dt() {
		return file_dt;
	}

	public void setFile_dt(LocalDate file_dt) {
		this.file_dt = file_dt;
	}

}

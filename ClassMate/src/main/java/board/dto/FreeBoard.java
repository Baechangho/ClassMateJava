package board.dto;

import java.sql.Date;

public class FreeBoard {
	private int freeNo;
	private int userNo;
	private String freeHead;
	private Date freeDate;
	private int freeHit;
	private String freeName;
	private String freeContent;
	
	private String userName;
	
	public FreeBoard() {}

	public FreeBoard(int freeNo, int userNo, String freeHead, Date freeDate, int freeHit, String freeName,
			String freeContent, String userName) {
		super();
		this.freeNo = freeNo;
		this.userNo = userNo;
		this.freeHead = freeHead;
		this.freeDate = freeDate;
		this.freeHit = freeHit;
		this.freeName = freeName;
		this.freeContent = freeContent;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "FreeBoard [freeNo=" + freeNo + ", userNo=" + userNo + ", freeHead=" + freeHead + ", freeDate="
				+ freeDate + ", freeHit=" + freeHit + ", freeName=" + freeName + ", freeContent=" + freeContent
				+ ", userName=" + userName + "]";
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getFreeHead() {
		return freeHead;
	}

	public void setFreeHead(String freeHead) {
		this.freeHead = freeHead;
	}

	public Date getFreeDate() {
		return freeDate;
	}

	public void setFreeDate(Date freeDate) {
		this.freeDate = freeDate;
	}

	public int getFreeHit() {
		return freeHit;
	}

	public void setFreeHit(int freeHit) {
		this.freeHit = freeHit;
	}

	public String getFreeName() {
		return freeName;
	}

	public void setFreeName(String freeName) {
		this.freeName = freeName;
	}

	public String getFreeContent() {
		return freeContent;
	}

	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}

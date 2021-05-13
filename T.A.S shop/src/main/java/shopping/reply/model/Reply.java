package shopping.reply.model;

public class Reply {
	private int rno ;
	private int groupno ;
	private String mid;
	private String comment;
	private String date;
	
	
	
	public Reply(int rno, int groupno, String mid, String comment, String date) {
		super();
		this.rno = rno;
		this.groupno = groupno;
		this.mid = mid;
		this.comment = comment;
		this.date = date;
	}

	public Reply() {}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", groupno=" + groupno + ", mid=" + mid + ", comment=" + comment + ", date=" + date
				+ "]";
	}

	
	
}

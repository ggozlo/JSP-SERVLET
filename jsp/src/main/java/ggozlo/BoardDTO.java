package ggozlo;

public class BoardDTO 
{
	private int bid;
	private String bname, btitle, bcontent, bdate;
	private int bgroup, bstep, bindent,bhit;
	private String filename;
	
	
	
	
	public BoardDTO(String bname, String btitle, String bcontent, String filename) {
		super();
		this.bname = bname;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.filename = filename;
	}
	public BoardDTO(int bid, String bname, String btitle, String bcontent, String bdate, int bgroup, int bstep,
			int bindent, int bhit, String filename) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bhit = bhit;
		this.filename = filename;
	}
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBid() {
		return bid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getBindent() {
		return bindent;
	}
	public void setBindent(int bindent) {
		this.bindent = bindent;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	
	
}

package ggozlo;

public class DTO 
{
	private String id, pw;

	public DTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
}

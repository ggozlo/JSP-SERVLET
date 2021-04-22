package ggozlo;

public class AccountDTO
{
	private String name, pw, id, tel;

	public AccountDTO(String id, String pw, String name, String tel) 
	{
		super();
		this.name = name;
		this.pw = pw;
		this.id = id;
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}

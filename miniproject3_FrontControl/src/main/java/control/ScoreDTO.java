package control;

public class ScoreDTO
{
	private String name, registrant, regdate;
	private int kor, eng , mat, room, num,tot ;
	
	
	
	public String getRegistrant() {
		return registrant;
	}
	public void setRegistrant(String registrant) {
		this.registrant = registrant;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public ScoreDTO(String name,int room, int num,  int kor, int eng, int mat, String registrant, String regdate) {
		super();
		this.name = name;
		this.registrant = registrant;
		this.regdate = regdate;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.room = room;
		this.num = num;
	}
	public ScoreDTO(String name, int room, int num, int kor, int eng, int mat) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.room = room;
		this.num = num;
	}
	public int getTot() {
		this.tot= kor+eng+mat;
		return tot;
	}

	public ScoreDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	
	
		
	
}

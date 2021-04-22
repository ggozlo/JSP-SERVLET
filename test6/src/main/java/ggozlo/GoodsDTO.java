package ggozlo;

public class GoodsDTO
{
	private String clothType;
	private int quantity;
	private int price;
	private String writer;
	private String regDate;
	public GoodsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public GoodsDTO(String clothType, int quantity, int price, String writer, String regDate) {
		super();
		this.clothType = clothType;
		this.quantity = quantity;
		this.price = price;
		this.writer = writer;
		this.regDate = regDate;
	}

	public String getClothType() {
		return clothType;
	}
	public void setClothType(String clothType) {
		this.clothType = clothType;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}

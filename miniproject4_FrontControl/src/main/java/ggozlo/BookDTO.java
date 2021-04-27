package ggozlo;

public class BookDTO
{
	private String name, publisher;
	private int price, sales;
	public BookDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDTO(String name, String publisher, int price, int sales) {
		super();
		this.name = name;
		this.publisher = publisher;
		this.price = price;
		this.sales = sales;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	} 
	
	
}

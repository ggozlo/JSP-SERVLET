package ggozlo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsDAO 
{
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet res;
	
	private String url ="jdbc:oracle:thin:@localhost:1521:xe";
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String user = "ggozlo";
	private String password = "ggozlo";
	
	public GoodsDAO() 
	{
		super();
	}
	
	public int goodsSave(GoodsDTO gto) // 입력
	{
		int n=0;
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO GOODS VALUES (?,?,?,?,SYSDATE)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, gto.getClothType() );
			psmt.setInt(2, gto.getQuantity() );
			psmt.setInt(3, gto.getPrice());
			psmt.setString(4, gto.getWriter());
			n = psmt.executeUpdate();
			con.commit();
			con.close();
			
			if(n ==1)
			{
				System.out.println("---입력완료---");
			}
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("----드라이버 오류----\n"+e);
		} 
		catch (SQLException e) 
		{
			System.out.println("----SQL 오류----\n"+e);
		}
		
		return n;
	}
	
	
	public List<GoodsDTO> getGoodsList() // 출력
	{
		List<GoodsDTO> gtoList = new ArrayList<>();
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM GOODS";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			while(res.next())
			{
				gtoList.add( 
						new GoodsDTO(
								res.getString("TYPE"),
								res.getInt("QUANTITY"),
								res.getInt("PRICE"),
								res.getString("WRITER"),
								res.getString("REGDATE")) );
			}
			
			con.close();
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("----드라이버 오류----\n"+e);
		} 
		catch (SQLException e) 
		{
			System.out.println("----SQL 오류----\n"+e);
		}
		return gtoList;
		
		
	}
	
	public ResultSet goodsGROUP() // 그룹츌력
	{
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "SELECT TYPE, SUM(QUANTITY) AS QTT, AVG(PRICE) AS PRI, SUM(QUANTITY*PRICE) AS PRO FROM GOODS GROUP BY TYPE ORDER BY SUM(QUANTITY*PRICE) DESC";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
		}
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public ResultSet goodsSearch(String searchGoods)
	{
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM GOODS WHERE TYPE = ?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, searchGoods);
			res = psmt.executeQuery();
		} 
		catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int goodsDelete(String deleteName)
	{
		int n = 0;
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "DELETE FROM GOODS WHERE TYPE = ?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, deleteName);
			n = psmt.executeUpdate();
			con.commit();
			con.close();
		} 
		catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
}

package ggozlo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ScoreDAO //Data Access Object
{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver = "oracle.jdbc.driver.OracleDriver";
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	
	public void SocreDAO()
	{		}
	public int addScoreDAO(ScoreDTO sd)
	{
		int n =0;
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
			String sql = "INSERT INTO SCORE VALUES(?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, sd.getName());
			psmt.setInt(2, sd.getKor());
			psmt.setInt(3, sd.getEng());
			psmt.setInt(4, sd.getMat());
			n = psmt.executeUpdate();
			con.commit();
			con.close();
			
		} 
		catch (ClassNotFoundException e) 
		{
			System.out.println("---드라이버가 없습니다!---\n" +e);
		} 
		catch (SQLException e) 
		{
			System.out.println("---SQL오류!---\n" +e);
		}
		catch (Exception e)
		{
			System.out.println("----실패!----"+e);
		}
		return n;
		
	}
	
	
	public ResultSet scorePrint()
	{
		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
			String sql = "SELECT * FROM SCORE";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return res ;
		
	}
	
	public int scoreDelete(String deleteName)
	{
		int n = 0;
		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo" , "ggozlo");
			String sql = "DELETE FROM SCORE WHERE NAME = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, deleteName);
			n = psmt.executeUpdate();
			con.commit();
			con.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return n;
	}
	
	public int scoreUpdate(ScoreDTO sdto)
	{
		int n =0;
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo" , "ggozlo");
			String sql = "UPDATE SCORE SET KOR = ?, ENG = ?, MAT = ? WHERE NAME = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, sdto.getKor());
			psmt.setInt(2, sdto.getEng()  );
			psmt.setInt(3, sdto.getMat()  );
			psmt.setString(4, sdto.getName() );
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
	
	public ResultSet scoreSearch(String searchName)
	{
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo" , "ggozlo");
			String sql = "SELECT * FROM SCORE WHERE NAME = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, searchName);
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
}

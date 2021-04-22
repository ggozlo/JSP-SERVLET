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
}

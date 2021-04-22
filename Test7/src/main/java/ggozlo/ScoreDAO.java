package ggozlo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ScoreDAO
{
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	public ScoreDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void scoreInput(ScoreDTO sdto)
	{
		
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
			String sql="INSERT INTO SCORE(name,kor,eng,mat) VALUES (?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, sdto.getName() );
			psmt.setInt(2, sdto.getKor() );
			psmt.setInt(3, sdto.getEng() );
			psmt.setInt(4, sdto.getMat());


			psmt.executeUpdate();


			con.commit();
			psmt.close();
			con.close(); 	
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		
	}
}

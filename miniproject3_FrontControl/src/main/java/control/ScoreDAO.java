package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ScoreDAO
{
	DataSource dataSource;
	Context context;
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	public ScoreDAO()
	{
		super();
	}
	
	public int scoreInput(ScoreDTO sdto, String registrant) 
	{
		int n=0;
		try 
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql="INSERT INTO STUDENT VALUES (?,?,?,?,?,?,?,SYSDATE)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, sdto.getName() );
			psmt.setInt(2, sdto.getRoom() );
			psmt.setInt(3, sdto.getNum() );
			psmt.setInt(4, sdto.getKor() );
			psmt.setInt(5, sdto.getEng() );
			psmt.setInt(6, sdto.getMat() );
			psmt.setString(7, registrant );
			n = psmt.executeUpdate();
			con.commit();
			psmt.close();
			con.close(); 	
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (NamingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;	
	}
	

	public ArrayList<ScoreDTO> scorePrint()
	{
		ArrayList<ScoreDTO> list = new ArrayList<ScoreDTO>();
		
		try 
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql="SELECT * FROM STUDENT";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			while(res.next())
			{
				list.add(new ScoreDTO(
						res.getString("NAME"),
						res.getInt("ROOM"),
						res.getInt("NUM"),
						res.getInt("KOR"),
						res.getInt("ENG"),
						res.getInt("MAT"),
						res.getString("REGISTRANT"),
						res.getString("REGDATE")));
			}
			psmt.close();
			con.close(); 	
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (NamingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return list;
	}
	
	
	public int scoreModify(ScoreDTO sdto, String name)
	{
		int n=0;
		try 
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql="UPDATE STUDENT SET ROOM=?, NUM=?, KOR=?, ENG=?, MAT=?, REGISTRANT=? WHERE NAME=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(7, sdto.getName() );
			psmt.setString(6, name );
			psmt.setInt(1, sdto.getRoom() );
			psmt.setInt(2, sdto.getNum() );
			psmt.setInt(3, sdto.getKor() );
			psmt.setInt(4, sdto.getEng() );
			psmt.setInt(5, sdto.getMat() );
			n = psmt.executeUpdate();
			con.commit();
			psmt.close();
			con.close(); 	
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (NamingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
	
	public int scoreDelete(String name)
	{
		int n=0;
		try 
		{
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql="DELETE student WHERE name=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,name);
			n = psmt.executeUpdate();
			con.commit();
			psmt.close();
			con.close(); 	
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (NamingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
}

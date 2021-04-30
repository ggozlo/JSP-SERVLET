package ggozlo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FileDAO 
{
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	DataSource dataSource;
	Context context;
	
	
	
	public FileDAO() 
	{
		try {
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
		} 
		catch (NamingException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}



	public void upLoad(String fileName, String fileRealName)
	{
		String sql = "INSERT INTO FILEUPLOAD VALUES (?,?)";
		try 
		{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, fileName);
			psmt.setString(2, fileRealName);
			psmt.executeUpdate();
			con.commit();
			psmt.close();
			con.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public List<FileDTO> fileList()
	{
		List<FileDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM FILEUPLOAD";
		try
		{
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			while(res.next())
			{
				list.add(new FileDTO(
						res.getString(1),
						res.getString(2)));
			}
		
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		
		return list;
		
	}
}




















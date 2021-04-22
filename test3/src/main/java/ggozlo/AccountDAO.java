package ggozlo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO
{
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	String user ="ggozlo";
	String password = "ggozlo";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver = "oracle.jdbc.driver.OracleDriver";
	public AccountDAO(){}
	
	public int addAccount(AccountDTO ad)
	{
		int n = 0;
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO ACCOUNT VALUES (?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, ad.getId() );
			psmt.setString(2, ad.getPw() );
			psmt.setString(3, ad.getName() );
			psmt.setString(4, ad.getTel() );
			n = psmt.executeUpdate();
			
			if(n == 1)
			{
				System.out.println("oracle 전송 완료됨");
			}
			else
			{
				System.out.println("전송 안됨");
			}
			con.commit();
			con.close();
		} 
		catch (ClassNotFoundException e) 
		{
			System.out.println("----드라이버가 없습니다----"+e);
		}
		catch (SQLException e) 
		{
			System.out.println("----오라클 연결 실패----"+e);
		}
		return n;
	}
	
	public List<AccountDTO> getAccountDTO()
	{
		String id, pw, name, tel;
		List<AccountDTO> adtoList = new ArrayList<>();
		try 
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM ACCOUNT";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			while(res.next())
			{
				id = res.getString("id");
				pw = res.getString("pw");
				name = res.getString("name");
				tel = res.getString("tel");
				adtoList.add(new AccountDTO(id,pw,name,tel) );
			}
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
		return adtoList;
	}
	
	
	
	
}

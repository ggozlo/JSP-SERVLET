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

public class BoardDAO
{

	private Connection con;
	private PreparedStatement psmt;
	private ResultSet res;
	String sql;
	
	private Connection getConnection() throws NamingException, SQLException
	{
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		con = dataSource.getConnection();
		return con;
	}
	//---------------------------------------------------------------------------------------------------------
	public int write(BoardDTO bdto)
	{
		int n = 0;
		try
		{
			con = getConnection();
			sql = "INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BHIT, BGROUP, BSTEP, BINDENT) "
					+ "VALUES ( BOARD_SEQ.nextval, ?, ?, ?, 0, BOARD_SEQ.currval, 0, 0)";
			psmt= con.prepareStatement(sql);
			psmt.setString(1, bdto.getBname());
			psmt.setString(2, bdto.getBtitle());
			psmt.setString(3, bdto.getBcontent());
			n = psmt.executeUpdate();
			con.commit();
			psmt.close();
			con.close();
		}
		catch (NamingException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return n;
	}
	//---------------------------------------------------------------------------------------------------------
	public List<BoardDTO> getList()
	{
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try
		{
			con = getConnection();
			sql = "SELECT bid, bname, btitle, TO_CHAR(bdate, 'YY/MM/DD'), bgroup, bstep, bindent, bhit FROM board ORDER BY bgroup DESC, bstep";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			if(res.isBeforeFirst())
			{
				while(res.next())
				{
					list.add(new BoardDTO(
							res.getInt(1), 
							res.getString(2), 
							res.getString(3), 
							null, 
							res.getString(4), 
							res.getInt(5), 
							res.getInt(6), 
							res.getInt(7), 
							res.getInt(8)));
				}
			}
			res.close();
			psmt.close();
			con.close();
		
		}
		catch (NamingException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return list;
	}
	//---------------------------------------------------------------------------------------------------------
	public void hitUp(int bid) throws NamingException, SQLException
	{
			con = getConnection();
			sql = "UPDATE BOARD SET BHIT = BHIT+1 WHERE BID=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, bid);
			psmt.executeUpdate();
	}
	
	public BoardDTO getPost(int BID)
	{
		BoardDTO post = null;
		
		try
		{
			hitUp(BID);
			sql = "SELECT * FROM BOARD WHERE BID=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, BID);
			res = psmt.executeQuery();
			if(res.isBeforeFirst())
			{
				while(res.next())
				{
					post = new BoardDTO(
							res.getInt(1), 
							res.getString(2), 
							res.getString(3), 
							res.getString(4), 
							res.getString(5), 
							res.getInt(6), 
							res.getInt(7), 
							res.getInt(8), 
							res.getInt(9));
				}
				
			}
			else
			{
				post = new BoardDTO();
			}
			
			
		
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (NamingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				con.commit();
				res.close();
				psmt.close();
				con.close();
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			
		}
		return post;
	}
	//---------------------------------------------------------------------------------------------------------
	public int modifyPost(BoardDTO bdto)
	{
		int n = 0;
		
		try
		{
			con = getConnection();
			sql = "UPDATE BOARD SET BTITLE=?, BCONTENT=? WHERE BID=? AND  BNAME=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bdto.getBtitle());
			psmt.setString(4, bdto.getBname());
			psmt.setString(2, bdto.getBcontent());
			psmt.setInt(3, bdto.getBid());
			n = psmt.executeUpdate();
			
			
			con.commit();
			psmt.close();
			con.close();
		
		}
		catch (NamingException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return n;
	}
	//---------------------------------------------------------------------------------------------------------
	public void deletePost(int bid, String bname)
	{
		int n = 0;
		
		try
		{
			con = getConnection();
			sql = "DELETE BOARD WHERE BID=? OR BNAME=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, bid);
			psmt.setString(2, bname);
			n = psmt.executeUpdate();
			
			
			con.commit();
			psmt.close();
			con.close();
		
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
	//---------------------------------------------------------------------------------------------------------
	public List<BoardDTO> getSearchList(String title)
	{
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try
		{
			con = getConnection();
			sql = "SELECT BID, BNAME, BTITLE, TO_CHAR(BDATE, 'YY/MM/DD') , BGROUP, BSTEP, BINDENT, BHIT FROM BOARD WHERE BTITLE LIKE ? ORDER BY BGROUP DESC, BSTEP";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+title+"%");
			res = psmt.executeQuery();
			if(res.isBeforeFirst())
			{
				while(res.next())
				{
					list.add(new BoardDTO(
							res.getInt(1), 
							res.getString(2), 
							res.getString(3), 
							null, 
							res.getString(4), 
							res.getInt(5), 
							res.getInt(6), 
							res.getInt(7), 
							res.getInt(8)));
				}
			}
			res.close();
			psmt.close();
			con.close();
		
		}
		catch (NamingException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return list;
	}
	//---------------------------------------------------------------------------------------------------------
	public int addReply(BoardDTO bdto)
	{
		addReplyProcess(bdto.getBgroup(), bdto.getBstep());
		int n = 0;
		try 
		{
			con = getConnection();
			sql = "INSERT INTO BOARD (bid,bname,btitle,bcontent,bgroup,bstep,bindent, bhit,bdate) VALUES (BOARD_SEQ.NEXTVAL,?,?,?,?,?,?,0,SYSDATE)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bdto.getBname());
			psmt.setString(2, bdto.getBtitle());
			psmt.setString(3, bdto.getBcontent());
			psmt.setInt(4, bdto.getBgroup());
			psmt.setInt(5, bdto.getBstep()+1);
			psmt.setInt(6, bdto.getBindent()+1);
		
			n = psmt.executeUpdate();
			if(n==1) con.commit();
			psmt.close();
			con.close();
		}
		catch (NamingException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return n;
	}
	//---------------------------------------------------------------------------------------------------------
		public int addReplyProcess(int bgroup, int bstep)
		{
			int n = 0;
			try 
			{
				con = getConnection();
				sql = "UPDATE BOARD SET BSTEP = BSTEP + 1 WHERE BGROUP = ? AND BSTEP > ?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, bgroup);
				psmt.setInt(2, bstep);
				n = psmt.executeUpdate();
				
				
			}
			catch (NamingException e) 
			{
				e.printStackTrace();
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					psmt.close();
					con.close();
				} 
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			return n;
		}
	//---------------------------------------------------------------------------------------------------------
	public BoardDTO getReply(int bid)
	{
		BoardDTO bdto = new BoardDTO();
		
		try 
		{
			con = getConnection();
			sql = "SELECT BID, BNAME, BCONTENT, BDATE, BSTEP, BINDENT, BHIT, BGROUP, BTITLE FROM BOARD WHERE BID = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, bid);
			res = psmt.executeQuery();
			if(res.isBeforeFirst())
			{
				while(res.next())
				{
					
					bdto.setBid(res.getInt(1));
					bdto.setBname(res.getString(2));
					bdto.setBcontent(res.getString(3));
					bdto.setBdate(res.getString(4));
					bdto.setBstep(res.getInt(5));
					bdto.setBindent(res.getInt(6));
					bdto.setBhit(res.getInt(7));
					bdto.setBgroup(res.getInt(8));
					bdto.setBtitle(res.getString(9));
	
				}
			}
			
			res.close();
			psmt.close();
			con.close();
		}
		catch (NamingException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return bdto;
	}
}

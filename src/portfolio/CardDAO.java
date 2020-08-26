package portfolio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CardDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "jspid";
	String userpw = "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static CardDAO uniqueInstance;
	
	public static CardDAO getInstance() {
		if(uniqueInstance == null) {
			uniqueInstance = new CardDAO();
		}
		return uniqueInstance;
	}
	private CardDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("접속실패");
		}
		
	}
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,userid,userpw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insert_Rank(int ts,int tm,String name ,String modes) {
		getConnection();
		int cnt = -1;
		String sql = "insert into cardplay values(cardsqe.nextval,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, tm);
			ps.setInt(3, ts);
			ps.setString(4, modes);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return cnt;
	}
	public ArrayList<CardDTO> select_rank() {
		getConnection();
		ArrayList<CardDTO> lists = new ArrayList<CardDTO>();
		String sql = "select * from cardplay order by tm_tab, ts_tab asc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				CardDTO dtos = new CardDTO();
				dtos.setRank_tab(rs.getInt(1));
				dtos.setName_tab(rs.getString(2));
				dtos.setTm_tab(rs.getInt(3));
				dtos.setTs_tab(rs.getInt(4));
				dtos.setModes(rs.getString(5));
				lists.add(dtos);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return lists;
	}
	public int delete_rank(int ts, int tm) {
		getConnection();
		int cnt = -1;
		String sql = "delete from cardplay where tm_tab <= ? or ts_tab <= ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, tm);
			ps.setInt(2, ts);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return cnt;
	}
}

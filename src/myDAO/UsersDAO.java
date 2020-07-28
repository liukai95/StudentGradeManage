package myDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import myBean.Users;
import testJdbc.DbManager;

public class UsersDAO {

	/**
	 * ����һ�� users ��¼
	 */
	public static int insert(Users users) throws Exception {
		String sql = "insert users (username,pwd,sex) values(?,?,?)";
		return DbManager.executeUpdate(sql, users.getName(),users.getPwd(),users.getSex());
	}
	/**
	 * ���users��½
	 */
	public static boolean check(Users users) throws Exception {
		String sql = "select * from users where username=? and pwd=?";
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, users.getName());
			preStmt.setString(2, users.getPwd());
			rs = preStmt.executeQuery();
			if (rs.next()) {//���ڸ��û�
				return true;
			} else {
				return false;
			}

		} finally {
			if (rs != null)
				rs.close();
			if (preStmt != null)
				preStmt.close();
			if (conn != null)
				conn.close();
		} 
	}
	/**
	 * ��������
	 */
	public static int updatePwd(Users users) throws Exception {
		String sql = "update users set pwd=? where id=?";
		return DbManager.executeUpdate(sql, users.getPwd(), users
				.getId());
	}

	/**
	 * ɾ�� users
	 * 
	 */
	public static void delete(String id) throws Exception {
		Connection conn = DbManager.getConnection();
		String sql = "delete from users where WHERE id in ("+id+")";
		PreparedStatement pst = conn.prepareStatement(sql);
   	    pst.executeUpdate();
   	    pst.close();
      	conn.close();
	}
	/**
	 * �����������Ƿ����
	 */
	public static boolean findName(String name) throws Exception {
		String sql = "select * from users where username= ? ";
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, name);
			rs = preStmt.executeQuery();
			if (rs.next()) {//���ڸ��û�
				return true;
			} else {
				return false;
			}

		} finally {
			if (rs != null)
				rs.close();
			if (preStmt != null)
				preStmt.close();
			if (conn != null)
				conn.close();
		}
	}

	/**
	 * ����һ�� users ��¼
	 */
	public static boolean find(Integer id,String oldPwd) throws Exception {
		//System.out.println(id+oldPwd);
		String sql = "select * from users where id=?";
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			preStmt.setInt(1, id);
			rs = preStmt.executeQuery();
			if (rs.next()) {
				String pwd=rs.getString("pwd");
				if(pwd.equals(oldPwd))
					return true;
				else 
					return false;
			}

		} finally {
			if (rs != null)
				rs.close();
			if (preStmt != null)
				preStmt.close();
			if (conn != null)
				conn.close();
		}
		return true;
	}
	/**
	 * ��������
	 */
	public static int total() throws Exception {
		String sql = "SELECT count(*) FROM users";
		return  DbManager.getCount(sql);
	}
	/**
	 * �г����е� users
	 */
	public static List<Users> listUsers(int startRecord,int pageSize) throws Exception {
		List<Users> list = new ArrayList<Users>();
		String sql = null;
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			sql = "SELECT * FROM users LIMIT ?, ? ";
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		DbManager.setParams(preStmt, startRecord, pageSize);
		rs = preStmt.executeQuery();
		while (rs.next()) {
				Users users = new Users();
				users.setId(rs.getInt("id"));
				users.setName(rs.getString("username"));
				users.setPwd(rs.getString("pwd"));
				users.setSex(rs.getString("sex"));
				list.add(users);
			}

		} finally {
			if (rs != null)
				rs.close();
			if (preStmt != null)
				preStmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

}







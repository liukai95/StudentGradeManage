package myDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import myBean.Class;
import myBean.Studens;
import testJdbc.DbManager;

public class ClassDAO {

	/**
	 * 列出所有的classID,className
	 */
	public static List<Class> listClass() throws Exception {
		List<Class> list = new ArrayList<Class>();
		String sql = null;
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			sql = "select * from class";
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		rs = preStmt.executeQuery();
		while (rs.next()) {
				Class cla = new Class();
				cla.setClassID(rs.getString("classID"));
				cla.setClassName(rs.getString("className"));
				list.add(cla);
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
	/**
	 * 计算总数
	 */
	public static int total() throws Exception {
		String sql = "SELECT count(*) from class c left outer join major m on m.majorid=c.majorid left outer join department d on d.depid=m.depid";
		return DbManager.getCount(sql);
	}
	/**
	 * 列出所有的classID,className
	 */
	public static List<Class> listClass2(int startRecord, int pageSize) throws Exception {
		List<Class> list = new ArrayList<Class>();
		String sql = null;
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			sql = "select c.classid,c.classname,d.depname,m.majorname from class c left outer join major m on m.majorid=c.majorid left outer join department d on d.depid=m.depid LIMIT ?, ? ";
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			DbManager.setParams(preStmt, startRecord, pageSize);
			rs = preStmt.executeQuery();
			while (rs.next()) {
				Class cla = new Class();
				cla.setClassID(rs.getString("classID"));
				cla.setClassName(rs.getString("className"));
				cla.setMajorName(rs.getString("majorName"));
				cla.setDepname(rs.getString("depname"));
				list.add(cla);
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

	/**
	 * 按id查找是否存在
	 */
	public static boolean find(String classId) throws Exception {
		String sql = "select * from class where classid= ? ";
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, classId);
			rs = preStmt.executeQuery();
			if (rs.next()) {// 存在该用户
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
	 * 插入一条 class 记录
	 */
	public static int insert(Class cla) throws Exception {
		String sql = "insert class values(?,?,?)";
		return DbManager.executeUpdate(sql, cla.getClassID(),cla.getClassName(),cla.getMajorId());
	}
	/**
	 * 删除 class
	 * 
	 */
	public static int delete(String claId) throws Exception {

		String sql = "delete from class where classid=? ";
		return DbManager.executeUpdate(sql, claId);
	}
}
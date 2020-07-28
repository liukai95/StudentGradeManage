package myDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import myBean.Studens;
import testJdbc.DbManager;

public class StudentsDAO {

	/**
	 * 插入一条 studens 记录
	 */
	public static int insert(Studens stu) throws Exception {
		String sql = "insert students values(?,?,?,?,?)";
		return DbManager.executeUpdate(sql, stu.getId(),stu.getStudName(), stu.getSex(),stu.getAge(),stu.getClassId());
	}


	/**
	 * 删除 studens
	 * 
	 */
	public static int delete(String studId) throws Exception {

		String sql = "delete from students where studid=? ";
		return DbManager.executeUpdate(sql, studId);
	}

	/**
	 * 按id查找是否存在
	 */
	public static boolean find(String studId) throws Exception {
		String sql = "select * from students where studid= ? ";
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, studId);
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
	 * 计算总数
	 */
	public static int total() throws Exception {
		String sql = "SELECT count(*) from students s left outer join class c on s.classid=c.classid left outer join major m on m.majorid=c.majorid left outer join department d on d.depid=m.depid";
		return DbManager.getCount(sql);
	}

	/**
	 * 列出所有的 studens信息
	 */
	public static List<Studens> liststudens(int startRecord, int pageSize)
			throws Exception {
		List<Studens> list = new ArrayList<Studens>();
		String sql = null;
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			sql = "select s.*,c.classname,m.majorname,d.depname from students s left outer join class c on s.classid=c.classid left outer join major m on m.majorid=c.majorid left outer join department d on d.depid=m.depid LIMIT ?, ? ";
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			DbManager.setParams(preStmt, startRecord, pageSize);
			rs = preStmt.executeQuery();
			while (rs.next()) {
				Studens studens = new Studens();
				studens.setId(rs.getString("StudID"));
				studens.setStudName(rs.getString("StudName"));
				studens.setSex(rs.getString("Sex"));
				studens.setAge(rs.getString("Age"));
				studens.setClassName(rs.getString("ClassName"));
				studens.setMajorname(rs.getString("majorname"));
				studens.setDepname(rs.getString("depname"));
				list.add(studens);
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
	 * 按照id列出所有的 studens个人信息
	 */
	public static List<Studens> liststudens2(String stuID)
			throws Exception {
		List<Studens> list = new ArrayList<Studens>();
		String sql = "select * from students where StudID=?";
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, stuID);
			rs = preStmt.executeQuery();
			while (rs.next()) {
				Studens studens = new Studens();
				studens.setId(rs.getString("StudID"));
				studens.setStudName(rs.getString("StudName"));
				studens.setSex(rs.getString("Sex"));
				studens.setAge(rs.getString("Age"));
				studens.setClassId(rs.getString("classid"));
				list.add(studens);
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
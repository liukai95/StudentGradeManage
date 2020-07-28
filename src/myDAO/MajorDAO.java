package myDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import myBean.Major;
import testJdbc.DbManager;

public class MajorDAO {

	/**
	 * 列出所有的MajorID,MajorName
	 */
	public static List<Major> listMajor() throws Exception {
		List<Major> list = new ArrayList<Major>();
		String sql = null;
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			sql = "select * from major";
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		rs = preStmt.executeQuery();
		while (rs.next()) {
				Major maj = new Major();
				maj.setMajorID(rs.getString("MajorID"));
				maj.setMajorName(rs.getString("MajorName"));
				list.add(maj);
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
		String sql = "SELECT count(*)from Major c left outer join major m on m.majorid=c.Majorid left outer join department d on d.depid=m.depid";
		return DbManager.getCount(sql);
	}
	/**
	 * 列出所有的MajorID,MajorName
	 */
	public static List<Major> listMajor2(int startRecord, int pageSize) throws Exception {
		List<Major> list = new ArrayList<Major>();
		String sql = null;
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		try {
			sql = "select c.Majorid,c.Majorname,d.depname,m.majorname from Major c left outer join major m on m.majorid=c.Majorid left outer join department d on d.depid=m.depid";
			conn = DbManager.getConnection();
			preStmt = conn.prepareStatement(sql);
			DbManager.setParams(preStmt, startRecord, pageSize);
			rs = preStmt.executeQuery();
		while (rs.next()) {
				Major cla = new Major();
				cla.setMajorID(rs.getString("MajorID"));
				cla.setMajorName(rs.getString("MajorName"));
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

}
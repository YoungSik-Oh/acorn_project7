package project7.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project7.admin.dto.AdminDto;
import project7.util.DbcpBean;

public class AdminDao {
	private static AdminDao dao;
	private AdminDao() {};
	public static AdminDao getInstance() {
		if(dao==null) {
			dao=new AdminDao();
		}
		return dao;
	}
	public boolean admingetData(AdminDto dto) {
		boolean isValid=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn= new DbcpBean().getConn();
		String sql="select adminName"
				+ "	from admin"
				+ "	where adminName=? and adminPw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAdminName());
			pstmt.setString(2, dto.getAdminPw());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				isValid=true;
			}
		}catch (Exception e) {
				e.printStackTrace();
		}finally {
			try {
				if (rs != null)rs.close();
				if (pstmt!= null)pstmt.close();
				if (conn!= null)conn.close();
			}catch (Exception e) {}
		}	
	return isValid;
	}
}


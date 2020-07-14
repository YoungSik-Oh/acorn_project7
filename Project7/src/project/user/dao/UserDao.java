package project.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.user.dto.UserDto;
import project7.util.DbcpBean;

public class UserDao {
	private static UserDao dao;
	private UserDao() {};
	public static UserDao getInstance() {
		if(dao==null) {
			dao=new UserDao();
		}
		return dao;
	}
	public boolean insert(UserDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn= new DbcpBean().getConn();
			String sql ="insert into user_info"
					+ "	values(?,?,?,?,?,?,sysdate) ";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getUserName());
				pstmt.setString(2, dto.getUserId());
				pstmt.setString(3, dto.getUserPw());
				pstmt.setString(4, dto.getUserGender());
				pstmt.setString(5, dto.getUserPhone());
				pstmt.setString(6, dto.getUserEmail());
				flag=pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {};
			}
			if(flag>0) {
				return true;
			}else {
				return false;
			}
		}
	public List<UserDto> getList(){
		List<UserDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn= new DbcpBean().getConn();
			String sql="select * from user_info"
					 + " order by regdate asc";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					UserDto dto=new UserDto();
					dto.setUserName(rs.getString("userName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPw(rs.getString("userPw"));
					dto.setUserGender(rs.getString("userGender"));
					dto.setUserPhone(rs.getString("userPhone"));
					dto.setUserEmail(rs.getString("userEmamil"));
					dto.setUserRegdate(rs.getString("userRegdate"));
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {}
			}
		return list;
	}
}

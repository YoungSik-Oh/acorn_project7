package project7.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project7.userdto.UserDto;
import project7.util.DbcpBean;


public class UserDao {
	private static UserDao dao;
	private UserDao() {}
	public static UserDao getInstance() {
		if(dao==null) {
			dao=new UserDao();
		}
		return dao;
	}
	//인자로 전달된 id에 해당하는 정보를 삭제하는 메소드
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection Pool에서 Connection객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "DELETE FROM user_info"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, id);
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 반납하기
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	//인자로 전달된 id에 해당하는 정보를 리턴하는 메소드
	public UserDto getData(String id) {
		//userDto객체의 참조값을 담을 지역변수 만들기
		UserDto dto=null;
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "SELECT name ,pwd, sex, phone, email, regdate"
					+ " FROM user_info"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, id);
			//select문 수행하고 결과 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기
			if(rs.next()) {
				//UserDto 객체를 생성하고
				dto=new UserDto();
				//select된 결과를 BoardDto객체에 담는다.
				dto.setName(rs.getString("name"));
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setSex(rs.getString("sex"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	
	
	
	//UserDto 객체에 있는 id, pwd가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UserDto dto) {
				//유효한 정보인지 여부를 담을 지역변수 만들고 초기값 false부여하기
				boolean isValid=false;
				//필요한 객체의 참조값을 담을 지역변수 만들기
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs=null;
				try {
					conn = new DbcpBean().getConn();
					//실행할 sql 문 준비하기 
					String sql = "SELECT id"
							+ " FROM user_info"
							+ " WHERE id=? AND pwd=?";
					pstmt = conn.prepareStatement(sql);
					//? 에 바인딩 할 값이 있으면 바인딩한다.
					pstmt.setString(1, dto.getId());
					pstmt.setString(2, dto.getPwd());
					//select문 수행하고 결과 받아오기
					rs=pstmt.executeQuery();
					//반복문 돌면서 결과 값 추출하기
					if(rs.next()) {
						//select 된 결과가 있으면 유효한 정보이므로 isValid에 true
						isValid=true;
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (Exception e) {
					}
				}
				//아이디 비밀번호가 유효한 정보인지 여부를 리턴.
				return isValid;
	}
	
	
	//회원정보를 저장하는 메소드(profile 칼럼은 제외)
	public boolean insert(UserDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection Pool에서 Connection객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "INSERT INTO user_info"
					+ " (name, id, pwd, sex, phone, email, regdate)"
					+ " VALUES(?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());		
			pstmt.setString(4, dto.getSex());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();//Connection 반납하기
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//중복체크하는 메소드
	public int duplecateID(String id){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cnt=0;
		try{
			conn=new DbcpBean().getConn();
			//아이디 중복 확인
			String sql=" SELECT count(name) as cnt "
						+" FROM user_info"
						+" WHERE name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
				}
			}catch(Exception e){
				System.out.println("아이디 중복 확인 실패 : " + e);
				}//try end 
		return cnt;
		}//duplecateID end
}

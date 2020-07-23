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
	// 회원 가입
	public boolean insert(UserDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn= new DbcpBean().getConn();
			String sql ="insert into user_info"
					+ " (userName, userId, userPw, userGender, userPhone, userEmail, regdate)"
					+ "	values(?,?,?,?,?,?,sysdate)";
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
	//회원 목록 출력
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
	//회원정보 수정
	public boolean update(UserDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE user_info"
					+ " SET userprofile=?, userphone=?, useremail=?"
					+ " WHERE userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserProfile());
			pstmt.setString(2, dto.getUserPhone());
			pstmt.setString(3, dto.getUserEmail());
			pstmt.setString(4, dto.getUserId());
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				} catch (Exception e) {}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
	}
	//회원정보삭제
	public boolean delete(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM user_info"
					+ " WHERE userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close(); //Connection 반납하기
			} catch (Exception e) {}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
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
					String sql = "SELECT userid"
							+ " FROM user_info"
							+ " WHERE userid=? AND userpw=?";
					pstmt = conn.prepareStatement(sql);
					//? 에 바인딩 할 값이 있으면 바인딩한다.
					pstmt.setString(1, dto.getUserId());
					pstmt.setString(2, dto.getUserPw());
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
						if (rs != null)rs.close();
						if (pstmt != null)pstmt.close();
						if (conn != null)conn.close();
					} catch (Exception e) {}
				}
				//아이디 비밀번호가 유효한 정보인지 여부를 리턴.
				return isValid;
	}
	//userId 중복체크하는 메소드
	public int duplecateID(String userid){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cnt=0;
		try{
			conn=new DbcpBean().getConn();
			//아이디 중복 확인
			String sql=" SELECT count(username) as cnt "
						+" FROM user_info"
						+" WHERE username = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
				}
			}catch(Exception e){
				System.out.println("아이디 중복 확인 실패 : " + e);
				}//try end 
		return cnt;
		}//duplecateID end
	
	//인자로 전달된 id에 해당하는 정보를 리턴하는 메소드
	public UserDto getData(String userid) {
		//UserzDto객체의 참조값을 담을 지역변수 만들기
		UserDto dto=null;
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "SELECT username ,userpw, usergender, userphone, useremail, regdate, userprofile"
					+ " FROM user_info"
					+ " WHERE userid=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, userid);
			//select문 수행하고 결과 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기
			if(rs.next()) {
				//UserzDto 객체를 생성하고
				dto=new UserDto();
				//select된 결과를 BoardDto객체에 담는다.
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(userid);
				dto.setUserPw(rs.getString("userPw"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserPhone(rs.getString("userPhone"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserRegdate(rs.getString("Regdate"));
				dto.setUserProfile(rs.getString("userProfile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		return dto;
	}
	//인자로 전달된 아이디가 users 테이블에 존재하는지 여부를 리턴하는 메소드
    public boolean isExist(String inputId) {
          //아이디가 있으면 true로 바뀌게
          boolean isExist=false;
          //필요한 객체의 참조값을 담을 지역변수 만들기
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs=null;
          try {
             conn = new DbcpBean().getConn();
             //실행할 sql 문 준비하기 
             String sql = "SELECT userid"
                   + " FROM user_info"
                   + " WHERE userid=?";
             pstmt = conn.prepareStatement(sql);
             //? 에 바인딩 할 값이 있으면 바인딩한다.
             pstmt.setString(1, inputId);
             //select문 수행하고 결과 받아오기
             rs=pstmt.executeQuery();
             //반복문 돌면서 결과 값 추출하기
             if(rs.next()) {
                isExist=true;//해당 아이디가 이미 존재하는 경우
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
                } catch (Exception e) { }
             }
             return isExist; //아이디 존재 여부를 리턴한다.
          }
}

package project7.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import project7.store.dto.StoreDto;
import project7.util.DbcpBean;

public class StoreDao {
	private static StoreDao dao;
	private StoreDao() {};
	public static StoreDao getInstance() {
		if(dao==null) {
			dao=new StoreDao();
		}
		return dao;
	}
	//글 하나의 정보를 리턴하는 메소드
		public StoreDto getData(String name) {
			//글하나의 정보를 담을 BoardDto
			StoreDto dto=null;
			//필요한 객체의 참조값을 담을 지역변수 만들기
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기 
				String sql = "SELECT name, addr, phone, smenu, sprice, time, rtime, lorder, rday, udate"
						+ " FROM store"
						+ " WHERE name=?";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩 할 값이 있으면ll 바인딩한다.
				pstmt.setString(1, name);
				//select문 수행하고 결과 받아오기
				rs=pstmt.executeQuery();
				//반복문 돌면서 결과 값 추출하기
				if(rs.next()) {
					//BoardDto 객체를 생성하고
					dto=new StoreDto();
					//select된 결과를 BoardDto객체에 담는다.
					dto.setName(name);
					dto.setAddr(rs.getString("addr"));
					dto.setPhone(rs.getString("phone"));
					dto.setSmenu(rs.getString("smenu"));
					dto.setSprice(rs.getString("sprice"));
					dto.setTime(rs.getString("time"));
					dto.setRtime(rs.getString("rtime"));
					dto.setLorder(rs.getString("lorder"));
					dto.setRday(rs.getString("rday"));
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
	
	
}

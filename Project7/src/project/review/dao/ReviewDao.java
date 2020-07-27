package project.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.review.dto.ReviewDto;
import project7.util.DbcpBean;

public class ReviewDao {
	//1. 자신의 참조값을 저장할 수 있는 private static 필드
		private static ReviewDao dao;
		//2. 외부에서 객체 생성하지 못하도록 생성자의 접근 지정자를 private로 지정
		private ReviewDao() {}
		
		//3. 자신의 참조값을 리턴해주는 public static 메소드
		public static ReviewDao getInstance() {
			if(dao==null) {
				dao=new ReviewDao();
			}
			return dao;
		}
		//글 전체 목록을 리턴하는 메소드(글 번호에 대해 내림차순 정렬)
		public List<ReviewDto> getList(){
			//글 목록을 저장할 ArrayList생성
			List<ReviewDto> list=new ArrayList<>();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				conn=new DbcpBean().getConn();
				String sql="SELECT r_num,r_writer,r_content,r_imagePath,r_regdate"
						+ " FROM review"
						+ " ORDER BY r_num DESC";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					//현재 커서가 위치한 곳의 글 정보를 읽어서 BoardDto객체에 담은 다음
					ReviewDto dto=new ReviewDto();
					dto.setR_num(rs.getInt("r_num"));
					dto.setR_writer(rs.getString("r_writer"));
					dto.setR_content(rs.getString("r_content"));
					dto.setR_imagePath(rs.getString("r_imagePath"));
					dto.setR_regdate(rs.getString("r_regdate"));
					//생성된 BoardDto객체의 참조값을 ArrayList객체에 누적시킨다.
					list.add(dto);
				}
			}catch(Exception e) {
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
		
		//글 하나의 정보를 삭제하는 메소드
		public boolean delete(int r_num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				//Connection Pool에서 Connection객체를 하나 가지고 온다.
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기 
				String sql = "DELETE FROM review"
						+ " WHERE r_num=?";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩 할 값이 있으면 바인딩한다.
				pstmt.setInt(1, r_num);
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
		
		//글 하나의 정보를 저장하는 메소드
		public boolean insert(ReviewDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				//Connection Pool에서 Connection객체를 하나 가지고 온다.
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기 
				String sql = "INSERT INTO review"
						+ " (r_num, r_writer, r_content, r_imagePath, r_regdate)"
						+ " VALUES(review_seq.NEXTVAL, ?, ?, ?, sysdate)";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩 할 값이 있으면 바인딩한다.
				pstmt.setString(1, dto.getR_writer());
				pstmt.setString(2, dto.getR_content());
				pstmt.setString(3, dto.getR_imagePath());
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
}

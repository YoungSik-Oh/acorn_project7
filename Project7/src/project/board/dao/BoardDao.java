package project.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.board.dto.BoardDto;
import project7.util.DbcpBean;


public class BoardDao {
	//1. 자신의 참조값을 저장할 수 있는 private static 필드
	private static BoardDao dao;
	//2. 외부에서 객체 생성하지 못하도록 생성자의 접근 지정자를 private로 지정
	private BoardDao() {}
	
	//3. 자신의 참조값을 리턴해주는 public static 메소드
	public static BoardDao getInstance() {
		if(dao==null) {
			dao=new BoardDao();
		}
		return dao;
	}
	//글 하나의 정보를 저장하는 메소드
	public boolean insert(BoardDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection Pool에서 Connection객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "INSERT INTO board"
					+ " (num, writer, title, content, regdate)"
					+ " VALUES(board_seq.NEXTVAL, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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
	//글 하나의 정보를 수정하는 메소드
	public boolean update(BoardDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
		conn=new DbcpBean().getConn();
		String sql="UPDATE board"
			     +" SET writer=?, title=?, content=?"
			     +" WHERE num =?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getWriter());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setInt(4, dto.getNum());
		flag=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
		
	}
	//글 하나의 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection Pool에서 Connection객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "DELETE FROM board"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, num);
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
	//글 하나의 정보를 리턴하는 메소드
	public BoardDto getData(int num) {
		//글하나의 정보를 담을 BoardDto
		BoardDto dto=null;
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "SELECT writer, title, content, regdate"
					+ " FROM board"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면ll 바인딩한다.
			pstmt.setInt(1, num);
			//select문 수행하고 결과 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기
			if(rs.next()) {
				//BoardDto 객체를 생성하고
				dto=new BoardDto();
				//select된 결과를 BoardDto객체에 담는다.
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
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
	//글 전체 목록을 리턴하는 메소드(글 번호에 대해 내림차순 정렬)
	public List<BoardDto> getList(){
		//글 목록을 저장할 ArrayList생성
		List<BoardDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num,writer,title,content,regdate"
					+ " FROM board"
					+ " ORDER BY num DESC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//현재 커서가 위치한 곳의 글 정보를 읽어서 BoardDto객체에 담은 다음
				BoardDto dto=new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
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
}

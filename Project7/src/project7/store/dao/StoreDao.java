package project7.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.board.dto.BoardDto;
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
	// 페이징 처리 
	public int getCount() {
		int rowCount=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT MAX(ROWNUM) AS count"
					+ " FROM store";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rowCount=rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return rowCount;
	}
	
	// 글 추가 하는 메소드
	public boolean insert(StoreDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn= new DbcpBean().getConn();
			String sql ="insert into store"
					+ "	(snum, sname, saddr, sphone, stmenu, sprice, stime, sbtime, slorder, srday, smenu, udate, s_imgpath, contents)"
					+ "	values(store_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,sysdate,?,?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getSname());
				pstmt.setString(2, dto.getSaddr());
				pstmt.setString(3, dto.getSphone());
				pstmt.setString(4, dto.getStmenu());
				pstmt.setString(5, dto.getSprice());
				pstmt.setString(6, dto.getStime());
				pstmt.setString(7, dto.getSbtime());
				pstmt.setString(8, dto.getSlorder());
				pstmt.setString(9, dto.getSrday());
				pstmt.setString(10, dto.getSmenu());
				pstmt.setString(11, dto.getS_imgpath());
				pstmt.setString(12, dto.getContents());
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

	//글 하나의 정보를 삭제하는 메소드
		public boolean delete(int snum) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = "DELETE FROM store"
						+ " WHERE snum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, snum);
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}
		
	public List<StoreDto> getList(StoreDto dto){
		//글 목록을 저장할 ArrayList생성
		List<StoreDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();

			String sql="SELECT *"
					+ "	FROM"
					+ " 	(SELECT result1.*, ROWNUM AS rnum"
					+ "	FROM"
					+ " 		(SELECT snum, sname, smenu, contents, udate, s_imgpath "
					+ " 		FROM store"
					+ " 		ORDER BY snum DESC) result1)"
					+ "	where rnum BETWEEN ? AND ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//현재 커서가 위치한 곳의 글 정보를 읽어서 BoardDto객체에 담은 다음
				StoreDto tdo=new StoreDto();
				tdo.setSnum(rs.getInt("snum"));
				tdo.setSname(rs.getString("sname"));
				tdo.setSmenu(rs.getString("smenu"));
				tdo.setContents(rs.getString("contents"));
				tdo.setUdate(rs.getString("udate"));
				tdo.setS_imgpath(rs.getString("s_imgpath"));
				//생성된 BoardDto객체의 참조값을 ArrayList객체에 누적시킨다.
				list.add(tdo);
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

//	public List<StoreDto> getList(){
//		//글 목록을 저장할 ArrayList생성
//		List<StoreDto> list=new ArrayList<>();
//		Connection conn=null;
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		try {
//			conn=new DbcpBean().getConn();
//			String sql="SELECT s_num, sname, saddr, smenu, udate, s_imgpath"
//					+ " FROM store"
//					+ " ORDER BY s_num DESC";
//			pstmt=conn.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				//현재 커서가 위치한 곳의 글 정보를 읽어서 BoardDto객체에 담은 다음
//				StoreDto dto=new StoreDto();
//				dto.setSnum(rs.getInt("s_num"));
//				dto.setSname(rs.getString("sname"));
//				dto.setSaddr(rs.getString("saddr"));
//				dto.setSmenu(rs.getString("smenu"));
//				dto.setUdate(rs.getString("udate"));
//				dto.setS_imgpath(rs.getString("s_imgpath"));
//				//생성된 BoardDto객체의 참조값을 ArrayList객체에 누적시킨다.
//				list.add(dto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(rs!=null)rs.close();
//				if(pstmt!=null)pstmt.close();
//				if(conn!=null)conn.close();
//			}catch(Exception e) {}
//		}
//		return list;
//	}
	
	public boolean update(StoreDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
		conn=new DbcpBean().getConn();
		String sql="UPDATE store"
			     +" SET sname=?, saddr=?, sphone=?, stmenu=?, sprice=?, stime=?, sbtime=?, slorder=?, srday=?, smenu=?, contents=?"
			     +" WHERE snum=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getSname());
		pstmt.setString(2, dto.getSaddr());
		pstmt.setString(3, dto.getSphone());
		pstmt.setString(4, dto.getStmenu());
		pstmt.setString(5, dto.getSprice());
		pstmt.setString(6, dto.getStime());
		pstmt.setString(7, dto.getSbtime());
		pstmt.setString(8, dto.getSlorder());
		pstmt.setString(9, dto.getSrday());
		pstmt.setString(10, dto.getSmenu());
		pstmt.setString(11, dto.getContents());
		pstmt.setInt(12, dto.getSnum());
		flag=pstmt.executeUpdate();
		} catch (SQLException e) {
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
	

	// 1개 정보 가져오는 메소드
	public StoreDto getData(int snum) {
		StoreDto dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
		String sql="select sname, saddr, sphone, stmenu, sprice, stime, sbtime, slorder, srday, smenu, contents,udate,s_imgpath "
				+ "from store"
				+ "	where snum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, snum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new StoreDto();
				dto.setSnum(snum);
				dto.setSname(rs.getString("sname"));
				dto.setSaddr(rs.getString("saddr"));
				dto.setSphone(rs.getString("sphone"));
				dto.setStmenu(rs.getString("stmenu"));
				dto.setSprice(rs.getString("sprice"));
				dto.setStime(rs.getString("stime"));
				dto.setSbtime(rs.getString("sbtime"));
				dto.setSlorder(rs.getString("slorder"));
				dto.setSrday(rs.getString("srday"));
				dto.setSmenu(rs.getString("smenu"));
				dto.setContents(rs.getString("contents"));
				dto.setUdate(rs.getString("udate"));
				dto.setS_imgpath(rs.getString("s_imgpath"));
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
		return dto;
		
	}
}



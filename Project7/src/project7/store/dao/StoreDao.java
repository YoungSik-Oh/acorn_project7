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
	// 글 추가 하는 메소드
	public boolean insert(StoreDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn= new DbcpBean().getConn();
			String sql ="insert into store"
					+ "	(s_num, sname, saddr, sphone, stmenu, sprice, stime, sbtime, slorder, srday, smenu, contents,udate)"
					+ "	values(store_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
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
	public List<StoreDto> getList(){
		//글 목록을 저장할 ArrayList생성
		List<StoreDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT s_num, sname, smenu, contents,udate"
					+ " FROM store"
					+ " ORDER BY s_num DESC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//현재 커서가 위치한 곳의 글 정보를 읽어서 BoardDto객체에 담은 다음
				StoreDto dto=new StoreDto();
				dto.setSnum(rs.getInt("s_num"));
				dto.setSname(rs.getString("sname"));
				dto.setSmenu(rs.getString("smenu"));
				dto.setContents(rs.getString("contents"));
				dto.setUdate(rs.getString("udate"));
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
	// 1개 정보 가져오는 메소드
	public StoreDto getData(int snum) {
		StoreDto dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
		String sql="select sname, saddr, sphone, stmenu, sprice, stime, sbtime, slorder, srday, smenu, udate "
				+ "from store"
				+ "	where s_num=?";
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

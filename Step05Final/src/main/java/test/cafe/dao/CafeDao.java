package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;

	private CafeDao() {
	}

	public static CafeDao getInstance() {
		if (dao == null) {
			dao = new CafeDao();
		}

		return dao;
	}
	
	//글 작성
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_cafe" 
					+ "	(num, writer, title, content, viewCount, regdate)" 
					+ "	VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return rowCount > 0;

	} //insert(CafeDto dto)

	//글 수정
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe" 
					+ " SET writer=?, content=?" 
					+ "	WHERE num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());

			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return rowCount > 0;

	} //update(CafeDto dto)

	//글 삭제
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_cafe" 
					+ "	WHERE num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return rowCount > 0;

	} //delete(int num)

	//글 하나 불러오기
	public CafeDto getData(int num) {
		CafeDto dto = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer, title, content, viewCount, regdate" 
					+ " FROM board_cafe" 
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
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
				e.printStackTrace();
			}
		}

		return dto;
	} //getData(int num)

	//전체 리스트를 불러오는 메소드
	public List<CafeDto> getListAll() {
		List<CafeDto> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();

			String sql = "SELECT num, writer, title, content, viewcount,"
					+ " TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') regdate" 
					+ " FROM board_cafe"
					+ "	ORDER BY num DESC";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CafeDto dto = new CafeDto();

				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
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
				e.printStackTrace();
			}
		}

		return list;
	}//getListAll
	
	//페이지에 해당하는 목록만 리턴하는 메소드
	public List<CafeDto> getList(CafeDto dto) {
		List<CafeDto> list = new ArrayList<CafeDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT *" 
					+ "   FROM" 
					+ "        (SELECT result1.*, ROWNUM AS rnum" 
					+ "         FROM" 
					+ "             (SELECT num, writer, title, content, viewcount, regdate" 
					+ "              FROM board_cafe" 
					+ "              ORDER BY num DESC) result1)" 
					+ "   WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CafeDto temp = new CafeDto();
				temp.setNum(rs.getInt("num"));
				temp.setWriter(rs.getString("writer"));
				temp.setTitle(rs.getString("title"));
				temp.setContent(rs.getString("content"));
				temp.setRegdate(rs.getString("regdate"));

				list.add(temp);
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

		return list;
	} //getList()

	//글의 조회수
	public boolean addViewCount(int num) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
					+ "	SET viewCount=viewCount+1"
					+ " WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			rowCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return rowCount > 0;

	} //addViewCount(int num)
}

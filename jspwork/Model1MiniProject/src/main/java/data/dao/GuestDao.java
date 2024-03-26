package data.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.GuestDto;
import mysql.db.DbConnect;

public class GuestDao {

	DbConnect db = new DbConnect();

	// insert
	public void insertGuest(GuestDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into memberguest values(null,?,?,?,0,now())";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMyid());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPhotoname());

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 페이징 ..1.전체갯수반환 2.부분조회(startnum부터 page갯수만큼 반환)
	// 1.전체갯수반환
	public int getTotalCount() {
		int n = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from memberguest";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				n = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return n;
	}

	// 2.부분조회(startnum부터 page갯수만큼 반환)
	public List<GuestDto> getPagingList(int startNum, int perPage) {
		List<GuestDto> list = new ArrayList<GuestDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from memberguest order by num desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startNum);
			pstmt.setInt(2, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GuestDto dto = new GuestDto();

				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setPhotoname(rs.getString("photoname"));
				dto.setChu(rs.getInt("chu"));
				dto.setWriteday(rs.getTimestamp("writeday"));

				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	// 조회수 1증가하는 메서드
	public void updateChu(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update memberguest set chu=chu+1 where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	public int getMaxNum() {
		int max = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select max(num) max from memberguest";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				max = rs.getInt("max"); // rs.getInt(1)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return max;
	}
	
	public GuestDto getData(String num) {
		GuestDto dto = new GuestDto();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from memberguest where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setPhotoname(rs.getString("photoname"));
				dto.setChu(rs.getInt("chu"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//수정
		public void updateGuest(GuestDto dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
		
			String sql = "update memberguest set content=?, photoname=? where num=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getContent());
				pstmt.setString(2, dto.getPhotoname());
				pstmt.setString(3, dto.getNum());
				
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		//삭제
		public void deleteGuest(String num) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;

			String sql = "delete from memberguest where num=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}

}

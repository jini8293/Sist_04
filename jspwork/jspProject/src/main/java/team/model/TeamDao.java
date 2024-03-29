package team.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import mysql.db.DbConnect;

public class TeamDao {

	DbConnect db = new DbConnect();

	public void insertTeam(TeamDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into team (name,driver, addr, writeday) values(?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDriver());
			pstmt.setString(3, dto.getAddr());

			// 실행
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	public ArrayList<TeamDto> listTeam() {
		ArrayList<TeamDto> team = new ArrayList<TeamDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from team order by num";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeamDto dto = new TeamDto();

				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setDriver(rs.getString("driver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWriteday(rs.getTimestamp("writeday"));

				team.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return team;

	}
	
	
	public TeamDto getData(String num) {
		TeamDto dto = new TeamDto();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from team where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setDriver(rs.getString("driver"));
				dto.setAddr(rs.getString("addr"));
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
	
	public void teamUpdate(TeamDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
	
		String sql = "update team set name=?, driver=?, addr=? where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDriver());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getNum());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void teamDelete(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from team where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}

}

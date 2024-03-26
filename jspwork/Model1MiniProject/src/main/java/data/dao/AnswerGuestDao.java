package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.AnswerGuestDto;
import data.dto.GuestDto;
import mysql.db.DbConnect;

public class AnswerGuestDao {

	DbConnect db = new DbConnect();

	// insert
	public void insertAnswer(AnswerGuestDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into answerguest values(null,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getMyid());
			pstmt.setString(3, dto.getContent());

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	//
	public List<AnswerGuestDto> getAllAnswers(String num) {
		List<AnswerGuestDto> list = new ArrayList<AnswerGuestDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from answerguest where num=? order by idx";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, num);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				AnswerGuestDto dto = new AnswerGuestDto();

				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
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

	// 삭제
	public void deleteAnswer(String idx) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from answerguest where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}

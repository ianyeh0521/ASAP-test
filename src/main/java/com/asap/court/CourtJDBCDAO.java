package com.asap.court;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.asap.court.dao.CourtDAO_interface;
import com.asap.court.entity.CourtVO;

import java.util.ArrayList;

/**
 * Created by IanYeh
 * Creation date 2023/11/12
 */

public class CourtJDBCDAO implements CourtDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/asapdb?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "0521";
	
	// 新增一筆資料
	private static final String INSERT_STMT = 
			"INSERT INTO court (CourtName,CourtTypeNo,Indoor,CourtAddress,SiteNo,CourtLong, CourtLat, CourtText, CourtPplLimit, CourtPrice, CourtStat) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	// 取得所有場地資料，並依場地編號排序
	private static final String GET_ALL_STMT = "SELECT * FROM court order by CourtNo";
	
	// 使用場地編號取得該筆資料
	private static final String GET_ONE_STMT_BY_COURTNO = "SELECT * FROM court where courtNo = ?";
	
	// 使用名稱模糊查詢所有場地資料。之後記得設定引數 pstmt.setString(1, "%" + courtName + "%");
	private static final String GET_ONE_STMT_BY_COURTNAME = "SELECT * FROM court where courtName like ?";
	
	// 使用地址模糊查詢所有場地資料，之後記得設定引數 pstmt.setString(1, "%" + courtAddress + "%");
	private static final String GET_ONE_STMT_BY_ADDRESS = "SELECT * FROM court where courtAddress like ?";
	
	// 使用行政區域編號查詢所有場地資料
	private static final String GET_ALL_BY_SITENO = "SELECT * FROM court where siteNo = ?";
	
	// 刪除一筆資料
	private static final String DELETE = "DELETE FROM court where courtNo = ?";
	
	// 修改一筆資料
	private static final String UPDATE = 
		"UPDATE court set CourtName=?,CourtTypeNo=?,Indoor=?,CourtAddress=?,SiteNo=?,CourtLong=?, CourtLat=?, CourtText=?, CourtPplLimit=?, CourtPrice=?, CourtStat=? where courtNo = ?";
	

	@Override
	public void updateCourt(CourtVO courtVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, courtVO.getCourtName());
			pstmt.setInt(2, courtVO.getCourtTypeNo());
			pstmt.setBoolean(3, courtVO.getIndoor());
			pstmt.setString(4, courtVO.getCourtAddress());
			pstmt.setInt(5, courtVO.getSiteNo());
			pstmt.setBigDecimal(6, courtVO.getCourtLong());
			pstmt.setBigDecimal(7, courtVO.getCourtLat());
			pstmt.setString(8, courtVO.getCourtText());
			pstmt.setInt(9, courtVO.getCourtPplLimit());
			pstmt.setInt(10, courtVO.getCourtPrice());
			pstmt.setBoolean(11, courtVO.getCourtStat());
			pstmt.setInt(12, courtVO.getCourtNo());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void insertCourt(CourtVO courtVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, courtVO.getCourtName());
			pstmt.setInt(2, courtVO.getCourtTypeNo());
			pstmt.setBoolean(3, courtVO.getIndoor());
			pstmt.setString(4, courtVO.getCourtAddress());
			pstmt.setInt(5, courtVO.getSiteNo());
			pstmt.setBigDecimal(6, courtVO.getCourtLong());
			pstmt.setBigDecimal(7, courtVO.getCourtLat());
			pstmt.setString(8, courtVO.getCourtText());
			pstmt.setInt(9, courtVO.getCourtPplLimit());
			pstmt.setInt(10, courtVO.getCourtPrice());
			pstmt.setBoolean(11, courtVO.getCourtStat());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void deleteCourt(Integer courtNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, courtNo);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public CourtVO findByPK(Integer courtNo) {
		CourtVO courtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_COURTNO);

			pstmt.setInt(1, courtNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				courtVO = new CourtVO();
				courtVO.setCourtNo(rs.getInt("courtNo"));
				courtVO.setCourtName(rs.getString("courtName"));
				courtVO.setCourtTypeNo(rs.getInt("courtTypeNo"));
				courtVO.setIndoor(rs.getBoolean("indoor"));
				courtVO.setCourtAddress(rs.getString("courtAddress"));
				courtVO.setSiteNo(rs.getInt("siteNo"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLong"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLat"));
				courtVO.setCourtText(rs.getString("courtText"));
				courtVO.setCourtPplLimit(rs.getInt("courtPplLimit"));
				courtVO.setCourtPrice(rs.getInt("courtPrice"));
				courtVO.setCourtCrtTime(rs.getTimestamp("courtCrtTime"));
				courtVO.setCourtStat(rs.getBoolean("courtStat"));	
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return courtVO;
	}

	@Override
	public CourtVO findByCourtName(String courtName) {
		CourtVO courtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_COURTNO);
			pstmt.setString(1, "%" + courtName + "%");

			pstmt.setString(1, courtName);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				courtVO = new CourtVO();
				courtVO.setCourtNo(rs.getInt("courtNo"));
				courtVO.setCourtName(rs.getString("courtName"));
				courtVO.setCourtTypeNo(rs.getInt("courtTypeNo"));
				courtVO.setIndoor(rs.getBoolean("indoor"));
				courtVO.setCourtAddress(rs.getString("courtAddress"));
				courtVO.setSiteNo(rs.getInt("siteNo"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLong"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLat"));
				courtVO.setCourtText(rs.getString("courtText"));
				courtVO.setCourtPplLimit(rs.getInt("courtPplLimit"));
				courtVO.setCourtPrice(rs.getInt("courtPrice"));
				courtVO.setCourtCrtTime(rs.getTimestamp("courtCrtTime"));
				courtVO.setCourtStat(rs.getBoolean("courtStat"));	
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return courtVO;
	}

	@Override
	public CourtVO findByAddress(String courtAddress) {
		CourtVO courtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_COURTNO);
			pstmt.setString(1, "%" + courtAddress + "%");

			pstmt.setString(1, courtAddress);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				courtVO = new CourtVO();
				courtVO.setCourtNo(rs.getInt("courtNo"));
				courtVO.setCourtName(rs.getString("courtName"));
				courtVO.setCourtTypeNo(rs.getInt("courtTypeNo"));
				courtVO.setIndoor(rs.getBoolean("indoor"));
				courtVO.setCourtAddress(rs.getString("courtAddress"));
				courtVO.setSiteNo(rs.getInt("siteNo"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLong"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLat"));
				courtVO.setCourtText(rs.getString("courtText"));
				courtVO.setCourtPplLimit(rs.getInt("courtPplLimit"));
				courtVO.setCourtPrice(rs.getInt("courtPrice"));
				courtVO.setCourtCrtTime(rs.getTimestamp("courtCrtTime"));
				courtVO.setCourtStat(rs.getBoolean("courtStat"));	
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return courtVO;
	}

	@Override
	public CourtVO findBySite(Integer siteNo) {
		CourtVO courtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_COURTNO);

			pstmt.setInt(1, siteNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				courtVO = new CourtVO();
				courtVO.setCourtNo(rs.getInt("courtNo"));
				courtVO.setCourtName(rs.getString("courtName"));
				courtVO.setCourtTypeNo(rs.getInt("courtTypeNo"));
				courtVO.setIndoor(rs.getBoolean("indoor"));
				courtVO.setCourtAddress(rs.getString("courtAddress"));
				courtVO.setSiteNo(rs.getInt("siteNo"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLong"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLat"));
				courtVO.setCourtText(rs.getString("courtText"));
				courtVO.setCourtPplLimit(rs.getInt("courtPplLimit"));
				courtVO.setCourtPrice(rs.getInt("courtPrice"));
				courtVO.setCourtCrtTime(rs.getTimestamp("courtCrtTime"));
				courtVO.setCourtStat(rs.getBoolean("courtStat"));	
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return courtVO;
	}

	@Override
	public List<CourtVO> getAll() {
		List<CourtVO> courtList = new ArrayList<CourtVO>();
		CourtVO courtVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				courtVO = new CourtVO();
				courtVO.setCourtNo(rs.getInt("courtNo"));
				courtVO.setCourtName(rs.getString("courtName"));
				courtVO.setCourtTypeNo(rs.getInt("courtTypeNo"));
				courtVO.setIndoor(rs.getBoolean("indoor"));
				courtVO.setCourtAddress(rs.getString("courtAddress"));
				courtVO.setSiteNo(rs.getInt("siteNo"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLong"));
				courtVO.setCourtLong(rs.getBigDecimal("courtLat"));
				courtVO.setCourtText(rs.getString("courtText"));
				courtVO.setCourtPplLimit(rs.getInt("courtPplLimit"));
				courtVO.setCourtPrice(rs.getInt("courtPrice"));
				courtVO.setCourtCrtTime(rs.getTimestamp("courtCrtTime"));
				courtVO.setCourtStat(rs.getBoolean("courtStat"));	
				courtList.add(courtVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return courtList;
	}

}

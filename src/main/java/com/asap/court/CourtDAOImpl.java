package com.asap.court;

public class CourtDAOImpl implements CourtDAO{

	private static final String INSERT_STMT = "INSERT INTO court(courtNo, courtName, courtTypeNo, indoor, courtAddress, siteNo, courtLong, courtLat, courtText, courtPplLimit, courtPrice, courtCrtTime, courtStat) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE court SET courtName = ?, courtTypeNo = ?, indoor = ?, courtAddress = ?, siteNo = ?, courtLong = ?, courtLat = ?, courtText = ?, courtPplLimit = ?, courtPrice = ?, courtCrtTime = ?, courtStat = ? WHERE courtNo = ?";
	private static final String DELETE_STMT = "DELETE FROM court WHERE courtNo = ?";
	private static final String FIND_BY_PK = "SELECT * FROM court WHERE courtNo = ?";
	private static final String GET_ALL = "SELECT * FROM court";
	
	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}
}

package com.asap.court.service;



import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.asap.court.dao.CourtDAO;
import com.asap.court.dao.CourtDAO_interface;
import com.asap.court.entity.CourtVO;

// 搭配 JSP / Thymeleaf 後端渲染畫面，將交易動作至於 view filter
public class CourtService implements CourtService_interface {
	private static final long PAGE_MAX_RESULT = 5;
	// 一個 service 實體對應一個 dao 實體
	private CourtDAO_interface dao;
	
	public CourtService() {
		dao = new CourtDAO();
	}
	
	@Override
	public int add(CourtVO coutVO) {
		return dao.insert(coutVO);
	}

	@Override
	public CourtVO update(CourtVO coutVO) {
		dao.update(coutVO);
		return null;
	}

	@Override
	public void delete(Integer courtNo) {
		dao.delete(courtNo);
		
	}

	@Override
	public CourtVO getCourtByCourtNo(Integer courtNo) {
		return dao.getById(courtNo);
	}

	@Override
	public List<CourtVO> getAllCourts(int currentPage) {
		return dao.getAll(currentPage);
	}
	
	@Override
	public List<CourtVO> getAllCourts() {
		return dao.getAll();
	}
	

	@Override
	public List<CourtVO> getAllSorting(String orderBy) {
		return dao.getAllSorting(orderBy);
	}
	
	
	

	@Override
	public List<CourtVO> getAll(int startIndex, int pageSize) {
		return dao.getAll(startIndex, pageSize);
	}

	@Override
	public List<CourtVO> getAllCourtsSortingDis(BigDecimal userLatitude, BigDecimal userLongitude, String sortBy) {
		List<CourtVO> allCourts = dao.getAll();
		Map<Integer, Double> allCourtsDistanceMap = new HashMap<>();
		Double userLat = userLatitude.doubleValue();
		Double userLongi = userLongitude.doubleValue();
		for(CourtVO courtVO: allCourts) {
			Double lat = courtVO.getCourtLat().doubleValue();
			Double longi = courtVO.getCourtLong().doubleValue();
			allCourtsDistanceMap.put(courtVO.getCourtNo(), calculateHaversineDistance(userLat, userLongi, lat, longi));
		}
		
		List<Map.Entry<Integer, Double>> entryList = new ArrayList<>(allCourtsDistanceMap.entrySet());		
		
		if(sortBy.equals("asc")) {
			// 將 value(距離)由小到大排序
			entryList.sort(Map.Entry.comparingByValue());
			
		}else {
			// 將 value(距離)由大到小排序
			entryList.sort(Map.Entry.<Integer, Double>comparingByValue().reversed());
		}
		
		Map<Integer, Double> sortedMap = new LinkedHashMap<>();
		
		for (Map.Entry<Integer, Double> entry : entryList) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }
		
		List<CourtVO> sortedCourtVOList = new ArrayList<>();
		for(Map.Entry<Integer, Double> entry: sortedMap.entrySet()) {
			Integer courtNo = entry.getKey();
			CourtVO courtVO = allCourts.stream().filter(vo -> vo.getCourtNo().equals(courtNo)).findFirst().orElse(null);
			if(courtVO != null) {
				sortedCourtVOList.add(courtVO);
			}
		}
		
		return sortedCourtVOList;	
      
	}

	@Override
	public List<CourtVO> getCourtsByCompositeQuery(Map<String, String[]> map) {
		Map<String, String> query = new HashMap<>();
		// Map.Entry即代表一組key-value
		Set<Map.Entry<String, String[]>> entry = map.entrySet();
		
		for (Map.Entry<String, String[]> row : entry) {
			String key = row.getKey();
			// 因為請求參數裡包含了action，做個去除動作
			if ("action".equals(key)) {
				continue;
			}
			// 若是value為空即代表沒有查詢條件，做個去除動作
			String value = row.getValue()[0]; // getValue拿到一個String陣列, 接著[0]取得第一個元素檢查
			if (value == null || value.isEmpty()) {
				continue;
			}
			query.put(key, value);
		}
		
		System.out.println(query);
		
		return dao.getByCompositeQuery(query);
	}

//	@Override
//	public int getCountByCompositeQuery(Map<String, String[]> map) {
//		Map<String, String> query = new HashMap<>();
//		// Map.Entry即代表一組key-value
//		Set<Map.Entry<String, String[]>> entry = map.entrySet();
//		
//		for (Map.Entry<String, String[]> row : entry) {
//			String key = row.getKey();
//			// 因為請求參數裡包含了action，做個去除動作
//			if ("action".equals(key)) {
//				continue;
//			}
//			// 若是value為空即代表沒有查詢條件，做個去除動作
//			String value = row.getValue()[0]; // getValue拿到一個String陣列, 接著[0]取得第一個元素檢查
//			if (value == null || value.isEmpty()) {
//				continue;
//			}
//			query.put(key, value);
//		}
//		
//		System.out.println(query);
//		
//		long total = dao.getCountByCompositeQuery(query);
//		
//		int pageQty = (int)(total % PAGE_MAX_RESULT == 0 ? (total / PAGE_MAX_RESULT) : (total / PAGE_MAX_RESULT + 1));
//		
//		return pageQty;
//	}

//	@Override
//	public int getPageTotal() {
//		long total = dao.getTotal();
//		// 計算Emp數量每頁3筆的話總共有幾頁
//		int pageQty = (int)(total % PAGE_MAX_RESULT == 0 ? (total / PAGE_MAX_RESULT) : (total / PAGE_MAX_RESULT + 1));
//		return pageQty;
//	}

	@Override
	public List<CourtVO> getCourtsByCourtName(String name) {
		return dao.getCourtsByName(name);
	}

	
	// 經緯度計算距離
	public double calculateHaversineDistance(double userLat, double userLong, double lat, double longi) {
		// Radius of the Earth in kilometers
        double earthRadius = 6371;

        // Convert latitude and longitude from degrees to radians
        double userLati = Math.toRadians(userLat);
        double userLongi = Math.toRadians(userLong);
        double lati = Math.toRadians(lat);
        double longitude = Math.toRadians(longi);

        // Calculate differences
        double latDiff = userLati - lati;
        double lonDiff = userLongi - longitude;

        // Haversine formula
        double a = Math.sin(latDiff / 2) * Math.sin(latDiff / 2) +
                   Math.cos(userLati) * Math.cos(lati) *
                   Math.sin(lonDiff / 2) * Math.sin(lonDiff / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        // Calculate distance
        double distance = earthRadius * c;

        return distance;
    }

	@Override
	public int getTotalPage() {
		long total = dao.getTotal();
		int pageQty = (int)(total % PAGE_MAX_RESULT == 0 ? (total / PAGE_MAX_RESULT) : (total / PAGE_MAX_RESULT + 1));
		return pageQty;
	}
	
	
	
	
	

}

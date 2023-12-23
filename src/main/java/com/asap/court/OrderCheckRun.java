package com.asap.court;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;


import com.asap.court.entity.CourtOrderVO;
import com.asap.court.service.CourtClosedTimeService_interface;
import com.asap.court.service.CourtOrderService;
import com.asap.court.service.CourtOrderService_interface;

public class OrderCheckRun implements Runnable{

	private CourtOrderService_interface courtOrderSvc;
	private CourtClosedTimeService_interface courtClosedTimeSvc;
	
	@Override
	public void run() {
		LocalDate currentDate = LocalDate.now();

		Date currentDateAsDate = Date.valueOf(currentDate);
		
		courtOrderSvc = new CourtOrderService();
		// 前一天未付款之訂單，且場地開放時間為今天之後的
		try {
			List<CourtOrderVO> unPaidCourtList = courtOrderSvc.getAllUnPaidCourt(currentDateAsDate);
			
			for(CourtOrderVO courtOrderVO: unPaidCourtList) {
				int courtNo = courtOrderVO.getCourtOrdNo();
				int startTime = courtOrderVO.getCourtOrdTime();
				int endTime = courtOrderVO.getCourtOrdTimeEnd();
				Date ordDate = courtOrderVO.getCourtOrdDate();
				for(int i = startTime; i < endTime; i++) {
					System.out.println(courtClosedTimeSvc.delete(courtNo, ordDate, i));
					
				}
			}
			
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		
		
	}

	
}

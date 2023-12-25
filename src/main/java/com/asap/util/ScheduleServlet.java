//package com.asap.util;
//
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Timestamp;
//import java.time.Instant;
//import java.util.*;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.asap.shop.entity.ItemInfoVO;
//import com.asap.shop.entity.OrderDetailVO;
//import com.asap.shop.entity.OrderVO;
//import com.asap.shop.service.ItemInfoService;
//import com.asap.shop.service.ItemInfoService_interface;
//import com.asap.shop.service.OrderDetailService;
//import com.asap.shop.service.OrderDetailService_interface;
//import com.asap.shop.service.OrderService;
//import com.asap.shop.service.OrderService_interface;
//
//@WebServlet(urlPatterns ="/ScheduleServlet",loadOnStartup = 5)
//public class ScheduleServlet extends HttpServlet {
//	int count=0;
//	Timer timer= new Timer() ;
//	
//	public void timer() {
//		
//		TimerTask task=new TimerTask() {
//			public void run() {
//				OrderService_interface orderSvc = new OrderService();
//				ItemInfoService_interface itemInfoSvc = new ItemInfoService();
//				OrderDetailService_interface ordDetailSvc = new OrderDetailService();
//				List<OrderVO> unpaidList= orderSvc.checkUnpaid();
//				System.out.println(unpaidList);
//				for(OrderVO order: unpaidList) {
//					Timestamp sqlDate= order.getOrderCrtTime();
//					java.util.Date nowDate = new java.util.Date();
//					long sqlTimestamp = sqlDate.getTime();
//					System.out.println(sqlTimestamp);
//					long nowTimestamp = nowDate.getTime();
//					System.out.println(nowTimestamp);
//					long timeDiff = nowTimestamp - sqlTimestamp;
//					if(timeDiff>60*60*1000) {
//						Integer orderNo= order.getOrderNo();
//						List <OrderDetailVO> orderdetails = ordDetailSvc.checkerFindByOrderNo(orderNo);
//						for(OrderDetailVO orderitem: orderdetails) {
//							Integer itemno= orderitem.getItemInfoVO().getItemNo();
//							System.out.println("this is itemno:"+itemno);
//							Integer itemqty= orderitem.getItemOrderQty();
//							System.out.println("this is itemqty:"+itemqty);
//							ItemInfoVO itemInfoVO= itemInfoSvc.checkerFindByItemNo(itemno);
//							System.out.println("this is iteminfoVo:"+itemInfoVO);
//							Integer inStock=itemInfoVO.getItemStockQty();
//							System.out.println("this is instock:"+inStock);
//							itemInfoVO.setItemStockQty(inStock+itemqty);
//							itemInfoSvc.checkerUpdate(itemInfoVO);
//						}
//						order.setOrderStat(4);
//						order.setOrderCancelTime(new java.sql.Timestamp(System.currentTimeMillis()));
//						System.out.println( orderSvc.checkerUpdate(order));
//						
//					}
//				}
//				
////				Date date = Date.from(Instant.now());
////				System.out.println("This is task NO "+ count+".");
////				System.out.println("This task is supposed to be done on "+ new Date(scheduledExecutionTime()));
////				System.out.println("Time Now:"+date);
////				
////				count++;
//			}
//		};
//		Calendar cal= new GregorianCalendar(2023, Calendar.DECEMBER,24,23,0,0);
//		timer.scheduleAtFixedRate(task, cal.getTime(), 1*60*60*1000);
//	}
//	
//	public void init() {
//		timer();
//	}
//
//	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		res.setContentType("text/plain");
//	    PrintWriter out = res.getWriter();
//		count++;                                                         
//	    out.println("Since the beginning, this servlet has been accessed " +
//	                count + " times."); 
//	}
//	
//	public void destroy() {
//		timer.cancel();
//	}
//
//	
//}

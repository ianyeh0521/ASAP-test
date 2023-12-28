package com.asap.court;

import java.io.Console;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class BackgroundOrderManager implements ServletContextListener{

	private ScheduledExecutorService scheduler;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		scheduler = Executors.newSingleThreadScheduledExecutor();
		
		// 初始時間設定
		long initialDelay = calculateInitialDelayUntilMidnight();
//		System.out.println("initialDelay = "+initialDelay+" sec");
		
        scheduler.scheduleAtFixedRate(new OrderCheckByDay(), initialDelay, 24 * 60 * 60, TimeUnit.SECONDS);
        
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		scheduler.shutdownNow();
	}
	
	private long calculateInitialDelayUntilMidnight() {
        LocalDateTime now = LocalDateTime.now();

        // 距離午夜的時間
        LocalDateTime midnight = now.with(LocalTime.MIDNIGHT).plusDays(1);
        Duration durationUntilMidnight = Duration.between(now, midnight);

        // 距離時間轉成秒數
        long initialDelay = durationUntilMidnight.getSeconds();

        return initialDelay;
    }
	
	
}

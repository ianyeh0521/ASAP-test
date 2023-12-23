package com.asap.court;

import java.time.LocalDateTime;

public class SchedulerTest implements Runnable{

	
	
	@Override
	public void run() {
		System.out.println("我執行了!" + LocalDateTime.now());
		
	}

	
}

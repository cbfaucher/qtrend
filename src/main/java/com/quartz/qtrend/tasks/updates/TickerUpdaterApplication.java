package com.quartz.qtrend.tasks.updates;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement(proxyTargetClass=true)
@ImportResource(locations = "classpath:/com/quartz/qtrend/qtrend-common.xml")
@ComponentScan("com.quartz.qtrend")
public class TickerUpdaterApplication {
}

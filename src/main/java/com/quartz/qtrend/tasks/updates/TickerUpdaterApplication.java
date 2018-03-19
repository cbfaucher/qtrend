package com.quartz.qtrend.tasks.updates;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource(locations = {"classpath:/com/quartz/qtrend/qtrend-common.xml",
                             "classpath:/com/quartz/qtrend/qtrend-database.xml",
                             "classpath:/com/quartz/qtrend/qtrend-dao.xml",
                             "classpath:/com/quartz/qtrend/qtrend-service.xml"})
public class TickerUpdaterApplication {
}

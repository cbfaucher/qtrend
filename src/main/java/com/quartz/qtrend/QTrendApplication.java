package com.quartz.qtrend;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource({"classpath:/com/quartz/qtrend/qtrend-common.xml",
                 "classpath:/com/quartz/qtrend/qtrend-database.xml",
                 "classpath:/com/quartz/qtrend/qtrend-dao.xml",
                 "classpath:/com/quartz/qtrend/qtrend-service.xml",
//                 "classpath:/com/quartz/qtrend/qtrend-operations.xml",
                 "classpath:/com/quartz/qtrend/qtrend-events.xml",
                 "classpath:/com/quartz/qtrend/qtrend-main-frame.xml",
                 "classpath:/com/quartz/qtrend/ui/watchlists/qtrend-watchlists.xml",
                 "classpath:/com/quartz/qtrend/ui/exchanges/qtrend-exchange-dialog.xml",
                 "classpath:/com/quartz/qtrend/ui/configuration/qtrend-configuration-ui-beans.xml"}
                 )
public class QTrendApplication {
}

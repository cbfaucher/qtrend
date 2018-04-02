package com.quartz.qtrend;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@ImportResource({"classpath:/com/quartz/qtrend/qtrend-common.xml",
//                 "classpath:/com/quartz/qtrend/qtrend-operations.xml",
                 "classpath:/com/quartz/qtrend/qtrend-events.xml",
                 "classpath:/com/quartz/qtrend/qtrend-main-frame.xml",
                 "classpath:/com/quartz/qtrend/ui/watchlists/qtrend-watchlists.xml",
                 "classpath:/com/quartz/qtrend/ui/exchanges/qtrend-exchange-dialog.xml",
                 "classpath:/com/quartz/qtrend/ui/configuration/qtrend-configuration-ui-beans.xml"}
                 )
@ComponentScan("com.quartz.qtrend")
public class QTrendApplication {
}

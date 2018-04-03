package com.quartz.qtrend.dom.dao;

import com.quartz.qtrend.dom.watchlists.WatchListService;
import lombok.NonNull;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class StockQuoteDAOTestApplication {

    @Bean
    @Primary
    public StockQuoteDAO stockQuoteDAO(@NonNull final JdbcTemplate jdbcTemplate) {
        return new StockQuoteDAO(jdbcTemplate);
    }
}

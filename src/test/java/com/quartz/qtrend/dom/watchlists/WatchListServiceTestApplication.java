package com.quartz.qtrend.dom.watchlists;

import lombok.NonNull;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class WatchListServiceTestApplication {

    @Bean
    @Primary
    public WatchListService watchListService(@NonNull final JdbcTemplate jdbcTemplate) {
        return new WatchListService(jdbcTemplate);
    }
}

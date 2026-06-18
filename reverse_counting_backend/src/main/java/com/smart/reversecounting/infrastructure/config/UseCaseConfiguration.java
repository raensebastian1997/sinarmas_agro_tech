package com.smart.reversecounting.infrastructure.config;

import com.smart.reversecounting.application.port.in.CalculateReverseDifferenceUseCase;
import com.smart.reversecounting.application.service.CalculateReverseDifferenceService;
import com.smart.reversecounting.domain.service.ReverseDifferenceCalculator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UseCaseConfiguration {

    @Bean
    ReverseDifferenceCalculator reverseDifferenceCalculator() {
        return new ReverseDifferenceCalculator();
    }

    @Bean
    CalculateReverseDifferenceUseCase calculateReverseDifferenceUseCase(ReverseDifferenceCalculator calculator) {
        return new CalculateReverseDifferenceService(calculator);
    }
}

package com.smart.reversecounting.application.service;

import com.smart.reversecounting.application.dto.CalculateReverseDifferenceCommand;
import com.smart.reversecounting.application.port.in.CalculateReverseDifferenceUseCase;
import com.smart.reversecounting.domain.model.ReverseDifference;
import com.smart.reversecounting.domain.service.ReverseDifferenceCalculator;

public class CalculateReverseDifferenceService implements CalculateReverseDifferenceUseCase {

    private final ReverseDifferenceCalculator calculator;

    public CalculateReverseDifferenceService(ReverseDifferenceCalculator calculator) {
        this.calculator = calculator;
    }

    @Override
    public ReverseDifference calculate(CalculateReverseDifferenceCommand command) {
        return calculator.calculate(command.rawNumber());
    }
}

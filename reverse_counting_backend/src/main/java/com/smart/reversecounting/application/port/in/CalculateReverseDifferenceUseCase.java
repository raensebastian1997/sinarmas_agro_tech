package com.smart.reversecounting.application.port.in;

import com.smart.reversecounting.application.dto.CalculateReverseDifferenceCommand;
import com.smart.reversecounting.domain.model.ReverseDifference;

public interface CalculateReverseDifferenceUseCase {

    ReverseDifference calculate(CalculateReverseDifferenceCommand command);
}

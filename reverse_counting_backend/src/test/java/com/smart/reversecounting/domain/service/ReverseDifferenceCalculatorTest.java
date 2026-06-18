package com.smart.reversecounting.domain.service;

import com.smart.reversecounting.domain.exception.InvalidWholeNumberException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class ReverseDifferenceCalculatorTest {

    private final ReverseDifferenceCalculator calculator = new ReverseDifferenceCalculator();

    @ParameterizedTest
    @CsvSource(value = {
            "21 | 21 | 12 | 9",
            "30 | 30 | 3 | 27",
            "1.2 | 12 | 21 | 9",
            "1,2 | 12 | 21 | 9",
            "00030 | 30 | 3 | 27",
            "12345678901234567890 | 12345678901234567890 | 9876543210987654321 | 2469135690246913569"
    }, delimiter = '|')
    void calculatesPositiveDifference(String rawInput, String number, String reversedNumber, String difference) {
        var result = calculator.calculate(rawInput);

        assertThat(result.number().toString()).isEqualTo(number);
        assertThat(result.reversedNumber().toString()).isEqualTo(reversedNumber);
        assertThat(result.difference().toString()).isEqualTo(difference);
    }

    @Test
    void rejectsInputWithoutAnyDigit() {
        assertThatThrownBy(() -> calculator.calculate("abc.,"))
                .isInstanceOf(InvalidWholeNumberException.class)
                .hasMessage("number must contain at least one digit");
    }
}

package com.smart.reversecounting.domain.service;

import com.smart.reversecounting.domain.exception.InvalidWholeNumberException;
import com.smart.reversecounting.domain.model.ReverseDifference;

import java.math.BigInteger;

public class ReverseDifferenceCalculator {

    public ReverseDifference calculate(String rawNumber) {
        String normalizedNumber = normalize(rawNumber);
        BigInteger number = new BigInteger(normalizedNumber);
        BigInteger reversedNumber = new BigInteger(reverse(normalizedNumber));
        BigInteger difference = number.subtract(reversedNumber).abs();

        return new ReverseDifference(number, reversedNumber, difference);
    }

    private String normalize(String rawNumber) {
        if (rawNumber == null) {
            throw new InvalidWholeNumberException("number must contain at least one digit");
        }

        String digitsOnly = keepAsciiDigits(rawNumber);
        if (digitsOnly.isBlank()) {
            throw new InvalidWholeNumberException("number must contain at least one digit");
        }

        return new BigInteger(digitsOnly).toString();
    }

    private String keepAsciiDigits(String value) {
        StringBuilder digits = new StringBuilder(value.length());
        for (int index = 0; index < value.length(); index++) {
            char character = value.charAt(index);
            if (character >= '0' && character <= '9') {
                digits.append(character);
            }
        }
        return digits.toString();
    }

    private String reverse(String number) {
        return new StringBuilder(number).reverse().toString();
    }
}

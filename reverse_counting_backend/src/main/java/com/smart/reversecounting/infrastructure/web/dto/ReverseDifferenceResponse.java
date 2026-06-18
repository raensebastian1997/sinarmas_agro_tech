package com.smart.reversecounting.infrastructure.web.dto;

import com.smart.reversecounting.domain.model.ReverseDifference;

public record ReverseDifferenceResponse(
        String originalInput,
        String normalizedNumber,
        String reversedNumber,
        String difference
) {

    public static ReverseDifferenceResponse from(String originalInput, ReverseDifference result) {
        return new ReverseDifferenceResponse(
                originalInput,
                result.number().toString(),
                result.reversedNumber().toString(),
                result.difference().toString()
        );
    }
}

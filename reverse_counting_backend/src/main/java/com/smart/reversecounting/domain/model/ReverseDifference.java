package com.smart.reversecounting.domain.model;

import java.math.BigInteger;

public record ReverseDifference(
        BigInteger number,
        BigInteger reversedNumber,
        BigInteger difference
) {
}

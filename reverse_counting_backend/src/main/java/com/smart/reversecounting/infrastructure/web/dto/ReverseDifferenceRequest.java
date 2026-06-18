package com.smart.reversecounting.infrastructure.web.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record ReverseDifferenceRequest(
        @NotBlank(message = "must not be blank")
        @Size(max = 1000, message = "must not exceed 1000 characters")
        String number
) {
}

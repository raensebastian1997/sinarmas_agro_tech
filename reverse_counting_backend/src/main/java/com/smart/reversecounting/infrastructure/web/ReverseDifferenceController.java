package com.smart.reversecounting.infrastructure.web;

import com.smart.reversecounting.application.dto.CalculateReverseDifferenceCommand;
import com.smart.reversecounting.application.port.in.CalculateReverseDifferenceUseCase;
import com.smart.reversecounting.infrastructure.web.dto.ReverseDifferenceRequest;
import com.smart.reversecounting.infrastructure.web.dto.ReverseDifferenceResponse;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/reverse-difference")
public class ReverseDifferenceController {

    private final CalculateReverseDifferenceUseCase useCase;

    public ReverseDifferenceController(CalculateReverseDifferenceUseCase useCase) {
        this.useCase = useCase;
    }

    @PostMapping
    public ResponseEntity<ReverseDifferenceResponse> calculate(@Valid @RequestBody ReverseDifferenceRequest request) {
        var command = new CalculateReverseDifferenceCommand(request.number());
        var result = useCase.calculate(command);

        return ResponseEntity.ok(ReverseDifferenceResponse.from(request.number(), result));
    }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/calculate_reverse_difference.dart';
import 'reverse_number_event.dart';
import 'reverse_number_state.dart';

class ReverseNumberBloc extends Bloc<ReverseNumberEvent, ReverseNumberState> {
  ReverseNumberBloc(this._calculateReverseDifference)
    : super(const ReverseNumberState()) {
    on<ReverseNumberInputChanged>(_onInputChanged);
    on<ReverseNumberSubmitted>(_onSubmitted);
  }

  final CalculateReverseDifference _calculateReverseDifference;

  void _onInputChanged(
    ReverseNumberInputChanged event,
    Emitter<ReverseNumberState> emit,
  ) {
    final digitsOnly = event.value.replaceAll(RegExp(r'[^0-9]'), '');

    emit(
      state.copyWith(
        input: digitsOnly,
        status: digitsOnly.isEmpty
            ? ReverseNumberStatus.initial
            : ReverseNumberStatus.editing,
        clearResult: true,
      ),
    );
  }

  void _onSubmitted(
    ReverseNumberSubmitted event,
    Emitter<ReverseNumberState> emit,
  ) {
    if (!state.canSubmit) {
      return;
    }

    emit(
      state.copyWith(
        status: ReverseNumberStatus.calculated,
        result: _calculateReverseDifference(state.input),
      ),
    );
  }
}

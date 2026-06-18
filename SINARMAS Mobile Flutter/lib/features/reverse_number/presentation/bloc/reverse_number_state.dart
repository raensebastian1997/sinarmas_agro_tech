import 'package:equatable/equatable.dart';

import '../../domain/entities/reverse_number_result.dart';

enum ReverseNumberStatus { initial, editing, calculated }

class ReverseNumberState extends Equatable {
  const ReverseNumberState({
    this.input = '',
    this.status = ReverseNumberStatus.initial,
    this.result,
  });

  final String input;
  final ReverseNumberStatus status;
  final ReverseNumberResult? result;

  bool get canSubmit => input.isNotEmpty;

  ReverseNumberState copyWith({
    String? input,
    ReverseNumberStatus? status,
    ReverseNumberResult? result,
    bool clearResult = false,
  }) {
    return ReverseNumberState(
      input: input ?? this.input,
      status: status ?? this.status,
      result: clearResult ? null : result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [input, status, result];
}

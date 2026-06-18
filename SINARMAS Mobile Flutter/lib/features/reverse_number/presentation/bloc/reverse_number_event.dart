import 'package:equatable/equatable.dart';

sealed class ReverseNumberEvent extends Equatable {
  const ReverseNumberEvent();

  @override
  List<Object?> get props => [];
}

final class ReverseNumberInputChanged extends ReverseNumberEvent {
  const ReverseNumberInputChanged(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

final class ReverseNumberSubmitted extends ReverseNumberEvent {
  const ReverseNumberSubmitted();
}

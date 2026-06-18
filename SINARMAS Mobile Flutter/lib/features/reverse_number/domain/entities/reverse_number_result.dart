import 'package:equatable/equatable.dart';

class ReverseNumberResult extends Equatable {
  const ReverseNumberResult({
    required this.original,
    required this.reversed,
    required this.difference,
  });

  final String original;
  final String reversed;
  final String difference;

  @override
  List<Object> get props => [original, reversed, difference];
}

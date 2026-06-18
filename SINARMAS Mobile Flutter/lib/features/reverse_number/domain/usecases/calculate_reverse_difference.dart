import '../entities/reverse_number_result.dart';

class CalculateReverseDifference {
  const CalculateReverseDifference();

  ReverseNumberResult call(String input) {
    final digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.isEmpty) {
      throw ArgumentError.value(input, 'input', 'Input must contain digits.');
    }

    final originalValue = BigInt.parse(digitsOnly);
    final normalizedOriginal = originalValue.toString();
    final reversedValue = BigInt.parse(
      normalizedOriginal.split('').reversed.join(),
    );
    final difference = (originalValue - reversedValue).abs();

    return ReverseNumberResult(
      original: normalizedOriginal,
      reversed: reversedValue.toString(),
      difference: difference.toString(),
    );
  }
}

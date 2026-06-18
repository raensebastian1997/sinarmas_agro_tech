import 'package:flutter_test/flutter_test.dart';
import 'package:sinarmas_reverse_app/features/reverse_number/domain/usecases/calculate_reverse_difference.dart';

void main() {
  const useCase = CalculateReverseDifference();

  test('calculates 21 reversed to 12 with difference 9', () {
    final result = useCase('21');

    expect(result.original, '21');
    expect(result.reversed, '12');
    expect(result.difference, '9');
  });

  test('calculates 30 reversed to 3 with difference 27', () {
    final result = useCase('30');

    expect(result.original, '30');
    expect(result.reversed, '3');
    expect(result.difference, '27');
  });

  test('sanitizes decimals and letters before calculating', () {
    final result = useCase('1.2,a');

    expect(result.original, '12');
    expect(result.reversed, '21');
    expect(result.difference, '9');
  });

  test('normalizes leading zeroes before reversing', () {
    final result = useCase('0030');

    expect(result.original, '30');
    expect(result.reversed, '3');
    expect(result.difference, '27');
  });
}

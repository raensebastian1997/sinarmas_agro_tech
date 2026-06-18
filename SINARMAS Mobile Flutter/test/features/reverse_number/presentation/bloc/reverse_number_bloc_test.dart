import 'package:flutter_test/flutter_test.dart';
import 'package:sinarmas_reverse_app/features/reverse_number/domain/usecases/calculate_reverse_difference.dart';
import 'package:sinarmas_reverse_app/features/reverse_number/presentation/bloc/reverse_number_bloc.dart';
import 'package:sinarmas_reverse_app/features/reverse_number/presentation/bloc/reverse_number_event.dart';
import 'package:sinarmas_reverse_app/features/reverse_number/presentation/bloc/reverse_number_state.dart';

void main() {
  late ReverseNumberBloc bloc;

  setUp(() {
    bloc = ReverseNumberBloc(const CalculateReverseDifference());
  });

  tearDown(() async {
    await bloc.close();
  });

  test('keeps only digits when input changes', () async {
    bloc.add(const ReverseNumberInputChanged('1.2,a'));

    await expectLater(
      bloc.stream,
      emits(
        isA<ReverseNumberState>()
            .having((state) => state.input, 'input', '12')
            .having(
              (state) => state.status,
              'status',
              ReverseNumberStatus.editing,
            )
            .having((state) => state.result, 'result', isNull),
      ),
    );
  });

  test('emits a calculated result when submitted', () async {
    bloc
      ..add(const ReverseNumberInputChanged('30'))
      ..add(const ReverseNumberSubmitted());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        isA<ReverseNumberState>().having((state) => state.input, 'input', '30'),
        isA<ReverseNumberState>()
            .having(
              (state) => state.status,
              'status',
              ReverseNumberStatus.calculated,
            )
            .having((state) => state.result?.reversed, 'reversed', '3')
            .having((state) => state.result?.difference, 'difference', '27'),
      ]),
    );
  });
}

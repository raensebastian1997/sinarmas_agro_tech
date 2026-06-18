import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../bloc/reverse_number_bloc.dart';
import '../bloc/reverse_number_event.dart';
import '../bloc/reverse_number_state.dart';

class NumberEntryPanel extends StatelessWidget {
  const NumberEntryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ReverseNumberBloc, ReverseNumberState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE1E9E4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppTheme.softGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.calculate_rounded,
                        color: AppTheme.brandGreen,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'Reverse Calculator',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                TextField(
                  key: const Key('reverseInput'),
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: textTheme.headlineMedium?.copyWith(
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Whole number',
                    hintText: '21',
                    prefixIcon: Icon(Icons.numbers_rounded),
                  ),
                  onChanged: (value) {
                    context.read<ReverseNumberBloc>().add(
                      ReverseNumberInputChanged(value),
                    );
                  },
                  onSubmitted: (_) {
                    context.read<ReverseNumberBloc>().add(
                      const ReverseNumberSubmitted(),
                    );
                  },
                ),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  key: const Key('submitButton'),
                  onPressed: state.canSubmit
                      ? () => context.read<ReverseNumberBloc>().add(
                          const ReverseNumberSubmitted(),
                        )
                      : null,
                  icon: const Icon(Icons.check_circle_rounded),
                  label: const Text('Calculate'),
                ),
                const SizedBox(height: 22),
                _FormulaPreview(state: state),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FormulaPreview extends StatelessWidget {
  const _FormulaPreview({required this.state});

  final ReverseNumberState state;

  @override
  Widget build(BuildContext context) {
    final result = state.result;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBF7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE1E9E4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.functions_rounded, color: AppTheme.brandRed),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              result == null
                  ? 'Number - Reverse = Difference'
                  : '${result.original} - ${result.reversed} = ${result.difference}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleMedium?.copyWith(
                color: AppTheme.ink,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

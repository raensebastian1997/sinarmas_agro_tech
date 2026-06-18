import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/usecases/calculate_reverse_difference.dart';
import '../bloc/reverse_number_bloc.dart';
import '../bloc/reverse_number_state.dart';
import '../widgets/brand_header.dart';
import '../widgets/number_entry_panel.dart';
import '../widgets/result_panel.dart';

class ReverseNumberPage extends StatelessWidget {
  const ReverseNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReverseNumberBloc(const CalculateReverseDifference()),
      child: const _ReverseNumberView(),
    );
  }
}

class _ReverseNumberView extends StatelessWidget {
  const _ReverseNumberView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.canvas, Color(0xFFF1F6EE), Color(0xFFFFFAEA)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned.fill(child: _BrandAccentBackground()),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 860;
                  final horizontalPadding = isWide ? 40.0 : 18.0;

                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 24,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const BrandHeader(),
                            const SizedBox(height: 24),
                            BlocBuilder<ReverseNumberBloc, ReverseNumberState>(
                              builder: (context, state) {
                                if (isWide) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: ResultPanel(state: state),
                                      ),
                                      const SizedBox(width: 24),
                                      const Expanded(
                                        flex: 5,
                                        child: NumberEntryPanel(),
                                      ),
                                    ],
                                  );
                                }

                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ResultPanel(state: state),
                                    const SizedBox(height: 18),
                                    const NumberEntryPanel(),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandAccentBackground extends StatelessWidget {
  const _BrandAccentBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _BrandAccentPainter());
  }
}

class _BrandAccentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final redPaint = Paint()..color = AppTheme.brandRed.withValues(alpha: 0.08);
    final greenPaint = Paint()
      ..color = AppTheme.brandGreen.withValues(alpha: 0.08);
    final amberPaint = Paint()
      ..color = AppTheme.brandAmber.withValues(alpha: 0.16);

    canvas
      ..drawPath(
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width * 0.14, 0)
          ..lineTo(0, size.height * 0.14)
          ..close(),
        greenPaint,
      )
      ..drawPath(
        Path()
          ..moveTo(size.width, 0)
          ..lineTo(size.width, size.height * 0.22)
          ..lineTo(size.width * 0.72, 0)
          ..close(),
        amberPaint,
      )
      ..drawPath(
        Path()
          ..moveTo(size.width, size.height)
          ..lineTo(size.width * 0.58, size.height)
          ..lineTo(size.width, size.height * 0.62)
          ..close(),
        redPaint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

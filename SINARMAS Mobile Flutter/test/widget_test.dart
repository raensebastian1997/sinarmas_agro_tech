import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sinarmas_reverse_app/main.dart';

void main() {
  testWidgets('shows reverse difference result after submit', (tester) async {
    await tester.pumpWidget(const ReverseNumberApp());

    await tester.enterText(find.byKey(const Key('reverseInput')), '21');
    await tester.pump();
    await tester.ensureVisible(find.byKey(const Key('submitButton')));
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pumpAndSettle();

    expect(find.text('Sinar Mas Agro Resources & Technology'), findsOneWidget);
    expect(find.byKey(const Key('differenceValue')), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('filters decimal separators from the input field', (
    tester,
  ) async {
    await tester.pumpWidget(const ReverseNumberApp());

    await tester.enterText(find.byKey(const Key('reverseInput')), '1.2,');
    await tester.pump();

    final editableText = tester.widget<EditableText>(find.byType(EditableText));
    expect(editableText.controller.text, '12');
  });
}

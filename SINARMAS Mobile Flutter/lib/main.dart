import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/reverse_number/presentation/pages/reverse_number_page.dart';

void main() {
  runApp(const ReverseNumberApp());
}

class ReverseNumberApp extends StatelessWidget {
  const ReverseNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinar Mas Reverse Difference',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const ReverseNumberPage(),
    );
  }
}

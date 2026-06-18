import 'package:flutter/material.dart';
import 'package:sinarmas_reverse_app/core/theme/app_theme.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE1E9E4)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 28,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/brand/smart-logo.png',
            height: 44,
            semanticLabel: 'Sinar Mas Agribusiness and Food',
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   'Reverse Difference',
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                //   style: textTheme.bodyMedium?.copyWith(
                //     color: AppTheme.brandGreen,
                //     fontWeight: FontWeight.w800,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

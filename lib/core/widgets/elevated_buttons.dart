import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

class ElevatedButtons extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const ElevatedButtons({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        // iconColor: WidgetStatePropertyAll(AppColors.secondary),
        foregroundColor: WidgetStatePropertyAll(AppColors.secondary),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),

        minimumSize: WidgetStatePropertyAll(Size(500, 50)),
      ),
      onPressed: onPressed,
      child: Text(label, style: AppFonts.button1),
    );
  }
}

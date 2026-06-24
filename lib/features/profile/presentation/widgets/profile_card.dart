import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

class ProfileStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;

  const ProfileStatCard({
    super.key,
    required this.title,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(
          0.12,
        ), // Dynamic background using theme primary
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: AppFonts.heading2.copyWith(color: AppColors.primary),
              ),
              if (icon != null) ...[
                const SizedBox(width: 4),
                Icon(icon, color: AppColors.primary, size: 22),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppFonts.button1.copyWith(color: AppColors.activeColor),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // Wrapping with Material fixes the canvas assertion error
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          // Ensures the click ripple effect matches the card shape
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.background, size: 22),
          ),
          title: Text(
            title,
            style: AppFonts.body2.copyWith(
              color: AppColors.activeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppColors.activeColor,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

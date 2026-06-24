import 'package:flutter/widgets.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

class JobCommisionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color themeColor;

  const JobCommisionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    this.themeColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(icon, color: themeColor, size: 25),
              ),

              Text(title, style: AppFonts.text2),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: AppFonts.text2),
          const SizedBox(height: 4),
          Text(subtitle, style: AppFonts.text2),
        ],
      ),
    );
  }
}

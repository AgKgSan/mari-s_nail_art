import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';

class NotiCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String timeAgo;
  final bool isCancelled;
  final String? imageUrl;

  const NotiCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.timeAgo,
    this.isCancelled = false,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isCancelled ? AppColors.activeColor : AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: isCancelled ? AppColors.redColor : AppColors.background,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isCancelled
                              ? AppColors.redColor
                              : AppColors.activeColor,
                        ),
                      ),
                    ),

                    // Optional green unread dot indicator
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: isCancelled
                        ? AppColors.redColor
                        : const Color(0xFF334155),
                  ),
                ),

                // Embedded Image Section if provided
                if (imageUrl != null) ...[
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrl!,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 160,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 12),
                Text(
                  timeAgo,
                  style: const TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

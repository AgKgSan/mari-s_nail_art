import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

class HeaderView extends StatelessWidget {
  final TextStyle style1;
  final TextStyle style2;
  final Color bgcolor;
  final ImageProvider profile;
  final String nameAndGreeting;
  final String nameAndPhone;
  const HeaderView({
    super.key,
    required this.style1,
    required this.style2,
    required this.bgcolor,
    required this.profile,
    required this.nameAndGreeting,
    required this.nameAndPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: bgcolor,
      //   borderRadius: BorderRadius.circular(24),
      //   boxShadow: const [BoxShadow(blurRadius: 10, offset: Offset(0, 4))],
      // ),
      // decoration: BoxDecoration(
      //   color: AppColors.background,
      //   boxShadow: [
      //     BoxShadow(
      //       offset: Offset(-5, -5),
      //       color: AppColors.shadow,
      //       blurRadius: 15,
      //     ),
      //   ],
      // ),
      height: 100,
      color: bgcolor,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: profile),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameAndGreeting,
                style: style1.copyWith(color: AppColors.primary),
              ),
              Text(
                nameAndPhone,
                style: style2.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String labelText;
  final IconData icon;
  final VoidCallback onTap;
  const CustomFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        SizedBox(height: 20),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: label,
            prefixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.primary),
            ),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}

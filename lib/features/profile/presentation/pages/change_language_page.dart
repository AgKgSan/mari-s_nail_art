import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/features/profile/presentation/widgets/language_card.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,

        title: const Text(
          'Change Language',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          children: [
            LanguageCard(
              title: 'English',
              isSelected: _selectedLanguage == 'en',
              onTap: () => setState(() => _selectedLanguage = 'en'),
            ),
            const SizedBox(height: 16),
            LanguageCard(
              title: 'Myanmar',
              isSelected: _selectedLanguage == 'my',
              onTap: () => setState(() => _selectedLanguage = 'my'),
            ),
          ],
        ),
      ),
    );
  }
}

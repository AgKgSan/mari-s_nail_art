import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';

class PrivacyAndSecurity extends StatelessWidget {
  const PrivacyAndSecurity({super.key});
  static const String termsText = '''
Your privacy and security are important to us. We are committed to protecting your personal information and ensuring a safe experience while using our application.
Information We Collect
We may collect information such as your name, email address, phone number, and other account details necessary to provide our services.

How We Use Your Information

Your information is used to:
. Provide and improve our services.
. Verify your identity and secure your account.
. Send important updates and notifications.
. Respond to customer support requests.
Data Protection
We implement appropriate security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction.

Account Security
To help keep your account secure:
Use a strong password.
Keep your login credentials confidential.
Update your information regularly.
Report any suspicious activity immediately.

Third-Party Services
We may use trusted third-party services to support our application. These providers are required to protect your information and use it only for authorized purposes.
Your Rights
You may review, update, or request the deletion of your personal information in accordance with applicable laws and regulations.

Policy Updates
We may update our Privacy & Security practices from time to time. Any changes will be reflected within the application.

Contact Us
If you have any questions regarding privacy or security, please contact our support team.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy and Security')),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: SelectableText(
            termsText,
            style: TextStyle(
              fontSize: 15.0,
              color: AppColors.secondary,
              height: 1.5, // Line height for better readability
            ),
          ),
        ),
      ),
    );
  }
}

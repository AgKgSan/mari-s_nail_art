import 'package:flutter/material.dart';

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({super.key});
  static const String termsText = '''
Last Updated: June 2026

Welcome to our application. By accessing or using this app, you agree to comply with and be bound by the following Terms and Conditions.

1. Acceptance of Terms
By creating an account or using our services, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.

2. User Account
You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.

3. Acceptable Use
Users must not:
• Use the app for unlawful purposes.
• Attempt to gain unauthorized access to the system.
• Upload or share harmful, misleading, or inappropriate content.
• Disrupt the operation of the application.

4. User Information
You agree to provide accurate and up-to-date information when creating or updating your account.

5. Intellectual Property
All content, trademarks, logos, and materials within the application are owned by the company and may not be copied or distributed without permission.

6. Service Availability
We strive to keep our services available at all times but do not guarantee uninterrupted access. Services may be modified, suspended, or discontinued without prior notice.

7. Limitation of Liability
We are not responsible for any direct, indirect, incidental, or consequential damages resulting from the use of this application.

8. Termination
We reserve the right to suspend or terminate accounts that violate these Terms and Conditions.

9. Changes to Terms
We may update these Terms and Conditions from time to time. Continued use of the app after changes are posted constitutes acceptance of the revised terms.

10. Contact Us
If you have any questions regarding these Terms and Conditions, please contact our support team.

By using this application, you agree to these Terms and Conditions.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms and Conditions')),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: SelectableText(
            termsText,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black87,
              height: 1.5, // Line height for better readability
            ),
          ),
        ),
      ),
    );
  }
}

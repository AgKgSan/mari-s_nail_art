import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/pinput_field.dart';
import 'package:mari_nail_art/features/auth/presentation/provider/auth_provider.dart';
import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  void _verifyOtpCode() async {
    final otp = pinController.text.trim();
    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the OTP code")),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.verifyOtp(otp: otp);

    if (mounted) {
      if (success) {
        // Navigate forward passing down values via map or extra parameters depending on GoRouter setup
        context.push(
          AppRouter.createnewpasswrod,
          extra: {'email': widget.email, 'otp': otp},
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              authProvider.errorMessage ?? "Invalid OTP verification code",
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Check your inbox", style: AppFonts.body2),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password Recovery", style: AppFonts.text2),
            const SizedBox(height: 15),
            SizedBox(
              width: 300,
              child: Text(
                "We have sent a code to ${widget.email}. Please enter it below to reset your password.",
              ),
            ),
            const SizedBox(height: 15),
            PinputField(pinController: pinController),
            const SizedBox(height: 15),
            authProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButtons(label: "Submit", onPressed: _verifyOtpCode),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text("Don’t receive the otp code?"),
                const SizedBox(width: 15),
                GestureDetector(
                  // onPressed: authProvider.isLoading
                  //     ? null
                  //     : () => authProvider.forgotPassword(email: widget.email),
                  child: Text("Resend", style: AppFonts.loginText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

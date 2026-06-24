import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/my_text_field.dart';
import 'package:mari_nail_art/features/auth/presentation/provider/auth_provider.dart';
import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController forgotController = TextEditingController();

  @override
  void dispose() {
    forgotController.dispose();
    super.dispose();
  }

  void _submitEmail() async {
    final email = forgotController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your email layout")),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.forgotPassword(email: email);

    if (mounted) {
      if (success) {
        context.push(AppRouter.otp, extra: email);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? "An error occurred"),
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
        title: Text("Forgot Password", style: AppFonts.body2),
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
            const SizedBox(
              width: 300,
              child: Text(
                "Enter your Email or Mobile Number to reset your password.",
              ),
            ),
            const SizedBox(height: 15),
            MyTextField(
              controller: forgotController,
              hintText: "Enter your email or Mobile Number",
              obscureText: false,
            ),
            const SizedBox(height: 15),
            authProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButtons(label: "Submit", onPressed: _submitEmail),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text("Remember Your Password?"),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => context.go(AppRouter.login),
                  child: Text("Login", style: AppFonts.loginText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

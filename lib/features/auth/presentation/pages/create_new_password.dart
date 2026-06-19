import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/my_text_field.dart';
import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Password", style: AppFonts.body2),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 300,
              child: Text("Please Create a new password for your account."),
            ),

            const SizedBox(height: 15),

            MyTextField(
              controller: passwordController,
              hintText: "Enter New Password",
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword ? PhosphorIcons.eyeSlash : PhosphorIcons.eye,
                ),
              ),
            ),

            const SizedBox(height: 20),

            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm New Password",
              obscureText: _obscureConfirmPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                icon: Icon(
                  _obscureConfirmPassword
                      ? PhosphorIcons.eyeSlash
                      : PhosphorIcons.eye,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButtons(
              label: "Submit",
              onPressed: () {
                context.push(AppRouter.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}

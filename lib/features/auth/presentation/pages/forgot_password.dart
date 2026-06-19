import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/my_text_field.dart';
import 'package:mari_nail_art/routes/app_routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController forgotController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password", style: AppFonts.body2),
        leading: IconButton(
          onPressed: () => context.pop(),

          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password Recovery", style: AppFonts.text2),
            SizedBox(height: 15),
            SizedBox(
              width: 300,
              child: Text(
                "Enter your Email or Mobile Number to reset your password.",
              ),
            ),
            SizedBox(height: 15),
            MyTextField(
              controller: forgotController,
              hintText: "Enter your email or Mobile Number",
              obscureText: false,
            ),
            SizedBox(height: 15),
            ElevatedButtons(
              label: "Submit",
              onPressed: () {
                context.push(AppRouter.otp);
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text("Remember Your Password?"),
                SizedBox(width: 15),
                Text("Login", style: AppFonts.loginText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

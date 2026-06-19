import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/pinput_field.dart';
import 'package:mari_nail_art/routes/app_routes.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check your inbox", style: AppFonts.body2),
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
                "We will sent a code to 09250607080. Please enter it Below to reset your password. ",
              ),
            ),
            SizedBox(height: 15),
            PinputField(),
            // MyTextField(
            //   controller: forgotController,
            //   hintText: "Enter your email or Mobile Number",
            //   obscureText: false,
            // ),
            SizedBox(height: 15),
            ElevatedButtons(
              label: "Submit",
              onPressed: () {
                context.push(AppRouter.createnewpasswrod);
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text("Don’t receive the otp code?"),
                SizedBox(width: 15),
                Text("Resend", style: AppFonts.loginText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

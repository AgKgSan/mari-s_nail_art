import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/my_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pwController = TextEditingController();
    final TextEditingController newPwcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Current Password"),
            const SizedBox(height: 8),
            MyTextField(
              controller: pwController,
              hintText: "Enter Your Current Password",
              obscureText: true,
            ),
            const SizedBox(height: 8),
            Text("New Password"),
            const SizedBox(height: 8),
            MyTextField(
              controller: newPwcontroller,
              hintText: "Enter Your New Password",
              obscureText: true,
            ),
            const SizedBox(height: 8),
            ElevatedButtons(label: 'Confirm', onPressed: () {}),
            TextButton(onPressed: () {}, child: Text("Forgot Password?")),
          ],
        ),
      ),
    );
  }
}

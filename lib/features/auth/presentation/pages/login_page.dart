import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/my_text_field.dart';
import 'package:mari_nail_art/features/auth/presentation/provider/auth_provider.dart';
import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();

    final successLogin = await authProvider.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (mounted) {
      if (successLogin) {
        final model = authProvider.loginModel;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Success")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Auth Failed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Mari's", style: AppFonts.shopNamelogin),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 80),
                  Text(
                    "Nail Salon",
                    style: AppFonts.heading2Reg.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/Img 1.png", height: 250),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email Or Mobile Number", style: AppFonts.body2),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: emailController,
                    hintText: "Enter Your Email Or Mobile Number",
                    obscureText: false,
                  ),
                  const SizedBox(height: 16),
                  Text("Password", style: AppFonts.body2),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Enter Your Password",
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  authProvider.isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ElevatedButtons(label: "Login", onPressed: login),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.push(AppRouter.forgot);
                      },
                      child: Text("Forgot Password?", style: AppFonts.text2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

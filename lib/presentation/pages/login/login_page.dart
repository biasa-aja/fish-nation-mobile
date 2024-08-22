import 'package:example_fish_fortune/config/routes/route_path.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/presentation/widgets/google_button.dart';
import 'package:example_fish_fortune/presentation/widgets/custom_appbar.dart';
import 'package:example_fish_fortune/presentation/widgets/custom_text_form_field.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("WELCOME BACK").heading4().blackColor(),
                    const SizedBox(height: 8),
                    const Text("Log in to continue your fishing adventure.")
                        .gs14m()
                        .greyColor(),
                    const SizedBox(height: 24),
                    GoogleButton(onTap: _onLoginWithGoogle),
                    const SizedBox(height: 24),
                    _buildOr(),
                    const SizedBox(height: 24),
                    _buildForm(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: MainButton(
                onTap: _onLogin,
                textButton: "DIVE IN",
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Don't have an account? ",
                ).gs14m().greyColor(),
                GestureDetector(
                  onTap: () => _onGotoRegister(),
                  child: Container(
                    color: Colors.transparent,
                    height: 30,
                    width: 66,
                    child: Center(
                      child: const Text(
                        "Sign up",
                      ).gs14m().blackColor(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }

  Widget _buildOr() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xffDDDDDD),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Text("or").gs14m().greyColor(),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xffDDDDDD),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        CustomTextFormField(
          labelText: "EMAIL",
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "PASSWORD",
          controller: passwordController,
          isPassword: true,
          obscureText: true,
        ),
      ],
    );
  }

  void _onLoginWithGoogle() {}

  void _onLogin() {
    context.go(RoutePath.home);
  }

  void _onGotoRegister() {
    context.push(RoutePath.register);
  }
}

import 'package:example_fish_fortune/config/routes/route_path.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/core/utils/message.dart';
import 'package:example_fish_fortune/core/utils/modal.dart';
import 'package:example_fish_fortune/data/data_sources/remote/auth_api.dart';
import 'package:example_fish_fortune/presentation/widgets/metamask_button.dart';
import 'package:example_fish_fortune/presentation/widgets/custom_appbar.dart';
import 'package:example_fish_fortune/presentation/widgets/custom_text_form_field.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final keyLoader = GlobalKey<State>();
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final addressController = TextEditingController();

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
                    const Text("JOIN THE ULTIMATE FISHING ADVENTURE!")
                        .heading4()
                        .blackColor(),
                    const SizedBox(height: 8),
                    const Text(
                            "Create your account and start reeling in rare catches.")
                        .gs14m()
                        .greyColor(),
                    const SizedBox(height: 24),
                    MetamaskButton(onTap: _onLoginWithMetamask),
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
                onTap: _onRegister,
                textButton: "START FISHING",
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Already have an account? ",
                ).gs14m().greyColor(),
                GestureDetector(
                  onTap: () => _onGotoLogin(),
                  child: Container(
                    color: Colors.transparent,
                    height: 30,
                    width: 66,
                    child: Center(
                      child: const Text(
                        "Sign in",
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            labelText: "USERNAME",
            controller: usernameController,
          ),
          const SizedBox(height: 16),
          // CustomTextFormField(
          //   labelText: "EMAIL",
          //   controller: emailController,
          //   keyboardType: TextInputType.emailAddress,
          // ),
          // const SizedBox(height: 16),
          CustomTextFormField(
            labelText: "ADDRESS",
            controller: addressController,
            isPassword: true,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  void _onLoginWithMetamask() {}

  void _onRegister() async {
    if (!(formKey.currentState?.validate() ?? true)) return;

    Modal.showLoadingDialog(context, keyLoader);

    final response = await AuthApi().login(
      username: usernameController.text,
      address: addressController.text,
    );

    Navigator.of(keyLoader.currentContext!, rootNavigator: true).pop();

    if (response) {
      context.go(RoutePath.home);
    }

    ///
    else {
      Modal.showSnackBar(
        context,
        text: ErrorMessage.default0,
        snackbarType: SnackbarType.danger,
      );
    }
  }

  void _onGotoLogin() {
    context.push(RoutePath.login);
  }
}

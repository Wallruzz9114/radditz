import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/constants/constants.dart';
import 'package:radditz/src/modules/auth/providers/providers.dart';
import 'package:radditz/src/modules/auth/screens/screens.dart';
import 'package:radditz/src/modules/auth/widgets/widgets.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  static MaterialPageRoute<RegisterScreen> route() =>
      MaterialPageRoute<RegisterScreen>(
        builder: (BuildContext context) => const RegisterScreen(),
      );

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final AppBar appBar = UIConstants.appBar();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void register() {
    ref.read(authControllerProvider.notifier).register(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Scaffold build(BuildContext context) {
    final bool isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appBar,
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      AuthTextField(
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 25),
                      AuthTextField(
                        controller: passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.topRight,
                        child: CustomButton(onTap: register, label: 'Register'),
                      ),
                      const SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an accout?',
                          style: const TextStyle(fontSize: 16),
                          children: <InlineSpan>[
                            TextSpan(
                              text: ' Log in',
                              style: const TextStyle(
                                color: PalleteConstants.blueColor,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context, LoginScreen.route());
                                },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

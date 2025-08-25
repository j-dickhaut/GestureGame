import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      color: AppColor.primaryAccentTwo,
      child: Column(
        children: [
          StyledHeading('sign in or create an account'),
          TextField(
            controller: emailController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'e-mail',
              icon: Icon(Icons.email),
            ),
            cursorOpacityAnimates: false,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'password',
              icon: Icon(Icons.password),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(onPressed: () {}, child: StyledText('Sign in')),
              FilledButton(onPressed: () {}, child: StyledText('Register')),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ssp_extreme/screens/options/widgets/login_or_register.dart';
import 'package:ssp_extreme/services/auth.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle("Options")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  debugPrint('error Signing in');
                } else {
                  debugPrint('User signed in');
                  debugPrint(result.uid);
                }
              },
              child: StyledTitle('Sign in Anonymous'),
            ),
          ),
          LoginRegister(),
        ],
      ),
    );
  }
}

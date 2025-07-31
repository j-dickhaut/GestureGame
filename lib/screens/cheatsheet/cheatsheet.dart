import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';

class CheatsheetScreen extends StatelessWidget {
  const CheatsheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle('Cheatsheet')),
      body: Center(child: Image.asset('assets/img/cheatsheet.png')),
    );
  }
}

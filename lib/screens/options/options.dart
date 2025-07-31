import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle("Options")),
      body: const Text('No options yet'),
    );
  }
}

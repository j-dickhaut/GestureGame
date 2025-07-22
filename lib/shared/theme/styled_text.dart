import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Body Text
class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.metamorphous(textStyle: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}
//Widget Heading Text
class StyledHeading extends StatelessWidget {

  const StyledHeading (this.text, {this.alpha = 255, super.key});

  final int alpha;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(),
      style: GoogleFonts.metamorphous(textStyle: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}

//Widget Title Text
class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.metamorphous(textStyle: Theme.of(context).textTheme.titleMedium,),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class Score extends StatelessWidget {
  //simple Scoreboard, that displays the score for one Player
  // input: required score and optinal Playername

  final int score;

  const Score({required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.primaryAccentTwo,
        border: Border.all(color: AppColor.textColor, width: 1.6),
      ),
      child: StyledScoreboard('$score'),
    );
  }
}

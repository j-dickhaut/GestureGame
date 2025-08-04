import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class CheatsheetScreen extends StatefulWidget {
  const CheatsheetScreen({super.key});

  @override
  State<CheatsheetScreen> createState() => _CheatsheetScreenState();
}

class _CheatsheetScreenState extends State<CheatsheetScreen> {
  //fields
  double angle = pi / 2; //rotaion for circular Slider
  int index = 0;
  final double height = 350;

  void rotation(DragUpdateDetails position) {
    //calculating the angle of the slider using the fingercoordinates and
    //compareing them to the middle of the widget, 16 is half padding + margin
    double dy = position.localPosition.dy - (height / 2 + 16);
    double dx = position.localPosition.dx - (height / 2 + 16);

    if (dx > 0) {
      setState(() {
        //arctan sets the angle, when x is poitive
        angle = atan(dy / dx);
      });
    } else {
      //prevents a behavior, when x gets negative the function resets. to
      //fix this by adding pi (180°) to the outcome.
      setState(() {
        angle = atan(dy / dx) + pi;
      });
    }
  }

  void lockIn() {
    //after selection ended:
    // converts the given slider angle to the matching index of the global gesture
    // list and returns a on the index picture matching centered slider.
    angle = (angle - pi / 2) / (2 * pi / 15);

    setState(() {
      index = angle.round();
      angle = index * (2 * pi / 15) + (pi / 2);
    });
    if (index < 0) {
      //converts a negative index into a positve
      index += 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle('Gamerules')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onPanUpdate: (details) {
                rotation(details);
              },
              onPanEnd: (details) {
                lockIn();
              },
              child: Container(
                //Container for circular Slider
                color: AppColor.primaryAccentTwo,
                margin: const EdgeInsetsGeometry.all(14),
                padding: const EdgeInsetsGeometry.all(14),
                child: Stack(
                  children: [
                    SizedBox(
                      //the Slider
                      height: height,
                      child: Transform.rotate(
                        angle: angle,
                        child: Image.asset('assets/img/gestures_circle.png'),
                      ),
                    ),

                    Container(
                      //Picutre with options to choose from
                      height: height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/img/gestures_with_names.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

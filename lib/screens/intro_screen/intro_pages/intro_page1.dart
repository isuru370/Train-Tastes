import 'package:flutter/material.dart';
import 'package:train_tastes/components/same_widget/view_contend_widget.dart';

class IntroPageView1 extends StatelessWidget {
  const IntroPageView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 60),
      child: const PageViewContendWidget(
          contendTitle: "Train Breakfast Bliss",
          descriptionText:
              "Don't skip the most important meal of the day! Grab a wholesome breakfast from our train tastes and make your commute more satisfying. Whether you crave sweet or savory, we've got tasty options to suit every palate."),
    );
  }
}

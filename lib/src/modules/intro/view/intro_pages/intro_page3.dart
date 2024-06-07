import 'package:flutter/material.dart';

import '../../component/view_contend_widget.dart';

class IntroPageView3 extends StatelessWidget {
  const IntroPageView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 60),
      child: const PageViewContendWidget(
          contendTitle: "Pic your breakfast !",
          descriptionText:
              "So with this you can get the food and drink you need for breakfast at the next stop. Try it yourself. You will definitely like this!"),
    );
  }
}

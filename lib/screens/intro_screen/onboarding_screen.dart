import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:train_tastes/components/same_widget/background_widget.dart';
import 'package:train_tastes/components/same_widget/button.widget/save_btn_widget.dart';
import 'package:train_tastes/utils/colors_util.dart';

import '../../components/auth_screen_widget/logo_widget.dart';
import '../../utils/images_utils.dart';
import 'intro_pages/intro_page1.dart';
import 'intro_pages/intro_page2.dart';
import 'intro_pages/intro_page3.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    PageController _controller = PageController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LogoWidget(logoImageUrl: ImagesUtil.logoDark),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Image.asset(ImagesUtil.introPageImage1),
                  )
                ]),
          ),
          Expanded(
            flex: 1,
            child: BackgroundWidget(
              backgroundImageUrl: ImagesUtil.rotateBackgroundImage,
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    children: const [
                      IntroPageView1(),
                      IntroPageView2(),
                      IntroPageView3(),
                    ],
                  ),
                  Container(
                      alignment: const Alignment(0, 0.85),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SmoothPageIndicator(
                            controller: _controller,
                            count: 3,
                            effect: WormEffect(
                                dotColor: ColorUtil.whiteColor[10]!,
                                activeDotColor: ColorUtil.blackColor[10]!,
                                dotHeight: 12,
                                dotWidth: 12,
                                paintStyle: PaintingStyle.stroke),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SaveButtonWidget(
                              width: MediaQuery.of(context).size.width / 1.1,
                              btnBackgroundColor: ColorUtil.whiteColor[10],
                              buttonText: "Continue",
                              onTap: () {})
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

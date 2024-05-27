import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:train_tastes/components/auth_screen_widget/logo_widget.dart';
import 'package:train_tastes/components/auth_screen_widget/or_widget.dart';
import 'package:train_tastes/components/auth_screen_widget/social_media_auth.dart';
import 'package:train_tastes/components/privacy_policy_widget.dart';
import 'package:train_tastes/components/same_widget/button.widget/save_btn_widget.dart';
import 'package:train_tastes/components/same_widget/input_widget.dart';
import 'package:train_tastes/utils/theme_text.dart';

import '../../components/same_widget/background_widget.dart';
import '../../utils/app_text_util.dart';
import '../../utils/colors_util.dart';
import '../../utils/images_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            BackgroundWidget(
              backgroundImageUrl: ImagesUtil.backgroundImage,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LogoWidget(logoImageUrl: ImagesUtil.logoLight),
                  Column(
                    children: [
                      Text(AppTextUtil.loginRegisterName,
                          style: ThemeTextUtil.headerTextNormalWhite)
                    ],
                  ),
                  InputFelidWidget(
                    controller: _email,
                    hintText: AppTextUtil.emailInputHintText,
                    keyboardType: TextInputType.emailAddress,
                    enabledBorderColor: ColorUtil.whiteColor[16]!,
                    activeBorderColors: ColorUtil.whiteColor[10]!,
                    obscureText: false,
                  ),
                  SaveButtonWidget(
                      onTap: () {
                        Navigator.pushNamed(context, '/landingScreen');
                        // Navigator.pushNamed(context, '/passwordScreen',
                        //     arguments: {
                        //       'email': _email.text.trim().toString(),
                        //     });
                      },
                      width: MediaQuery.of(context).size.width / 1.1,
                      btnBackgroundColor: ColorUtil.whiteColor[10],
                      buttonText: "Continue"),
                  const OrWidget(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaAuthWidget(socialImageUrl: ImagesUtil.googleIcon),
                  SocialMediaAuthWidget(
                      socialImageUrl: ImagesUtil.facebookIcon),
                ],
              ),
            ),
            PrivacyPolicyWidget(onTap: () {})
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:train_tastes/components/auth_screen_widget/forgot_widget.dart';
import 'package:train_tastes/components/auth_screen_widget/logo_widget.dart';
import 'package:train_tastes/components/privacy_policy_widget.dart';
import 'package:train_tastes/components/same_widget/button.widget/save_btn_widget.dart';
import 'package:train_tastes/components/same_widget/input_widget.dart';
import 'package:train_tastes/utils/theme_text.dart';

import '../../components/same_widget/background_widget.dart';
import '../../utils/app_text_util.dart';
import '../../utils/colors_util.dart';
import '../../utils/images_utils.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
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
                      Text(AppTextUtil.passwordScreenText,
                          style: ThemeTextUtil.headerTextNormalWhite)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTextUtil.bodyText1, //email name
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: ColorUtil.whiteColor[12]),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${routeArg['email']}",
                                style: TextStyle(
                                    fontSize: 15.5,
                                    letterSpacing: 1.5,
                                    color: ColorUtil.whiteColor[16]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Iconsax.edit_2,
                                size: 24,
                                color: ColorUtil.whiteColor[12],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      InputFelidWidget(
                        controller: _password,
                        hintText: AppTextUtil.passwordInputHintText,
                        keyboardType: TextInputType.text,
                        enabledBorderColor: ColorUtil.whiteColor[16]!,
                        activeBorderColors: ColorUtil.whiteColor[10]!,
                        obscureText: true,
                      ),
                      ForgotPasswordWidget(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/forgotPasswordScreen',
                                arguments: {
                                  'email': routeArg['email'],
                                });
                          },
                          textName: AppTextUtil.forgotPassword),
                    ],
                  ),
                  SaveButtonWidget(
                      onTap: () {
                        Navigator.pushNamed(context, '/introPage');
                      },
                      width: MediaQuery.of(context).size.width / 1.1,
                      btnBackgroundColor: ColorUtil.whiteColor[10],
                      buttonText: "Sign In"),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrivacyPolicyWidget(onTap: () {})
          ],
        ),
      ),
    );
  }
}

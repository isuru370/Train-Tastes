import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:train_tastes/components/auth_screen_widget/verify_code_widget.dart';

import '../../components/privacy_policy_widget.dart';
import '../../components/same_widget/background_widget.dart';
import '../../components/same_widget/button.widget/save_btn_widget.dart';
import '../../components/same_widget/input_widget.dart';
import '../../utils/app_text_util.dart';
import '../../utils/colors_util.dart';
import '../../utils/images_utils.dart';
import '../../utils/theme_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _verifyCode = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _conformPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(
                        color: ColorUtil.whiteColor[10],
                      ),
                      Text(AppTextUtil.forgotPasswordHederText,
                          style: ThemeTextUtil.headerTextNormalWhite),
                      const SizedBox(),
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
                                routeArg['email']!,
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
                      VerifyCodeWidget(
                        controller: _verifyCode,
                        onChanged: (p0) {},
                        onTap: () {},
                        hintText: AppTextUtil.verificationCodeHintText,
                        keyboardType: TextInputType.number,
                        enabledBorderColor: ColorUtil.whiteColor[16]!,
                        activeBorderColors: ColorUtil.whiteColor[10]!,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InputFelidWidget(
                        controller: _password,
                        hintText: AppTextUtil.newPasswordHintText,
                        keyboardType: TextInputType.text,
                        enabledBorderColor: ColorUtil.whiteColor[16]!,
                        activeBorderColors: ColorUtil.whiteColor[10]!,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InputFelidWidget(
                        controller: _conformPassword,
                        hintText: AppTextUtil.conformPasswordHintText,
                        keyboardType: TextInputType.text,
                        enabledBorderColor: ColorUtil.whiteColor[16]!,
                        activeBorderColors: ColorUtil.whiteColor[10]!,
                        obscureText: true,
                      ),
                    ],
                  ),
                  SaveButtonWidget(
                      onTap: () {},
                      width: MediaQuery.of(context).size.width / 1.1,
                      btnBackgroundColor: ColorUtil.whiteColor[10],
                      buttonText: "Reset password"),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:train_tastes/src/modules/auth/bloc/email_sign/email_sign_bloc.dart';

import '../../../components/background_widget.dart';
import '../../../components/button.widget/save_btn_widget.dart';
import '../../../components/input_widget.dart';
import '../../../components/privacy_policy_widget.dart';
import '../../../res/app_text.dart/app_text_util.dart';
import '../../../res/app_theme/colors_util.dart';
import '../../../res/app_theme/theme_text.dart';
import '../../../res/image_path/images_utils.dart';
import '../components/forgot_widget.dart';
import '../components/logo_widget.dart';

class PasswordScreen extends StatefulWidget {
  final String email;
  const PasswordScreen({super.key, required this.email});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailSignBloc = BlocProvider.of<EmailSignBloc>(context);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: BlocListener<EmailSignBloc, EmailSignState>(
        listener: (context, state) {
          if (state is EmailSignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.massage!,
                ),
              ),
            );
          }
          if (state is EmailSignInSuccess) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: BlocBuilder<EmailSignBloc, EmailSignState>(
            builder: (context, state) {
          if (state is EmailSignInProcess) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
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
                                    widget.email,
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
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
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
                                  context,
                                  '/forgotPasswordScreen',
                                );
                              },
                              textName: AppTextUtil.forgotPassword),
                        ],
                      ),
                      SaveButtonWidget(
                          onTap: () async {
                            emailSignBloc.add(EmailSignInEvent(
                              email: widget.email,
                              password: _password.text.toString(),
                            ));
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
          );
        }),
      ),
    );
  }
}

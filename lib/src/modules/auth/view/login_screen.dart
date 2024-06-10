import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_tastes/src/modules/auth/arguments/form_data.dart';
import 'package:train_tastes/src/modules/auth/bloc/social_media_sign/social_sign_bloc.dart';

import '../../../components/background_widget.dart';
import '../../../components/button.widget/save_btn_widget.dart';
import '../../../components/input_widget.dart';
import '../../../components/privacy_policy_widget.dart';
import '../../../res/app_text.dart/app_text_util.dart';
import '../../../res/app_theme/colors_util.dart';
import '../../../res/app_theme/theme_text.dart';
import '../../../res/image_path/images_utils.dart';
import '../components/logo_widget.dart';
import '../components/or_widget.dart';
import '../components/social_media_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<SocialSignBloc>(context);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: BlocListener<SocialSignBloc, SocialSignState>(
        listener: (context, state) {
          if (state is AuthSignFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failureMassage!,
                ),
              ),
            );
          }
          if (state is AuthSignSuccess) {
            if (state.firstLoginUser!) {
              Navigator.pushNamed(context, '/introScreen');
            } else {
              Navigator.pushNamed(context, '/landingScreen');
            }
          }
        },
        child: BlocBuilder<SocialSignBloc, SocialSignState>(
            builder: (context, state) {
          if (state is AuthSignProcess) {
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
                            Navigator.of(context).pushNamed(
                              '/passwordScreen',
                              arguments: FromData(
                                  email: _email.text.trim().toString()),
                            );
                          },
                          width: MediaQuery.of(context).size.width / 1.1,
                          btnBackgroundColor: ColorUtil.whiteColor[10],
                          buttonText: "Continue"),
                      const OrWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialMediaAuthWidget(
                          onTap: () {
                            authBloc.add(const GoogleSignRequest());
                          },
                          socialImageUrl: ImagesUtil.googleIcon),
                      SocialMediaAuthWidget(
                          onTap: () {
                            authBloc.add(FacebookSignRequest());
                          },
                          socialImageUrl: ImagesUtil.facebookIcon),
                    ],
                  ),
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

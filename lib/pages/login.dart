import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_page_ui/controllers/home_controller.dart';
import 'package:single_page_ui/forms/login_form.dart';
import 'package:single_page_ui/config/constants.dart' as k;
import 'package:single_page_ui/config/styles.dart';

class Login extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: AutoSizeText(
            k.Strings.kAuthTitle,
            style: kAuthTitleStyle,
            maxLines: 1,
          ),
        ),
        Expanded(
          flex: 4,
          child: LoginForm(),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 1,
          child: TextButton(
            child: AutoSizeText(
              k.Strings.kForgotPassword,
              style: kForgotPasswordStyle,
              maxLines: 1,
            ),
            onPressed: () {
              homeController.goToPage(2);
            },
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: AutoSizeText(
              '-OR-',
              style: kSeparatorStyle,
              maxLines: 1,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.maxFinite,
            child: RaisedButton(
              padding: k.Paddings.kRegisterButtonPadding,
              highlightColor: k.KColors.kRegisterHighlightColor,
              child: AutoSizeText(
                k.Strings.kRegisterButtonText,
                style: kRegisterButtonStyle,
                maxLines: 1,
              ),
              color: k.KColors.kRegisterButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width / 2),
              ),
              onPressed: () {
                homeController.goToPage(1);
              },
            ),
          ),
        )
      ],
    );
  }
}

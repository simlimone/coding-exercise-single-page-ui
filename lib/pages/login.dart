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
          child: Text(
            k.Strings.kAuthTitle,
            style: kAuthTitleStyle,
          ),
        ),
        Expanded(
          flex: 3,
          child: LoginForm(),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            child: Text(
              k.Strings.kForgotPassword,
              style: kForgotPasswordStyle,
            ),
            onPressed: () {
              homeController.goToPage(2);
            },
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              '-OR-',
              style: kSeparatorStyle,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.maxFinite,
            child: RaisedButton(
              padding: EdgeInsets.all(15),
              highlightColor: k.KColors.kRegisterHighlightColor,
              child: Text(
                k.Strings.kRegisterButtonText,
                style: kRegisterButtonStyle,
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

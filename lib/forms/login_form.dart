import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_page_ui/config/constants.dart' as k;
import 'package:single_page_ui/config/styles.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RxBool isHidden = true.obs;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Obx(
        () => Column(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: k.Strings.kEmailHintText,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return k.Strings.kFieldEmpty;
                  }

                  if (!(RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value))) {
                    return k.Strings.kEmailNotValid;
                  }

                  return null;
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                controller: _passwordController,
                obscureText: isHidden.value,
                decoration: InputDecoration(
                    hintText: k.Strings.kPasswordHintText,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(isHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        isHidden.toggle();
                      },
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return k.Strings.kFieldEmpty;
                  }

                  if (value.length < k.Int.minimumPasswordLength) {
                    return k.Strings.kPasswordTooShort;
                  }

                  return null;
                },
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  padding: k.Paddings.kConnectButtonPadding,
                  highlightColor: k.KColors.kLoginHighlightColor,
                  child: AutoSizeText(
                    k.Strings.kLoginButtonText,
                    style: kLoginButtonStyle,
                    maxLines: 1,
                  ),
                  color: k.KColors.kLoginButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 2),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: AutoSizeText(
                            'You logged in with the email ${_emailController.text} and the password ${_passwordController.text}',
                            style: kSnackBarStyle,
                            maxLines: 1,
                          ),
                          behavior: k.SnackBar.kSnackBarBehavior,
                        ),
                      );

                      _emailController.clear();
                      _passwordController.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class KColors {
  // Rounded Container of the auth part
  static final Color kAuthContainerColor = Colors.white;

  // Email field focus color
  static final Color kEmailFocusColor = Colors.red;

  // Background color of the login button
  static final Color kLoginButtonColor = Colors.lightBlueAccent;

  // Background color of the register button
  static final Color kRegisterButtonColor = Colors.red;

  // Background color of the login button when it's pressed
  static final Color kLoginHighlightColor = Colors.red;

  // Background color of the register button when it's pressed
  static final Color kRegisterHighlightColor = Colors.lightBlueAccent;

  // Color of the back button color
  static final Color kBackColor = Colors.black;
}

class MaterialApp {
  // Optional title used by some widgets
  static final String kMaterialAppTitle = "Authentication Page";

  // Default Font Family for all text widgets of the app
  static final String kDefaultFontFamily = "DM Sans";

  // Primary Color of the entire app
  static final Color kPrimarySwatch = Colors.blue;
}

class Strings {
  // Title of auth part of the body
  static final String kAuthTitle = "AUTHENTICATION";

  // Hint Text for the email field
  static final String kEmailHintText = "Email";

  // Hint Text for the password field
  static final String kPasswordHintText = "Password";

  // Text of the Login Button
  static final String kLoginButtonText = "CONNECT";

  // Forgot Password text of the button
  static final String kForgotPassword = "Forgotten Password";

  // Text of the register button
  static final String kRegisterButtonText = "REGISTER";

  //String to show when the user enters a short password
  static final String kPasswordTooShort =
      'Your password must be longer than ${Int.minimumPasswordLength} words';

  // String to show when the user leaves an empty field
  static final String kFieldEmpty =
      'This field cannot be empty. Enter the password.';

  // String to show when the user enters an invalid email
  static final String kEmailNotValid = 'Enter a valid email, please.';
}

class SnackBar {
  // Whether the snackbar should appear fixed to the bottom or should be floating
  static final SnackBarBehavior kSnackBarBehavior = SnackBarBehavior.floating;
}

class Paddings {
  // Distance from borders of the Auth Container
  static final EdgeInsets kAuthContainerPadding = EdgeInsets.all(30);
}

class Images {
  // Images to show in the main page
  static final List<String> imgList = [
    'assets/backgrounds/land1.jpg',
    'assets/backgrounds/land2.jpg',
    'assets/backgrounds/land3.jpeg',
  ];
}

class Int {
  // minimum length of the password
  static final minimumPasswordLength = 6;
}

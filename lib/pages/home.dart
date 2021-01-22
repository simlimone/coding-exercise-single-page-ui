import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_page_ui/controllers/home_controller.dart';
import 'package:single_page_ui/config/constants.dart' as k;
import 'package:single_page_ui/forms/forgot.dart';
import 'package:single_page_ui/forms/register.dart';
import 'package:single_page_ui/pages/login.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomeController());

  final List<StatelessWidget> pageList = [
    Login(),
    RegisterPage(),
    ForgotPassword(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3 + 100,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(
                    k.Images.imgList[homeController.count.value],
                    key: UniqueKey(),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 3 + 100,
                  ),
                  switchInCurve: Curves.bounceIn,
                  switchOutCurve: Curves.bounceOut,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: k.Paddings.kAuthContainerPadding,
                height: (MediaQuery.of(context).size.height / 3) * 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: k.KColors.kAuthContainerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: AnimatedSwitcher(
                  child: pageList[homeController.pageIndex.value],
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: Offset(0.0, 1.0),
                      end: Offset(0.0, 0.0),
                    ).animate(
                      CurvedAnimation(
                        curve: Curves.easeInOutCubic,
                        parent: animation,
                      ),
                    );

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
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

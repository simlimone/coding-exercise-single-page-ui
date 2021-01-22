import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  Timer _timer;

  var count = 0.obs;
  var pageIndex = 0.obs;

  @override
  void onInit() {
    _timer = new Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (count < 2) {
        count = ++count;
      } else {
        count.value = 0;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  goToPage(int index) {
    pageIndex.value = index;
  }
}

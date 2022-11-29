import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';
import '../pages/upload_page.dart';

enum PageName { home, search, upload, activity, mypage }

class BottomNavController extends GetxController {
  GlobalKey<NavigatorState> newRoutePageNavigationKey =
      GlobalKey<NavigatorState>();
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(
    int value, {
    bool hasGesture = true,
  }) {
    PageName page = PageName.values[value];
    switch (page) {
      case PageName.upload:
        Get.to(() => const UploadPage());
        break;
      case PageName.home:
      case PageName.search:
      case PageName.activity:
      case PageName.mypage:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(
    int value, {
    bool hasGesture = true,
  }) {
    pageIndex(value);
    if (!hasGesture) {
      return;
    }
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '시스템',
          message: '종료 하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancleCallback: Get.back,
        ),
      );
      return true;
    } else {
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.search) {
        var value = await newRoutePageNavigationKey.currentState!.maybePop();
        if (value) {
          return false;
        }
      }

      bottomHistory.removeLast();
      changeBottomNav(bottomHistory.last, hasGesture: false);
      return false;
    }
  }
}

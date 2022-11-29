import 'package:flutter/material.dart';
import 'package:flutter_skeltone_bottom_navigation/src/controller/bottom_nav_controller.dart';
import 'package:flutter_skeltone_bottom_navigation/src/pages/activity_page.dart';
import 'package:flutter_skeltone_bottom_navigation/src/pages/home_page.dart';
import 'package:flutter_skeltone_bottom_navigation/src/pages/mypage_page.dart';
import 'package:flutter_skeltone_bottom_navigation/src/pages/upload_page.dart';
import 'package:get/get.dart';

import 'pages/search_page.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: sort_child_properties_last
      child: Obx(
        () => Scaffold(
          appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const HomePage(),
              Navigator(
                key: controller.newRoutePageNavigationKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              ),
              const UploadPage(),
              const ActivityPage(),
              const MypagePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.pageIndex.value,
            onTap: controller.changeBottomNav,
            elevation: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black45,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                activeIcon: Icon(
                  Icons.home,
                ),
                label: 'home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                ),
                activeIcon: Icon(
                  Icons.search,
                ),
                label: 'search',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                ),
                activeIcon: Icon(
                  Icons.add_box,
                ),
                label: 'upload',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                ),
                label: 'like',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}

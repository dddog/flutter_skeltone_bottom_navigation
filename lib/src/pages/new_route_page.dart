import 'package:flutter/material.dart';
import 'package:flutter_skeltone_bottom_navigation/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class NewRoutePage extends StatelessWidget {
  const NewRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: Get.find<BottomNavController>().willPopAction,
            child: const Text('back'),
          ),
        ),
      ),
    );
  }
}

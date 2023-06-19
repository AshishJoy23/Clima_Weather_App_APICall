import 'package:clima_weather_app/controller/global_controller.dart';
import 'package:clima_weather_app/view/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String apiKey = '4e5a60d981bf81a1bd41e1b9f97a9e10';

  //create instance of the controller
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  HeaderWidget(),
                ],
              )),
      ),
    );
  }
}

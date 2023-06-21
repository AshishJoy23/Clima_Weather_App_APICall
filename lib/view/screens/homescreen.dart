import 'package:clima_weather_app/controller/global_controller.dart';
import 'package:clima_weather_app/utils/custom_colors.dart';
import 'package:clima_weather_app/view/widgets/comfort_level.dart';
import 'package:clima_weather_app/view/widgets/daily_data_forecast.dart';
import 'package:clima_weather_app/view/widgets/header_widget.dart';
import 'package:clima_weather_app/view/widgets/hourly_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/current_weather_widget.dart';

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
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/icons/clouds.png'),
                  radius: 60,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  strokeWidth: 2,
                ),
                ),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),
                    //for our current temperature ('current')
                    CurrentWeatherWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather()),
                    const SizedBox(
                      height: 20,
                    ),
                    HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getWeatherData().getHourlyWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DailyDataForecast(
                      weatherDataDaily:
                          globalController.getWeatherData().getDailyWeather(),
                    ),
                    Divider(
                      thickness: 2,
                      color: CustomColors.dividerLine.withAlpha(250),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ComfortLevelWidget(
                      weatherDataCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}

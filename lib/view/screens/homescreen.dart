import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String apiKey = 'b584bbd4b9fe4e66937130320231006';

  String location = 'Delhi';
  String weatherIcon = 'heavycloud.png';
  int temperature = 0;
  int windSpeed = 0;
  int humidity = 0;
  int cloud = 0;
  String currentDate = '';

  List hourlyWeatherForecast = [];
  List dailyWeatherForecast = [];

  String currentWeatherStatus = '';


  //API Call
  String searchWeatherAPI = "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&days=7&q=";



  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber,);
  }
}
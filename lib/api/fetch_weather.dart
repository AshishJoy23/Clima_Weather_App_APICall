import 'dart:convert';
import 'package:clima_weather_app/model/weather_data_current.dart';
import 'package:clima_weather_app/model/weather_data_hourly.dart';
import 'package:clima_weather_app/utils/api_url.dart';

import '../model/weather_data.dart';
import 'package:http/http.dart' as http;

import '../model/weather_data_daily.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing the weather data from response -> to json
  Future<WeatherData> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiURL(lat, long)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );
    return weatherData!;
  }
}

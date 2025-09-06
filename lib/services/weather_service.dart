import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {  
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'c8902ccfb4724489bad142504251607';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data["error"]["message"] ?? 'Opps There Was An Error!';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Opps There Was An Error!');
    }
  }
}

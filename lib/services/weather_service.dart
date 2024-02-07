import 'package:dio/dio.dart';
import 'package:weather_app/models/city_model.dart';
class WeatherService
{
  final String _baseUrl = "http://api.weatherapi.com/v1";
  final String _apiKey = "ca48bb6def4948d989071706243001";

  Future<CityModel> getForecast({required String cityName}) async
  {
    try {
      Response response = await Dio().get("$_baseUrl/"
          "forecast.json?key=$_apiKey&q=$cityName&days=1&aqi=no&alerts=yes");
      var json = response.data;
      return CityModel.fromJson(json, "assets/images/clear.png");
    }
    on DioException catch (e)
    {
       final String errmsg = e.response?.data['error']['message'] ?? "oops there was an error try later";
       throw Exception(errmsg);
    }


  }
}
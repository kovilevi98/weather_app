import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/config/secrets.dart';
import 'package:weather/services/network_service.dart';

class WeatherService {
  NetworkService service = NetworkService();

  Future<Response> getWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      double longitude = position.longitude;
      double latitude = position.latitude;
      Response response = await service.request(
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric",
          method: "Get");
      print("_++++++++++++++++++${response.statusCode}");
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/weather_service.dart';

class WeatherController extends GetxController {
  final weatherService = Get.put(WeatherService());

  Future<void> getWeatherData(Function(String) onError, Function(Weather) onSuccess) async {
    var res;
    try {
      res = await weatherService.getWeather();
      if (res.statusCode != 200) {
        onError(res.data['message']);
        return;
      }
    } catch (e) {
      onError(e.toString());
      return;
    }

    onSuccess(Weather.fromJson(res.data));
    return;
  }
}
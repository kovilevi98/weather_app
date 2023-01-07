import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localization/localization.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:weather/controllers/weather_controller.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/position_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  final controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(context),
          _buildLocationButton(context)
        ],
      ),
    );
  }

  Widget _buildLocationButton(BuildContext context) {
    return RoundedLoadingButton(
      controller: _btnController,
      onPressed: () async {
        await _onLoadButtonPressed();
      },
      child: Text('refresh_weather'.i18n(), style: const TextStyle(color: Colors.white))
    );
  }

  Widget _title(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("hallo"),
        ],
      ),
    );
  }

  Future<void> _onLoadButtonPressed() async {
    try{
      await checkPermission();
    } catch (e){
      _showSnackBar("permission_error".i18n());
      _btnController.stop();
      return;
    }

    await controller.getWeatherData(_showSnackBar, _onWeatherDataSuccess);
    _btnController.stop();
  }

  _onWeatherDataSuccess(Weather weather){
    _showSnackBar(weather.name);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showSnackBar(String message){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}


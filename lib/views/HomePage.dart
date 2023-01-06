import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  Future<void> _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.stop();
    });
  }

  Future<void> _reset() async {

  }

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
        await _doSomething();
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
}


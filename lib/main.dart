import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

// import simple bloc transition
import './src/common/bloc_transition.dart';

// import main app
import './src/app.dart';

// import repository
import './src/repositories/repositories.dart';

// repository is used in entire App (is injected into App)
void main() {
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: Dio(),
    ),
  );

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    App(
      weatherRepository: weatherRepository,
    ),
  );
}

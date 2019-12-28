import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import repo and bloc
import 'repositories/repositories.dart';
import './features/weather/bloc/bloc.dart';

// import screens
import './features/weather/ui/weather_screen.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({@required this.weatherRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLutter Weather",
      home: BlocProvider(
        // Data Provider Bloc into tree widget
        // instantiate WeatherBloc
        create: (BuildContext context) =>
            WeatherBloc(weatherRepository: weatherRepository),
        child: Weather(),
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../models/models.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

// class InitialWeatherState extends WeatherState {
//   @override
//   List<Object> get props => [];
// }

/*
  There will be 4 states
    -> WeatherEmpty: no weather data / not select city data
    -> WeatherLoading: during fetching the weather
    -> WeatherLoaded: successfully fetch the weather
    -> WeatherError: unsucessfully fetch the weather
*/

class WeatherEmpty extends WeatherState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "WeatherEmpty";
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "WeatherLoading";
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];

  @override
  String toString() => "WeatherLoaded { weather : $weather }";
}

class WeatherError extends WeatherState {
  final String error;

  WeatherError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "WeatherError { error : $error }";
}

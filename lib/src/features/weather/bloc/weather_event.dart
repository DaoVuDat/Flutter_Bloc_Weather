import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

// event fetch weather by city (input <- city)
class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];

  @override
  String toString() => "FetchWeather { city : $city }";
}

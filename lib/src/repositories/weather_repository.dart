import 'package:flutter/foundation.dart';
import 'package:flutter_weather/src/models/models.dart';
import 'package:flutter_weather/src/repositories/weather_api_client.dart';

// this is served as an abstraction between the client code and the data provider => Bloc will take this layer
class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    // fetch location then weather
    final int locationId = await weatherApiClient.getLoactionId(city);
    return await weatherApiClient.fetchWeather(locationId);
  }
}

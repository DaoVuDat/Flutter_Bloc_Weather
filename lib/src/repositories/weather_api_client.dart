import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// import model
import '../models/models.dart';


// client Code is from here
class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';

  final Dio httpClient;

  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  // fetching to get location id
  Future<int> getLoactionId(String city) async {
    final locationUrl = "$baseUrl/api/location/search/?query=$city";
    final locationResponse = await this.httpClient.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    // i.e: https://www.metaweather.com/api/location/search/?query=london
    // [{"title":"London","location_type":"City","woeid":44418,"latt_long":"51.506321,-0.12714"}]
    // get woeid
    
    // print(jsonDecode(locationResponse.data));
    // print(locationResponse.data.toString());
    // no need to jsonDecode(locaionResponse.data);
    final locationJson = locationResponse.data;
    
    return (locationJson.first['woeid']);
  }

  // fetching to get weather by location
  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    final weatherJson = weatherResponse.data;
    return Weather.fromJson(weatherJson);
  }
}

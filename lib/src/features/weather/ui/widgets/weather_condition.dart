import 'package:flutter/material.dart';

import '../../../../models/models.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;
  
  WeatherConditions({@required this.condition}):assert(condition != null);

  @override
  Widget build(BuildContext context) {
    return _mapConditionToImage(condition);
  }

  Widget _mapConditionToImage(WeatherCondition condition){
    Image image;
    switch(condition){
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset("assets/images/clear.png");
        break;

      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset("assets/images/snow.png");
        break;

      case WeatherCondition.heavyCloud:
        image = Image.asset("assets/images/cloudy.png");
        break;

      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset("assets/images/rainy.png");
        break;
        
      case WeatherCondition.thunderstorm:
        image = Image.asset("assets/images/thunderstorm.png");
        break;
        
      case WeatherCondition.unknown:
        image = Image.asset("assets/images/clear.png");
        break;
    }
    return image;
  }
}
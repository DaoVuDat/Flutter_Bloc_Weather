import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double high;
  final double low;

  Temperature(
      {@required this.temperature, @required this.high, @required this.low});

  int _formattedTemperature(double temperature) => temperature.round();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            "${_formattedTemperature(temperature)}",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              "max: ${_formattedTemperature(high)}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            Text(
              "min: ${_formattedTemperature(low)}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}

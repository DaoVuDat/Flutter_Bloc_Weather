import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import screens
import './city_selection_screen.dart';

// import widgets
import './widgets/widgets.dart';

// import models
import '../../../models/models.dart';
import '../../../features/weather/bloc/bloc.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Weather"),
        actions: <Widget>[
          // this action button will take returned value city from CitySelection Screen
          // => await
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );

              if (city != null) {
                // fetch data with event fetch
                BlocProvider.of<WeatherBloc>(context).add(
                  FetchWeather(city: city),
                );
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<WeatherBloc>(context),
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherEmpty) {
              return Center(
                child: Text("Please select a Location"),
              );
            }

            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator(),);
            }

            if (state is WeatherError) {
              return Center(child: Text(state.error),);
            }
 
            if (state is WeatherLoaded) {
              final weather = state.weather;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Location(location: weather.location),
                    ),
                  ),

                  Center(
                    child: LastUpdated(dateTime: weather.lastUpdated),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: CombinedWeatherTemperature(weather: weather),
                    ),
                  )


                ],
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}



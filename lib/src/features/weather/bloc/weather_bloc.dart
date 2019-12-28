import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../repositories/repositories.dart';
import './bloc.dart';


// this bloc takes the weather repository as dependancy
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  
  WeatherRepository weatherRepository;
  
  WeatherBloc({@required this.weatherRepository}):assert(weatherRepository != null);

  // initialize the weather empty
  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeather){
      yield WeatherLoading();
      yield* mapFetchEventToState(event);
    }
  }
  
  Stream<WeatherState> mapFetchEventToState (FetchWeather event) async* {
    // try to fetch api
    try {
      // get weather from city ( 2 api call in repository)
      final weather = await weatherRepository.getWeather(event.city);

      // after fetching successfully -> yield Loaded
      yield WeatherLoaded(weather: weather);

    } catch (error) {
      yield WeatherError(error: error.toString());
    }
  }
}

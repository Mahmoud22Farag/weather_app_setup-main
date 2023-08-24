import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/services/weather_service.dart';
import '../../models/weather_model.dart';

class weathercubit extends Cubit<weatherstate> {
  weathercubit(this.weatherService) : super(weatherintial());

  WeatherService weatherService;
  WeatherModel ?weatherModel;

  void getWeather({required String wether}) async {
    emit(weatherloding());
    try {
      weatherModel = await weatherService.getWeather(cityName: wether);
      emit(weathersuccess());
    }
    on Exception catch (e) {
      emit(weatherffaild());
    }
  }
}
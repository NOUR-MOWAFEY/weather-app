import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition)),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          ),
        ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case null:
      return Colors.blue;
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.amber;
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Light rain shower':
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.lightBlue;
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Moderate or heavy rain shower':
    case 'Patchy light rain with thunder':
      return Colors.blue;
    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain with thunder':
      return Colors.indigo;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy snow with thunder':
      return Colors.blue;
    case 'Heavy snow':
    case 'Patchy heavy snow':
      return Colors.indigo;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Light sleet showers':
      return Colors.cyan;
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Thundery outbreaks possible':
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}


/*

  Cubit State Management
  ----------------------
  Create States
  Create Cubit
  Create Function
  Provide Cubit
  Integrate Cubit
  Trigger Cubit
  
 */
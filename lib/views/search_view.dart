import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Search a city',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)),
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.blueGrey),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              // border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 28,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

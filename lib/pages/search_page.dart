import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextFormField(
            onFieldSubmitted: (val) async {
              GetWeatherCubit getWeatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: val);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              enabled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3),
              ),
              hintText: "Enter City Name",
              labelText: "Search",
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

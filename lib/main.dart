import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/pages/homepage.dart';
import 'cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition),
              ),
              debugShowCheckedModeBanner: false,
              home: const Homepage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.grey;
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Blowing snow":
    case "Blizzard":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Ice pellets":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
    case "Thundery outbreaks possible":
      return Colors.yellow;
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}

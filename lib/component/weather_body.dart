import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    //حيث هذا السطر الخاص بجلب البيانات من ال WeatherModel الموجود في صفحه ال cubit (دي الطريقه التانيه)
    //   ولازم يتحط جوا ال build_Method لوجود ال context
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(weatherModel.condition).shade500,
              getThemeColor(weatherModel.condition).shade300,
              getThemeColor(weatherModel.condition).shade100,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weatherModel.image.contains("https:")
                  ? Image.network(weatherModel.image)
                  : Image.network("https:${weatherModel.image}"),
              Text(
                "${weatherModel.temp.round()}",
                //     weatherModel.temp.toString(),
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    "maxTemp : ${weatherModel.maxTemp.round()}",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "minTemp : ${weatherModel.minTemp.round()}",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            weatherModel.condition,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

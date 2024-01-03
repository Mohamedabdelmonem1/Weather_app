import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // or
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "there is no weather 😞 start",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "Searching Now ",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

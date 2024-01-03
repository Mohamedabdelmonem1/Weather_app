import 'package:weather_app/model/weather_model.dart';
import 'package:dio/dio.dart';



class WeatherService {
  //حيث ال baseurl هي الجزء المشترك مع كل ال methods حيث لو حصل تغيير فيها اعدلها بسهوله من هنا
  //وكذلك حيث ال apikey هي الجزء المشترك مع كل ال methods حيث لو حصل تغيير فيها اعدلها بسهوله من هنا
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = "24fa9868e7234b65a49193825232210";
  final dio = Dio();

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "oops there was an error,try later";
      throw Exception(errorMessage);
    }
  }
}

//  لي استعملت علامه استفهام مع ال weathermodel فوق علشان استعملت try,catch وحيث في ال catch هيرجعلي ال weathermodel ب null
// لكن هنا مستعملتش علامه الاستفهام  مع ال weathermodel لان ال catch فيها كود بيتنفذ عادي

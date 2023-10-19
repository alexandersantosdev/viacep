import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ViaCepDioDatabase {
  final _dio = Dio();

  ViaCepDioDatabase() {
    _dio.options.baseUrl = dotenv.get('APP_URL');
    _dio.options.headers = {
      "X-Parse-Application-Id": dotenv.get('APP_ID'),
      "X-Parse-REST-API-Key": dotenv.get('API_KEY')
    };
  }
  Dio get dio => _dio;
}

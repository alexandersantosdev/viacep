import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ViaCepDio {
  final _dio = Dio();

  ViaCepDio() {
    _dio.options.baseUrl = dotenv.get('VIA_CEP_URL');
  }
  Dio get dio => _dio;
}

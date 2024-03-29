import 'package:dio/dio.dart';


extension DioExtensions on Dio {
  void setup(String baseUrl, Duration connectionTimeout) {
    options.connectTimeout = connectionTimeout;
    options.receiveTimeout = connectionTimeout;
    options.baseUrl = baseUrl;
  }
}
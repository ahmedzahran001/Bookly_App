import 'package:bookly/core/utils/helper/dio_interceptor.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    _dio.interceptors.add(DioInterceptor());
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}

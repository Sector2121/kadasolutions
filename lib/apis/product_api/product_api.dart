import 'package:dio/dio.dart';

class ProductsApi {
  final Dio _dio;

  ProductsApi(this._dio);

  Future<List<dynamic>> getProducts() async {
    try {
      Response response = await _dio.get('/products');

      return response.data['products'] as List<dynamic>;
    } catch (e) {
      return [];
    }
  }
}
import 'package:dio/dio.dart';

class ProductsApi {
  final Dio _dio;

  ProductsApi(this._dio);

  Future<void> getProducts() async {
    try {
      Response response = await _dio.get('/products');

      print('hello');
    } catch (e) {
      print('asd');
    }
  }

  Future<void> getProductDetails(int id) async {
    try {
      Response response = await _dio.get('/products/$id');

    } catch (e) {
      print('asd');
    }
  }
}
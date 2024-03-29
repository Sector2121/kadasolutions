import 'package:kadasolutions/index.dart';

class ProductsInteractor {
  final ProductsApi _productApi;

  ProductsInteractor(this._productApi);

  Future<void> getProducts() async {
    await _productApi.getProducts();
  }
}
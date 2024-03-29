import 'package:kadasolutions/index.dart';

class ProductsInteractor {
  final ProductsApi _productApi;

  ProductsInteractor(this._productApi);

  Future< List<Product>> getProducts() async {
    final productsResponse = await _productApi.getProducts();

    return _toProduct(productsResponse);
  }

  List<Product> _toProduct(List<dynamic> response) => response.map((e) {
      return Product(
        id: e['id'],
        title: e['title'],
        description: e['description'],
        price: e['price'],
        stock: e['stock'],
        thumbnail: e['thumbnail'],
        images: e['images'].cast<String>(),
      );
    }).toList();
}

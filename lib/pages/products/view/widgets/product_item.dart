import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kadasolutions/index.dart';

class ProductItem extends StatelessWidget {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final Product product;

  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width / 2 - 10;

    return InkWell(
      onTap: () => NavigationService.of(context).goToDetailedProductPage(product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: imageWidth,
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${product.price}',
                  style: TextStyle(color: _applicationConfig.priceColor),
                ),
                Text(
                  '${product.stock} left',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

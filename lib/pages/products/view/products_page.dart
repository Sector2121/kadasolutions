import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kadasolutions/index.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<ProductsBloc>()..add(GetProductsEvent()),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return switch (state) {
                ProductsLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ProductsLoadedState(:final products) => _buildProductsWidget(products: products, context: context),
                ProductsErrorState(:final exceptionMessage) => ProductErrorWidget(exceptionMessage: exceptionMessage),
                _ => Container()
              };
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductsWidget({required List<Product> products, required BuildContext context}) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
        ),
        itemBuilder: (_, int index) {
          final product = products[index];
          return ProductItem(product: product);
        },
      ),
    );
  }
}

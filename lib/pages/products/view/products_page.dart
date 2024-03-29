import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kadasolutions/index.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<ProductsBloc>(),
      child: BlocListener<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsLoadedState) {
            NavigationService.of(context).goToDetailedProductPage();
          }
        },
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                TextButton(
                  onPressed: () => context.read<ProductsBloc>().add(GetProductsEvent()),
                  child: const Text('valalmi'),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kadasolutions/index.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsInteractor productsInteractor;

  ProductsBloc({required this.productsInteractor}) : super(ProductsInitialState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try {
        final products = await productsInteractor.getProducts();
        emit(ProductsLoadedState(products));
      } catch (e) {
        emit(ProductsErrorState('$e'));
      }
    });
  }
}

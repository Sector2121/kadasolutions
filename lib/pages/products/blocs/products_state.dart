part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {}

class ProductsInitialState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoadedState extends ProductsState {
  final List<Product> products;

  ProductsLoadedState(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String exceptionMessage;

  ProductsErrorState(this.exceptionMessage);

  @override
  List<Object?> get props => [exceptionMessage];
}


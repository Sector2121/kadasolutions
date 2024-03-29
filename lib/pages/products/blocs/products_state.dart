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
  @override
  List<Object?> get props => [];
}

class ProductsErrorState extends ProductsState {
  @override
  List<Object?> get props => [];
}


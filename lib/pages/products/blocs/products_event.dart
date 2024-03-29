part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {}

class GetProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}

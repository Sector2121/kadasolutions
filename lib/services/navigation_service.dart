import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kadasolutions/index.dart';

class NavigationRoutes {
  static const products = 'products';
  static const productDetails = 'productDetails';
}

class NavigationService {
  final BuildContext context;

  NavigationService(this.context);

  static NavigationService of(BuildContext context) => NavigationService(context);

  void goBack<T extends Object?>([T? result]) => GoRouter.of(context).pop(result);


  void goToDetailedProductPage(Product product) {
    _goToPageImpl(
      context: context,
      routeName: NavigationRoutes.productDetails,
      extra: product,
    );
  }

  void _goToPageImpl({
    required BuildContext context,
    required String routeName,
    Object? extra,
    Map<String, String> params = const {},
    bool? withoutStacking,
  }) {
    final currentRoute = _getCurrentRoute(context);

    final newRoute = context.namedLocation(
      routeName,
      pathParameters: params,
    );

    // Avoid triggering the redirect logic if navigating to the same page
    if (currentRoute == newRoute) {
      return;
    }

    if (withoutStacking == true) {
      // Replaces the current navigation stack
      context.goNamed(
        routeName,
        extra: extra,
        pathParameters: params,
      );
    } else {
      // Stacks one page on another in navigation
      context.pushNamed(
        routeName,
        extra: extra,
        pathParameters: params,
      );
    }
  }

  String _getCurrentRoute(BuildContext context) {
    return  GoRouterState.of(context).uri.toString();
  }
}

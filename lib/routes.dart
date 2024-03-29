import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kadasolutions/index.dart';

GoRouter? _router;
final _appShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'AppShellRouteNavigatorKey');

GoRouter createRouterConfig() {
  _router ??= GoRouter(
    initialLocation: '/${NavigationRoutes.products}',
    routes: [
      ShellRoute(
        navigatorKey: _appShellNavigatorKey,
        builder: (context, state, widget) => AppShellPage(
          child: widget,
        ),
        routes: [
          GoRoute(
            name: NavigationRoutes.products,
            path: '/${NavigationRoutes.products}',
            builder: (context, state) => const ProductsPage(),
          ),
          GoRoute(
            name: NavigationRoutes.productDetails,
            path: '/${NavigationRoutes.productDetails}',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const ProductDetailsPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.5, 0),
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeIn)),
                    ),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
    ],
  );

  return _router!;
}

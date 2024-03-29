import 'package:dio/dio.dart';
import 'package:kadasolutions/index.dart';
import 'package:get_it/get_it.dart';

void registerServices() {
  final services = GetIt.instance;

  services.registerSingleton<ApplicationConfig>(ApplicationConfig());
}

void registerBlocs() {
  final services = GetIt.instance;

  services.registerSingleton<ProductsInteractor>(
    ProductsInteractor(
      services.get<ProductsApi>(),
    ),
  );

  services.registerFactory<ProductsBloc>(
        () => ProductsBloc(
      productsInteractor: services.get<ProductsInteractor>(),
    ),
  );
}

void registerApisBeforeRunApp() {
  const baseUrl = 'https://dummyjson.com/';
  final services = GetIt.instance;
  final dio = Dio();

  const connectionTimeout = Duration(seconds: 20);

  dio.setup(baseUrl, connectionTimeout);

  services.registerSingleton<ProductsApi>(ProductsApi(dio));
}

import 'package:get_it/get_it.dart';
import 'package:litest/core/api/api.dart';
import 'package:litest/global/services.dart';

class DependencyInjection {

  static void init(){
    final getit = GetIt.I;
    final api = getit.registerSingleton<DummyApiService>(DummyApiService());

    getit.registerSingleton<LoginService>(LoginService(api));
    getit.registerSingleton<ProductService>(ProductService(api));
    getit.registerSingleton<CartService>(CartService(api));
  }
}
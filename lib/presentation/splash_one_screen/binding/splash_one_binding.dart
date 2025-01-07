import '../controller/splash_one_controller.dart';
import 'package:get/get.dart';

class SplashOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashOneController());
  }
}

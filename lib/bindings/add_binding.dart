import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddController());
  }
}

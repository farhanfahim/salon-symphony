import 'package:get/get.dart';

import '../controller/document_detail_controller.dart';

class DocumentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentsDetailController>(() => DocumentsDetailController(),
    );
  }
}

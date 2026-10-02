import 'package:get/get.dart';
import 'package:practiceproject/data/services/practice_post_service.dart';
import 'package:practiceproject/data/services/practice_service.dart';
import 'package:practiceproject/presentation/controller/practice_controller.dart';
import 'package:practiceproject/presentation/controller/practice_controller_post.dart';

class PracticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PracticeService>(PracticeService(), permanent: true);
    Get.put<PracticeController>(PracticeController(), permanent: true);
    Get.put<PracticePostService>(PracticePostService(), permanent: true);
    Get.put<PracticeControllerPost>(PracticeControllerPost(), permanent: true);


  }
}

import 'dart:developer';

import 'package:get/get.dart';
import 'package:practiceproject/data/models/practice_model.dart';
import 'package:practiceproject/data/services/practice_service.dart';

class PracticeController extends GetxController {
  final PracticeService _practiceService = Get.find<PracticeService>();
  final RxBool isLoading = false.obs;
  final RxList<Product> dataList = <Product>[].obs;
  final RxInt total = 0.obs;
  final RxInt skip = 0.obs;
  final RxInt limit = 0.obs;

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      final response = await _practiceService.practiceapi();
      log('Data fetched successfully: $response');
      dataList.value = response.products;
      total.value = response.total;
      skip.value = response.skip;
      limit.value = response.limit;
    } catch (e) {
      log('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

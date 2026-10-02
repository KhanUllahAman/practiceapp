import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:practiceproject/data/services/practice_post_service.dart';
import 'package:practiceproject/presentation/controller/practice_controller.dart';
import 'package:practiceproject/utils/Snackbar/custom_snackbar.dart';

class PracticeControllerPost extends GetxController {
  final PracticePostService _practicePostService = Get.find();
  final PracticeController _practiceController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<void> praticePostApi(formkey) async {
    try {
      isLoading.value = true;
      if (!formkey.currentState!.validate()) {
        return;
      }
      if (titleController.text.trim().isEmpty) {
        customSnackBar(
          'Error',
          'Please enter a product title',
          snackBarType: SnackBarType.error,
        );
        return;
      }
      final response = await _practicePostService.praticePostApi(
        title: titleController.text.trim(),
      );
      log('POST Success: ${response.title}');
      titleController.clear();
      await _practiceController.fetchData();
    } catch (e) {
      log('POST Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

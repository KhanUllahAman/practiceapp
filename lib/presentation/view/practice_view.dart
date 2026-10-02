import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practiceproject/presentation/controller/practice_controller.dart';
import 'package:practiceproject/presentation/controller/practice_controller_post.dart';
import 'package:practiceproject/utils/Buttons/app_button.dart';
import 'package:practiceproject/utils/TextFormFeild/custom_text_form_field.dart';

class PracticeView extends GetView<PracticeControllerPost> {
  const PracticeView({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = controller;
    final getController = Get.find<PracticeController>();

    return Scaffold(
      appBar: AppBar(title: const Text('POST + GET Practice')),

      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            // TEXT FIELD
            Form(
              key: postController.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: postController.titleController,
                    labelText: 'Product Title',
                    hintText: 'Enter product title',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a product title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => AppButton(
                      isLoading: postController.isLoading.value,
                      mediaQuery: MediaQuery.of(context),
                      onPressed: postController.isLoading.value
                          ? () {}
                          : () async {
                              await postController.praticePostApi(controller.formKey);
                            },
                      child: Text(
                        postController.isLoading.value
                            ? 'Posting...'
                            : 'Post Product',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // GET DATA
            Obx(() {
              if (getController.isLoading.value) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (getController.dataList.isEmpty) {
                return const Expanded(
                  child: Center(child: Text('No products found')),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: getController.dataList.length,
                  itemBuilder: (context, index) {
                    final item = getController.dataList[index];

                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text('\$${item.price}'),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

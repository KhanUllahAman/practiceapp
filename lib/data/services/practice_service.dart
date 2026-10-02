import 'dart:developer';
import 'package:get/get.dart';
import 'package:practiceproject/core/network/api_endpoints.dart';
import 'package:practiceproject/core/network/network_client.dart';
import 'package:practiceproject/data/models/practice_model.dart';

class PracticeService {
  final NetworkClient _networkClient = Get.find();

  Future<PracticeModel> practiceapi() async {
    try {
      final response = await _networkClient.get(
        endpoint: ApiConstants.practiceUrl,
      );
      log("Practice Model Logs $response");
      return PracticeModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
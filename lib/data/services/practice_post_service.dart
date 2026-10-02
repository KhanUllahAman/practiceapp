import 'package:get/get.dart';
import 'package:practiceproject/core/network/api_endpoints.dart';
import 'package:practiceproject/data/models/practice_post_model.dart';
import '../../core/network/network_client.dart';

class PracticePostService {
  final NetworkClient _networkClient = Get.find();

  Future<PracticeModelPost> praticePostApi({
    String? title,
  }) async {
    try {
      final body = {
        'title': title ?? '',
      };
      final response = await _networkClient.post(
        endpoint: ApiConstants.practiceUrlPost,
        body: body,
      );
      return PracticeModelPost.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
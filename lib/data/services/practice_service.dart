// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:practiceproject/core/network/network_client.dart';

// class PracticeService {
//   final NetworkClient _networkClient = Get.find();

//   Future<ChangePasswordModel> changePassword({
//     required int employeeId,
//     required String oldPassword,
//     required String newPassword,
//   }) async {
//     try {
//       final response = await _networkClient.post(
//         endpoint: ApiConstants.changePasswordUrl,
//         body: {'employee_id': employeeId, 'old_password': oldPassword, 'new_password': newPassword},
//       );
//       log("Change Password Logs $response");
//       return ChangePasswordModel.fromJson(response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
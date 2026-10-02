// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:orioconnect/core/contants/storage_keys.dart';
// import 'package:orioconnect/data/services/attendance_correction_service.dart';
// import 'package:orioconnect/data/services/complaint_list_service.dart';
// import 'package:orioconnect/data/services/get_all_employee_service.dart';
// import 'package:orioconnect/data/services/home_service.dart';
// import 'package:orioconnect/data/services/leave_history_service.dart';
// import 'package:orioconnect/data/services/notification_list_service.dart';
// import 'package:orioconnect/data/services/office_wifi_serive.dart';
// import 'package:orioconnect/data/services/profile_service.dart';
// import 'package:orioconnect/data/services/track_attendance_service.dart';
// import 'package:orioconnect/data/services/upload_document_service.dart';
// import 'package:orioconnect/presentation/controller/attendance_correction_list_controller.dart';
// import 'package:orioconnect/presentation/controller/complaint_list_controller.dart';
// import 'package:orioconnect/presentation/controller/get_all_employee_controller.dart';
// import 'package:orioconnect/presentation/controller/home_controller.dart';
// import 'package:orioconnect/presentation/controller/leave_history_controller.dart';
// import 'package:orioconnect/presentation/controller/notification_list_controller.dart';
// import 'package:orioconnect/presentation/controller/office_wifi_controller.dart';
// import 'package:orioconnect/presentation/controller/otp_controller.dart';
// import 'package:orioconnect/presentation/controller/profile_controller.dart';
// import 'package:orioconnect/presentation/controller/track_attendance_controller.dart';
// import 'package:orioconnect/presentation/controller/upload_document_controller.dart';

// class SecureStorageService {
//   static const _storage = FlutterSecureStorage();

//   static Future<void> saveUserId(String userId) async {
//     await _storage.write(key: StorageKeys.keyUserId, value: userId);
//   }

//   static Future<String?> getUserId() async {
//     return await _storage.read(key: StorageKeys.keyUserId);
//   }

//   static Future<void> saveToken(String token) async {
//     await _storage.write(key: StorageKeys.keyToken, value: token);
//   }

//   static Future<String?> getToken() async {
//     return await _storage.read(key: StorageKeys.keyToken);
//   }

//   static Future<void> saveEmpNo(String empno) async {
//     await _storage.write(key: StorageKeys.keyEmpNo, value: empno);
//   }

//   static Future<String?> getEmpNo() async {
//     return await _storage.read(key: StorageKeys.keyEmpNo);
//   }

//   static Future<void> saveUserName(String name) async {
//     await _storage.write(key: StorageKeys.keyUserName, value: name);
//   }

//   static Future<String?> getUserName() async {
//     return await _storage.read(key: StorageKeys.keyUserName);
//   }

//   static Future<void> saveUserEmail(String email) async {
//     await _storage.write(key: StorageKeys.keyUserEmail, value: email);
//   }

//   static Future<String?> getUserEmail() async {
//     return await _storage.read(key: StorageKeys.keyUserEmail);
//   }

//   static Future<void> saveUserPhone(String phone) async {
//     await _storage.write(key: StorageKeys.keyUserPhone, value: phone);
//   }

//   static Future<String?> getUserPhone() async {
//     return await _storage.read(key: StorageKeys.keyUserPhone);
//   }

//   static Future<void> saveProfilePicture(String imageUrl) async {
//     await _storage.write(key: StorageKeys.keyProfilePicture, value: imageUrl);
//   }

//   static Future<String?> getProfilePicture() async {
//     return await _storage.read(key: StorageKeys.keyProfilePicture);
//   }

//   static Future<void> saveUserType(String type) async {
//     await _storage.write(key: StorageKeys.keyUserType, value: type);
//   }

//   static Future<String?> getUserType() async {
//     return await _storage.read(key: StorageKeys.keyUserType);
//   }

//   static Future<void> saveEmployeeId(String employeeId) async {
//     await _storage.write(key: StorageKeys.keyEmployeeId, value: employeeId);
//   }

//   static Future<String?> getEmployeeId() async {
//     return await _storage.read(key: StorageKeys.keyEmployeeId);
//   }

//   static Future<int> getEmployeeIdAsInt() async {
//     final empIdString = await _storage.read(key: StorageKeys.keyEmployeeId);
//     return int.tryParse(empIdString ?? '0') ?? 0;
//   }

//   static Future<void> saveDepartmentId(String departmentId) async {
//     await _storage.write(key: StorageKeys.keyDepartmentId, value: departmentId);
//   }

//   static Future<String?> getDepartmentId() async {
//     return await _storage.read(key: StorageKeys.keyDepartmentId);
//   }

//   static Future<void> saveDesignationId(String designationId) async {
//     await _storage.write(
//       key: StorageKeys.keyDesignationId,
//       value: designationId,
//     );
//   }

//   static Future<String?> getDesignationId() async {
//     return await _storage.read(key: StorageKeys.keyDesignationId);
//   }

//   static Future<void> saveUserStatus(String status) async {
//     await _storage.write(key: StorageKeys.keyUserStatus, value: status);
//   }

//   static Future<String?> getUserStatus() async {
//     return await _storage.read(key: StorageKeys.keyUserStatus);
//   }

//   static Future<void> saveUserCnic(String cnic) async {
//     await _storage.write(key: StorageKeys.keyUserCnic, value: cnic);
//   }

//   static Future<String?> getUserCnic() async {
//     return await _storage.read(key: StorageKeys.keyUserCnic);
//   }

//   static Future<void> saveUserAddress(String address) async {
//     await _storage.write(key: StorageKeys.keyUserAddress, value: address);
//   }

//   static Future<String?> getUserAddress() async {
//     return await _storage.read(key: StorageKeys.keyUserAddress);
//   }

//   static Future<void> saveUserDob(String dob) async {
//     await _storage.write(key: StorageKeys.keyUserDob, value: dob);
//   }

//   static Future<String?> getUserDob() async {
//     return await _storage.read(key: StorageKeys.keyUserDob);
//   }

//   static Future<void> saveUserGender(String gender) async {
//     await _storage.write(key: StorageKeys.keyUserGender, value: gender);
//   }

//   static Future<String?> getUserGender() async {
//     return await _storage.read(key: StorageKeys.keyUserGender);
//   }

//   static Future<void> saveJoinDate(String joinDate) async {
//     await _storage.write(key: StorageKeys.keyJoinDate, value: joinDate);
//   }

//   static Future<String?> getJoinDate() async {
//     return await _storage.read(key: StorageKeys.keyJoinDate);
//   }

//   static Future<void> saveMenus(List<dynamic> menus) async {
//     await _storage.write(key: StorageKeys.keyMenus, value: jsonEncode(menus));
//   }

//   static Future<List<Map<String, dynamic>>> getMenus() async {
//     final raw = await _storage.read(key: StorageKeys.keyMenus);
//     if (raw == null || raw.isEmpty) return [];
//     try {
//       return (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
//     } catch (_) {
//       return [];
//     }
//   }

//   static Future<void> saveThemeMode(bool isDark) async {
//     await _storage.write(key: 'theme_mode', value: isDark ? 'dark' : 'light');
//   }

//   static Future<bool> getThemeMode() async {
//     final value = await _storage.read(key: 'theme_mode');
//     return value == 'dark';
//   }

//   static Future<Map<String, dynamic>> _menuByUrl(String url) async {
//     final menus = await getMenus();
//     return menus.firstWhere((m) => m['url'] == url, orElse: () => {});
//   }

//   static Future<bool> canView(String url) async =>
//       (await _menuByUrl(url))['can_view'] == '1';

//   static Future<bool> canCreate(String url) async =>
//       (await _menuByUrl(url))['can_create'] == '1';

//   static Future<bool> canEdit(String url) async =>
//       (await _menuByUrl(url))['can_edit'] == '1';

//   static Future<bool> canDelete(String url) async =>
//       (await _menuByUrl(url))['can_delete'] == '1';

//   static Future<bool> isLoggedIn() async {
//     final token = await getToken();
//     return token != null && token.isNotEmpty;
//   }

//   static Future<void> clearAll() async {
//     await _storage.deleteAll();
//   }

//   static Future<void> clearAllExceptTheme() async {
//     final theme = await _storage.read(key: 'theme_mode');
//     await _storage.deleteAll();
//     if (theme != null) {
//       await _storage.write(key: 'theme_mode', value: theme);
//     }
//   }

//   static Future<void> delete(String key) async {
//     await _storage.delete(key: key);
//   }

//   Future<bool> canManageLeave() async {
//     final userType = await SecureStorageService.getUserType();
//     if (userType == null || userType.toLowerCase() == 'employee') return false;

//     final menus = await SecureStorageService.getMenus();
//     final leaveMenu = menus.firstWhere(
//       (m) => m['menu_id'].toString() == '6',
//       orElse: () => {},
//     );
//     return leaveMenu.isNotEmpty && leaveMenu['can_edit']?.toString() == '1';
//   }

//   Future<bool> canManageAttendanceTracking() async {
//     final userType = await SecureStorageService.getUserType();
//     if (userType == null || userType.toLowerCase() == 'employee') return false;

//     final menus = await SecureStorageService.getMenus();
//     final attendanceTrackingMenu = menus.firstWhere(
//       (m) => m['menu_id'].toString() == '4',
//       orElse: () => {},
//     );
//     return attendanceTrackingMenu.isNotEmpty &&
//         attendanceTrackingMenu['can_view']?.toString() == '1';
//   }

//   Future<bool> canManageLeadsTracking() async {
//     final userType = await SecureStorageService.getUserType();
//     if (userType == null) return false;

//     final menus = await SecureStorageService.getMenus();
//     final leadsTrackingMenu = menus.firstWhere(
//       (m) => m['menu_id'].toString() == '48',
//       orElse: () => {},
//     );
//     return leadsTrackingMenu.isNotEmpty &&
//         leadsTrackingMenu['can_view']?.toString() == '1';
//   }

//   static Future<void> performLogout() async {
//     await SecureStorageService.clearAllExceptTheme();
//     Get.delete<HomeController>(force: true);
//     Get.delete<HomeService>(force: true);
//     Get.delete<GetAllEmployeeController>(force: true);
//     Get.delete<GetAllEmployeeService>(force: true);
//     Get.delete<ProfileController>(force: true);
//     Get.delete<ProfileService>(force: true);
//     Get.delete<UploadDocumentController>(force: true);
//     Get.delete<UploadDocumentService>(force: true);
//     Get.delete<LeaveController>(force: true);
//     Get.delete<LeaveHistoryService>(force: true);
//     Get.delete<TrackAttendanceController>(force: true);
//     Get.delete<TrackAttendanceService>(force: true);
//     Get.delete<AttendanceCorrectionListController>(force: true);
//     Get.delete<AttendanceCorrectionListService>(force: true);
//     Get.delete<ComplaintListController>(force: true);
//     Get.delete<ComplaintListService>(force: true);
//     Get.delete<NotificationListController>(force: true);
//     Get.delete<NotificationListService>(force: true);
//     Get.delete<OfficeWifiController>(force: true);
//     Get.delete<OfficeWifiSerive>(force: true);
//     if (Get.isRegistered<OtpController>()) {
//       Get.delete<OtpController>(force: true);
//     }
//   }
// }

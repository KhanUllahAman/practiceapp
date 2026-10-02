import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:practiceproject/core/connectivity/connectivity_service.dart';
import 'package:practiceproject/core/network/api_endpoints.dart';
import 'package:practiceproject/core/network/api_interceptor.dart';
import '../exceptions/app_exceptions.dart';
import '../exceptions/exception_handler.dart';

class NetworkClient {
  late Dio _dio;
  final ConnectivityService _connectivityService = Get.find();

  NetworkClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.practiceUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(ApiInterceptor());
  }

  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool showErrorSnackbar = true,
  }) async {
    try {
      if (!_connectivityService.isConnected) {
        throw NoInternetException();
      }
      final options = Options(headers: await _buildHeaders(headers));
      final response = await _dio.post(endpoint, data: body, options: options);
      log("Final Response:: $response");
      return response;
    } catch (e) {
      log("Final Error:: $e");
      throw ExceptionHandler.handleError(e, showSnackbar: showErrorSnackbar);
    }
  }

  Future<Response> postFormData({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? headers,
    bool showErrorSnackbar = true,
  }) async {
    try {
      if (!_connectivityService.isConnected) {
        throw NoInternetException();
      }
      final customHeaders = await _buildHeaders(headers);
      customHeaders['Content-Type'] = 'multipart/form-data';
      final options = Options(headers: customHeaders);
      final response = await _dio.post(endpoint, data: formData, options: options);
      log("Final FormData Response:: $response");
      return response;
    } catch (e) {
      log("Final FormData Error:: $e");
      throw ExceptionHandler.handleError(e, showSnackbar: showErrorSnackbar);
    }
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showErrorSnackbar = true,
  }) async {
    try {
      if (!_connectivityService.isConnected) {
        throw NoInternetException();
      }

      final options = Options(headers: await _buildHeaders(headers));

      final response = await _dio.get(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } catch (e) {
      throw ExceptionHandler.handleError(e, showSnackbar: showErrorSnackbar);
    }
  }

  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool showErrorSnackbar = true,
  }) async {
    try {
      if (!_connectivityService.isConnected) {
        throw NoInternetException();
      }

      final options = Options(headers: await _buildHeaders(headers));

      final response = await _dio.put(endpoint, data: body, options: options);

      return response;
    } catch (e) {
      throw ExceptionHandler.handleError(e, showSnackbar: showErrorSnackbar);
    }
  }

  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool showErrorSnackbar = true,
  }) async {
    try {
      if (!_connectivityService.isConnected) {
        throw NoInternetException();
      }

      final options = Options(headers: await _buildHeaders(headers));

      final response = await _dio.delete(
        endpoint,
        data: body,
        options: options,
      );

      return response;
    } catch (e) {
      throw ExceptionHandler.handleError(e, showSnackbar: showErrorSnackbar);
    }
  }

  Future<Map<String, dynamic>> _buildHeaders(Map<String, dynamic>? customHeaders) async {
    final headers = <String, dynamic>{};
    return headers;
  }
}

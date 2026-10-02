import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../../Utils/Snackbar/custom_snackbar.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final _connectionStatus = true.obs;

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _debounceTimer;
  Timer? _snackbarCooldownTimer;

  bool _wasDisconnected = false;
  bool _isSnackbarCooldownActive = false;

  bool get isConnected => _connectionStatus.value;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _listenToConnectivityChanges();
  }

  Future<void> _checkInitialConnection() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results);
    } catch (e) {
      _connectionStatus.value = false;
    }
  }

  void _listenToConnectivityChanges() {
    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) => _updateConnectionStatus(results),
    );
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final bool isCurrentlyConnected = results.any((result) =>
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile ||
        result == ConnectivityResult.ethernet);

    if (_connectionStatus.value == isCurrentlyConnected) return;

    _connectionStatus.value = isCurrentlyConnected;

    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 800), () {
      if (!isCurrentlyConnected) {
        _wasDisconnected = true;
        _showNoInternetSnackbar();
      } else if (_wasDisconnected) {
        _showInternetRestoredSnackbar();
        _wasDisconnected = false;
      }
    });
  }

  void _showNoInternetSnackbar() {
    if (_isSnackbarCooldownActive) return;

    _closeExistingSnackbars();

    customSnackBar(
      "No Internet Connection",
      "Please check your internet connection and try again.",
      snackBarType: SnackBarType.error,
    );

    _activateCooldown();
  }

  void _showInternetRestoredSnackbar() {
    _closeExistingSnackbars();

    customSnackBar(
      "Back Online",
      "Internet connection restored.",
      snackBarType: SnackBarType.success,
    );

    _activateCooldown();
  }

  void _activateCooldown() {
    _isSnackbarCooldownActive = true;
    _snackbarCooldownTimer?.cancel();
    _snackbarCooldownTimer = Timer(const Duration(seconds: 6), () {
      _isSnackbarCooldownActive = false;
    });
  }

  void _closeExistingSnackbars() {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
  }

  @override
  void onClose() {
    _debounceTimer?.cancel();
    _snackbarCooldownTimer?.cancel();
    _subscription?.cancel();
    super.onClose();
  }
}
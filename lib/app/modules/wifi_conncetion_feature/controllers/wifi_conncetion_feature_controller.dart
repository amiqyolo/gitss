import 'dart:developer' as developer;
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class WifiConncetionFeatureController extends GetxController {
  final RxBool _wifiSupport = false.obs;
  final RxBool _isWifiConnected = false.obs;
  final RxList<ConnectivityResult> _connectionStatus = [ConnectivityResult.none].obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  RxBool get wifiSupport => _wifiSupport;
  RxBool get isWifiConnected => _isWifiConnected;
  RxList<ConnectivityResult> get connectionStatus => _connectionStatus;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _wifiSupport.value = true;
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      _wifiSupport.value = false;
      return;
    }
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {

      _connectionStatus.value = result;
      _isWifiConnected.value = result == ConnectivityResult.wifi;
    // ignore: avoid_print
    print('Connectivity changed: $_connectionStatus');
  }

  Future<void> _checkWifiStatus() async {
    final connectivity = await Connectivity().checkConnectivity();

      _wifiSupport.value = connectivity != ConnectivityResult.none;
      _isWifiConnected.value = connectivity == ConnectivityResult.wifi;
  }

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}

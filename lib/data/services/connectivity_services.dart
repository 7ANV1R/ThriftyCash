import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivity(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return NetworkResult.on;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.none:
      default:
        return NetworkResult.off;
    }
  }
}

class NetworkChangeNotifier extends StateNotifier<NetworkResult> {
  NetworkChangeNotifier(NetworkResult state) : super(state) {
    init();
  }

  Future<void> init() async {
    final Connectivity connectivity = Connectivity();
    await checkInitialConnection(connectivity);
    subscribeToTheConnectionChange(connectivity);
  }

  Future<void> checkInitialConnection(Connectivity connectivity) async {
    var connectivityResult = await connectivity.checkConnectivity();
    state = NetworkResult.checkConnectivity(connectivityResult);
  }

  void subscribeToTheConnectionChange(Connectivity connectivity) {
    connectivity.onConnectivityChanged.listen((event) {
      NetworkResult newNetworkState = NetworkResult.checkConnectivity(event);
      if (state == NetworkResult.off && newNetworkState == NetworkResult.on) {
        // Network state changed from no internet to internet
        // Call your sync data method here
        // ezSyncAPI.syncTransactionData();
      }
      state = newNetworkState;
    });
  }
}

final networkChangeNotifierProvider = StateNotifierProvider<NetworkChangeNotifier, NetworkResult>((ref) {
  return NetworkChangeNotifier(NetworkResult.off);
});

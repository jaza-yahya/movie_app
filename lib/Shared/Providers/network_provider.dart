import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkProvider extends ChangeNotifier {
  NetworkProvider._internal();
  static final _instance = NetworkProvider._internal();
  static NetworkProvider get to => _instance;

  bool _isConnected = true;
  bool get isConnected => _isConnected;
  void setIsConnected(bool value) {
    _isConnected = value;
    notifyListeners();
  }

  Future<bool> checkInternetConnection() async {
   
bool hasInternetConnection = await InternetConnection().hasInternetAccess;
  
    setIsConnected(hasInternetConnection);
    debugPrint("hasInternetConnection: $hasInternetConnection");

    return hasInternetConnection;
  }

  Future<ConnectivityResult> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // Mobile network available.
      setIsConnected(true);
      return ConnectivityResult.mobile;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      setIsConnected(true);
      return ConnectivityResult.wifi;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      // Connected to a network which is not in the above mentioned networks.
      setIsConnected(false);
      return ConnectivityResult.other;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // No available network types
      setIsConnected(false);
      return ConnectivityResult.none;
    } else {
      setIsConnected(false);
      return ConnectivityResult.none;
    }
  }
}

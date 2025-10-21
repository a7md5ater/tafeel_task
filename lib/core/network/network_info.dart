import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> connected();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection connectionChecker;

  NetworkInfoImpl({required this.connectionChecker});
  @override
  Future<bool> connected() => connectionChecker.hasInternetAccess;
}

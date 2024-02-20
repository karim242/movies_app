import 'package:movies_app/core/network/error_mes_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerExceptions({required this.errorMessageModel});
}

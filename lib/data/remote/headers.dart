import 'package:zerno_rsue/data/local/temp_storage.dart';

class Headers {
  final Map<String, String> authPostHeader = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': TempStorage.token,
  };
  final Map<String, String> authGetHeader = {
    'accept':'text/plain',
    'Authorization': TempStorage.token,
  };
  final Map<String, String> postHeader = {
    'accept': '*/*',
    'Content-Type': 'application/json',
  };
}

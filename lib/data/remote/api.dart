import 'package:http/http.dart' as http;
import 'package:zerno_rsue/data/remote/api_strings.dart';
import 'package:zerno_rsue/data/remote/headers.dart';

class API {
  static Future<http.Response> createUser(String data) async {
    var response = await http.post(
      Uri.parse(ApiStrings.url + ApiStrings.reg),
      body: data,
      headers: Headers.postHeader,
    );
    return response;
  }

  static Future<http.Response> login(String data) async {
    var response = await http.post(
      Uri.parse(ApiStrings.url + ApiStrings.login),
      body: data,
      headers: Headers.postHeader,
    );
    return response;
  }

  static Future<http.Response> getContracts() async {
    var response = await http.get(
      Uri.parse(ApiStrings.url + ApiStrings.contracts),
      headers: Headers.authGetHeader,
    );
    return response;
  }

  static Future<http.Response> postContracts(String data) async {
    var response = await http.post(
      Uri.parse(ApiStrings.url + ApiStrings.contracts),
      body: data,
      headers: Headers.authPostHeader,
    );
    return response;
  }

  static Future<http.Response> getSellContracts() async {
    var response = await http.get(
      Uri.parse(ApiStrings.url + ApiStrings.sellContracts),
      headers: Headers.authGetHeader,
    );
    return response;
  }

  static Future<http.Response> getBuyContracts() async {
    var response = await http.get(
      Uri.parse(ApiStrings.url + ApiStrings.buyContracts),
      headers: Headers.authGetHeader,
    );
    return response;
  }

  static Future<http.Response> postDealContracts(String data) async {
    var response = await http.post(
      Uri.parse(ApiStrings.url + ApiStrings.dealContracts),
      body: data,
      headers: Headers.authPostHeader,
    );
    return response;
  }
}

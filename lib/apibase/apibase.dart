import 'dart:convert';

import 'package:bloc_first/constants.dart';
import 'package:http/http.dart' as http;

class ApiBase {
  Future<dynamic> loginuser(String key, String email, String password) async {
    final body = jsonEncode({'email': email, 'password': password});
    final response = await http.post(
        Uri.parse(''),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: body);
    var responsejson = _returnResponse(response);
    if (responsejson.toString().contains('Authorization')) {
      return responsejson;
    } else {
      print(responsejson);
    }
  }

  _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 201:
        var responsejson = jsonDecode(response.body.toString());
        return responsejson;
      case 400:
        var responseError = jsonDecode(response.body.toString());
        return responseError;

      default:
        return Exception('default error ${response.statusCode.toString()}');
    }
  }
}

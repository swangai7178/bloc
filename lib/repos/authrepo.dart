import 'package:bloc_first/apibase/apibase.dart';

class Authrepo {
  final String apikey = "";
  final ApiBase apibase = ApiBase();

  Future<dynamic> login(String email, String password) async {
    final response = await apibase.loginuser(apikey, email, password);

    return response;
  }
}

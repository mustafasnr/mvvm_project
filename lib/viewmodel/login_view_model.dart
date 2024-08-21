import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  String _token = "";
  String baseUri = "https://reqres.in/api";
  TextEditingController emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "cityslicka");
  String get token => _token;
  Future<bool> login() async {
    var result = await http.post(
      Uri.parse(baseUri + "/login"),
      body: {
        "email": emailController.text,
        "password": passwordController.text
      },
    );
    if (result.statusCode == 200) {
      debugPrint("Gelen değer: ${result.body}");
      _token = result.body;
      notifyListeners();
      return true;
    }
    return false;
  }

  void clearToken() {
    _token = "";
    notifyListeners();
  }
}

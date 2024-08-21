import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mvvm_project/model/user_model.dart';
import 'package:http/http.dart' as http;

class AnasayfaViewModel extends ChangeNotifier {
  List<User> _users = [];
  String baseUri = "https://reqres.in/api";
  List<User> get users => _users;
  Future<void> fetchUsers() async {
    debugPrint("Tıklandı aga");
    _users = [];
    notifyListeners();
    var response = await http.get(
      Uri.parse(baseUri + "/users?page=2"),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      var tempList = jsonData["data"];
      for (var user in tempList) {
        _users.add(User.fromJson(user));
      }
      notifyListeners();
    }
  }
}

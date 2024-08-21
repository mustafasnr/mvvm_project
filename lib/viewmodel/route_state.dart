import 'package:flutter/material.dart';

class RouteState extends ChangeNotifier {
  String _currentRoute = "/";
  String get route => _currentRoute;

  void setRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }
}

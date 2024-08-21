import 'package:flutter/material.dart';
import 'package:mvvm_project/view/loader.dart';
import 'package:mvvm_project/viewmodel/route_state.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_project/view/home.dart';
import 'package:mvvm_project/view/login_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    var route = context.watch<RouteState>().route;
    Map<String, Widget> widgetMap = {
      '/': LoginPage(),
      '/loader': Loader(),
      '/anasayfa': Home(),
    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetMap[route] ??
          Center(
            child: Text(
              "Böyle bir sayfa yok, $route",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
    );
  }
}

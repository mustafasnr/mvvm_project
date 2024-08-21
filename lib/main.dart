import 'package:flutter/material.dart';
import 'package:mvvm_project/view/application.dart';
import 'package:mvvm_project/viewmodel/anasayfa_view_model.dart';
import 'package:mvvm_project/viewmodel/login_view_model.dart';
import 'package:mvvm_project/viewmodel/route_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RouteState()),
        ChangeNotifierProvider(create: (context) => AnasayfaViewModel())
      ],
      child: MaterialApp(
        home: Application(),
      )));
}

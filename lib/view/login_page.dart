import 'package:flutter/material.dart';
import 'package:mvvm_project/viewmodel/login_view_model.dart';
import 'package:mvvm_project/viewmodel/route_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginViewModel, RouteState>(
      builder: (context, lvm, rs, child) => Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 50,
                child: TextFormField(
                  controller: lvm.emailController,
                  decoration: InputDecoration(
                    hintText: "email",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                height: 50,
                child: TextFormField(
                  controller: lvm.passwordController,
                  decoration: InputDecoration(
                    hintText: "sifre",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  rs.setRoute("/loader");
                  var result = await lvm.login();
                  result ? rs.setRoute("/anasayfa") : rs.setRoute("/none");
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text("Giriş Yap"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

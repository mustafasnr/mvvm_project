import 'package:flutter/material.dart';
import 'package:mvvm_project/viewmodel/anasayfa_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userList = context.watch<AnasayfaViewModel>().users;
    return SafeArea(
      child: Expanded(
          child: Container(
        width: double.infinity,
        color: Colors.black12,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.read<AnasayfaViewModel>().fetchUsers();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Text("Verileri Çek"),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  userList.length,
                  (index) => ListTile(
                    title: Text(
                        "${userList[index].firstName} ${userList[index].lastName}"),
                    subtitle: Text(userList[index].email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userList[index].avatar),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

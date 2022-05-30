import 'package:flutter/material.dart';
import 'package:tugas_modul_5/helper/shared_preference.dart';
import 'package:tugas_modul_5/view/login_page.dart';

import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.black,
      ),

      body: const LoginPage(),
    );
  }

}
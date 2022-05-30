import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_modul_5/helper/shared_preference.dart';
import 'package:tugas_modul_5/model/data_model.dart';
import 'package:tugas_modul_5/view/dashboard.dart';
import 'package:tugas_modul_5/view/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(
        MaterialApp(
            debugShowCheckedModeBanner: false,
            home: status ? Dashboard() : HomePage()
        )
    );
  });
  // runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}
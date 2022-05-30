import 'package:flutter/material.dart';
import 'package:tugas_modul_5/helper/shared_preference.dart';
import 'package:tugas_modul_5/view/dashboard.dart';
import 'package:tugas_modul_5/view/homepage.dart';
import 'package:tugas_modul_5/view/profile_page.dart';
import 'package:tugas_modul_5/view/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  final screens = [
    Dashboard(),
    SearchPage(),
    Center(child: Text('LOVE'),),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              SharedPreference().setLogout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index) ,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined, color: Colors.blueAccent),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search_rounded, color: Colors.deepPurpleAccent),
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              label: 'Fav', icon: Icon(Icons.favorite_outlined, color: Colors.deepOrange),
              backgroundColor: Colors.transparent
          ),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person_outlined, color: Colors.greenAccent),
              backgroundColor: Colors.black
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tugas_modul_5/helper/shared_preference.dart';
import 'package:tugas_modul_5/view/homepage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: SharedPreference().getUsername(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text("HI, ${snapshot.data}", style: TextStyle(fontSize: 24, color: Colors.white),);
                },
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Text("WELCOME TO GIPHY", style: TextStyle(fontSize: 24, color: Colors.white),),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: ElevatedButton(
                  child: Text('Logout', style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    SharedPreference().setLogout();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    primary: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tugas_modul_5/helper/hive_database.dart';
import 'package:tugas_modul_5/view/mainpage.dart';
import 'package:tugas_modul_5/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if(form != null){
      if (form.validate()) {
        print('Form is valid');
      } else {
        print('Form is invalid');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset('assets/images/icon.png'),
              ),
              const Text('GIPHY',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.0,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Username",
                  ),
                  validator: (value) => value!.isEmpty ? 'Username cannot be blank':null,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Password",
                  ),
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? 'Password cannot be blank' : null,
                ),
              ),
              _buildLoginButton(),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 300,
      child: ElevatedButton(
        child: Text(labelButton, style: TextStyle(color: Colors.black),),
        onPressed: () {
          submitCallback(labelButton);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        primary: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return _commonSubmitButton(
      labelButton: "Login",
      submitCallback: (value) {
        validateAndSave();
        String currentUsername = _usernameController.value.text;
        String currentPassword = _passwordController.value.text;

        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;

    found = _hive.checkLogin(username, password);

    if(!found) print("Login Failed");
    else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }
  }

  Widget _buildRegisterButton() {
    return Container(
      child: Row(
        children: [
          Text('Does not have account?', style: TextStyle(color: Colors.grey),),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            child: Text(
              'Sign Up', style: TextStyle(fontSize: 14),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              );
            },
          )
        ],
    mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
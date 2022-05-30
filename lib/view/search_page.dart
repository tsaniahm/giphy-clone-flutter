import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController _searchKeyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: _searchKeyController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Search Here",
                    ),
                    validator: (value) => value!.isEmpty ? 'Search Field cannot be blank':null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

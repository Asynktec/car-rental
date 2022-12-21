import 'dart:convert';

import 'package:flutter/material.dart';

import "package:http/http.dart" as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: ElevatedButton(
              onPressed: () {
                getData();
              },
              child: Text("getr data"))),
    );
  }

  Future getData() async {
    String key = "basededatos";
    String fileName = "getAll.php";
    String url = "http://" + key + ".ceandb.com/" + fileName;
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    print("The data ${data.toString()}");
  }
}

/* 
$username = "icuudqqc_user_t";
$password = "Kevito123456";
$database = "icuudqqc_zeus";
$mysqli = new mysqli("localhost", $username, $password, $database);
*/
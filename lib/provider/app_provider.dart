import 'dart:convert';
import 'package:campusbuddy/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:campusbuddy/constants.dart';

const String url = "http://localhost:3000/registration";

class AppProvider {


  //registration of the users ........
  static void registerUser(
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController prn,
      TextEditingController department,
      TextEditingController yearofstudy,
      bool _isnotValide,
      BuildContext context) async {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      var regbody = {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "prn": prn.text,
        "department": department.text,
        "yearofstudy": yearofstudy.text,
      };

      var responce = await http.post(
        Uri.parse(registration_post),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regbody),
      );

      var jsonResponce = json.decode(responce.body);

      if (jsonResponce['status']) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print("something went wrong!");
      }

      print(responce);
    } else {
      _isnotValide = true;
    }
  }









  // login of user ............

  static void loginUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      var response = await http.post(Uri.parse(registration_post),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = json.decode(response.body);

      if(jsonResponse['status']) {
           var myToken = jsonResponse['token'];
           
      }
    }
  }



}

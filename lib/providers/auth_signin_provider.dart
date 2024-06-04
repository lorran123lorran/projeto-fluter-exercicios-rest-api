import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../routes.dart';

class AuthSigninProvider extends ChangeNotifier {
  String? messagesignin;
  String? token;

  final firebaseAuth = FirebaseAuth.instance;

  final _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=';
  final _apiKey = "AIzaSyD3b7f_1cyxv4bEW96dNeFWJMhKh0mqPiw";

  Future<bool> signIn(String email, String password) async {
    String sUri = '$_url$_apiKey';
    Uri uri = Uri.parse(sUri);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'retornarSecureToken': 'true'
    });
    var resp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Login efetuado com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    // Navigator.pushNamed(context, Routes.CATALOG)
      // messagesignin = "Usuário Logado com Sucesso!";
      token = resp["idToken"];
      return true;
    } else {
      messagesignin = "Usuário Logado";
      return false;
    }
  }

  Future<bool> SignIn(String email, String password) async {
    try {
      UserCredential userCredential =
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      token = userCredential.credential?.token.toString();
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AuthSignupProvider extends ChangeNotifier {
  String? messagesignup;
  String? token;

  final firebaseAuth = FirebaseAuth.instance;

  final _url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=';
  final _apiKey = "AIzaSyD3b7f_1cyxv4bEW96dNeFWJMhKh0mqPiw";

  Future<bool> signUp(String email, String password) async {
    String sUri = '$_url$_apiKey';
    Uri uri = Uri.parse(sUri);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'retornarSecureToken': 'true'
    });
    var resp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      messagesignup = "aaaaaaa!";
      token = resp["idToken"];
      return true;
    } else {
      messagesignup = "Usuário já Existente";
      return false;
    }
  }

  Future<bool> SignUp(String email, String password) async {
   try {
     UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     token = userCredential.credential?.token.toString();
     Fluttertoast.showToast(
         msg: "Usuário cadastrado com sucesso!",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.blueAccent,
         textColor: Colors.white,
         fontSize: 16.0);
     return true;
   } on FirebaseAuthException catch (e) {
     Fluttertoast.showToast(
         msg: "Erro ao cadastrar usuário",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.blueAccent,
         textColor: Colors.white,
         fontSize: 16.0);
     return false;
   }
    // return SignUp(email, password);
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthSignupProvider extends ChangeNotifier {
  String? messagesignup;
  String? token;
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
      messagesignup = "Usuário Cadastrado com Sucesso!";
      token = resp["idToken"];
      return true;
    } else {
      messagesignup = "Usuário já Existente";
      return false;
    }
  }

  Future<bool> SignUp(String email, String password) async {
    return SignUp(email, password);
  }
}

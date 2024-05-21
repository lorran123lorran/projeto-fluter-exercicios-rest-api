import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthSigninProvider extends ChangeNotifier {
  String? messagesignin;
  String? token;
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
      messagesignin = "Usuário Logado com Sucesso!";
      token = resp["idToken"];
      return true;
    } else {
      messagesignin = "Usuário Logado";
      return false;
    }
  }

  Future<bool> SignIn(String email, String password) async {
    return SignIn(email, password);
  }
}

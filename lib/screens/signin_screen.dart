import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_signin_provider.dart';
import '../routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthSigninProvider authSigninProvider = context.watch<AuthSigninProvider>();
    String? messagesignin = authSigninProvider.messagesignin;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text("Tela de Login"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      label: Text("e-mail"),
                      labelStyle: TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      label: Text("Senha"),
                      labelStyle: TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      String email = emailController.text;
                      String password = passwordController.text;
                      authSigninProvider.signIn(email, password).then(
                            (response) => {
                              if (response)
                                {
                                  Fluttertoast.showToast(
                                      msg: "Login efetuado com sucesso!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.blueAccent,
                                      textColor: Colors.white,
                                      fontSize: 16.0),
                                  Navigator.pushNamed(context, Routes.SERIEA)
                                }
                              else
                                {
                                  Fluttertoast.showToast(
                                      msg: "Erro ao se logar, tente novamente!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0),
                                }
                            },
                          );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 22, color: Colors.indigoAccent),
                    ),
                  ),
                ),
              ),
              if (messagesignin != null) Text(messagesignin),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.SIGNUP);
                },
                child: const Text(
                  "Ainda não tem cadastro?",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projetoacademia/providers/auth_signup_provider.dart';
import 'package:projetoacademia/routes.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthSignupProvider authSignupProvider = context.watch<AuthSignupProvider>();
    String? message = authSignupProvider.messagesignup;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text("Faça seu Cadastro"),
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
                    textAlign: TextAlign.center,
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
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
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
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
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
                      authSignupProvider.signUp(email, password).then(
                        (sucesso) {
                          if (sucesso) {
                            Fluttertoast.showToast(
                                msg: "Cadastro efetuado com sucesso!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueAccent,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            Navigator.pushReplacementNamed(
                                context, Routes.SERIEA);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Cadastro Existente",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        },
                      );
                    },
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 22, color: Colors.indigoAccent),
                    ),
                  ),
                ),
              ),
              if (message != null) Text(message),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.SIGNIN);
                },
                child: const Text(
                  "Ja tenho cadastro",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

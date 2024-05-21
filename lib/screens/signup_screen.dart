import 'package:flutter/material.dart';
import 'package:projetoacademia/providers/auth_signup_provider.dart';
import 'package:projetoacademia/routes.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            textAlign: TextAlign.center,
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Informe seu e-mail",
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: "Crie uma Senha",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              String password = passwordController.text;
              authSignupProvider.signUp(email, password).then(
                (sucesso) {
                  if (sucesso) {
                    Navigator.pushReplacementNamed(context, Routes.SERIEA);
                  } else {
                    //Mensegem de erro
                  }
                },
              );
            },
            child: const Text('Cadastrar'),
          ),
          if (message != null) Text(message)
        ],
      ),
    );
  }
}

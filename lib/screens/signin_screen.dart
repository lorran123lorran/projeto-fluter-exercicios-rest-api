import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_signin_provider.dart';
import '../routes.dart';

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
              hintText: "Digite sua Senha",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              String password = passwordController.text;
              authSigninProvider.signIn(email, password).then((response) =>
                  {if (response) Navigator.pushNamed(context, Routes.SERIEA)});
            },
            child: const Text('Login'),
          ),
          if (messagesignin != null) Text(messagesignin),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.SIGNUP);
            },
            child: const Text("Ainda não tem Cadastro?"),
          ),
        ],
      ),
    );
  }
}

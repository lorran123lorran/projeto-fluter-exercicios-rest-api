import 'package:projetoacademia/providers/auth_signin_provider.dart';
import 'package:projetoacademia/providers/auth_signup_provider.dart';
import 'package:projetoacademia/providers/exerc_provider.dart';
import 'package:projetoacademia/routes.dart';
import 'package:projetoacademia/screens/catalog_screen.dart';
import 'package:projetoacademia/screens/details_screen.dart';
import 'package:projetoacademia/screens/form_screen.dart';
import 'package:projetoacademia/screens/form_screen_edit.dart';
import 'package:projetoacademia/screens/serie_a.dart';
import 'package:projetoacademia/screens/signin_screen.dart';
import 'package:projetoacademia/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'componentes/exercicio_lista.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ExercProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthSignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthSigninProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Gerenciamento de Exercícios',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        routes: {
          '/': (context) => SignInScreen(),
          Routes.SIGNIN: (context) => SignInScreen(),
          Routes.CATALOG: (context) => const CatalogScreen(),
          Routes.SIGNUP: (context) => SignUpScreen(),
          Routes.SERIEA: (context) => const SerieA(),
          Routes.FORM: (context) => const FormScreen(),
          Routes.DETAILS: (context) => const DetailsScreen(),
          Routes.EXERC_LISTA: (context) => const ExercicioLista(),
          Routes.EDITAR: (context) => const FormScreenEdit(),
        },
      ),
    );
  }
}

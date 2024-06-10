import 'package:flutter/material.dart';
import 'package:projetoacademia/routes.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: Colors.indigo,
      
      body:
      Center(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.SERIEA);
                        },
                        child: Container(
                          width: size.width * 0.6,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "ACADEMIA",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Image.asset(
                                  "assets/exercicios.png",
                                  width: 170,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.SERIEA);
                        },
                        child: Container(
                          width: size.width * 0.6,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "ANOTAÇÕES",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Image.asset(
                                  "assets/anotacoes.png",
                                  width: 63,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.SERIEA);
                        },
                        child: Container(
                          width: size.width * 0.6,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  "TEMPO",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.asset(
                                  "assets/clima.png",
                                  width: 75,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

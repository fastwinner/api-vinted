import 'package:flutter/material.dart';
import 'CreationCompte.dart';

class Inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  /*
                  Icon(
                    Icons.clear, // Utilisation de l'icône de croix (X)
                    size: 30, // Taille de l'icône
                    color: Colors.black, // Couleur de l'icône
                  ),
                  */
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(color: Colors.black, width: 2.0)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/facebook.png', // Chemin de l'image
                          width: 50, // Largeur de l'image
                          height: 50, // Hauteur de l'image
                        ),
                        SizedBox(
                            width: 8), // Espacement entre l'image et le texte
                        Text(
                          "Continuez avec Facebook",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(color: Colors.black, width: 2.0)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/google.png', // Chemin de l'image
                          width: 24, // Largeur de l'image
                          height: 24, // Hauteur de l'image
                        ),
                        SizedBox(
                            width: 8), // Espacement entre l'image et le texte
                        Text(
                          "Continuez avec Google",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(color: Colors.black, width: 2.0)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/apple.png', // Chemin de l'image
                          width: 50, // Largeur de l'image
                          height: 50, // Hauteur de l'image
                        ),
                        SizedBox(
                            width: 8), // Espacement entre l'image et le texte
                        Text(
                          "Continuez avec Apple",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ou continue avec"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Creation()));
                    },
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.zero, // Supprime le padding par défaut
                      minimumSize:
                          Size(0, 0), // Supprime la taille minimale par défaut
                    ),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.teal, // Couleur du texte cliquable
                        decoration: TextDecoration
                            .underline, // Soulignement du texte cliquable
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tu es une entreprise ?"),
                  Text(
                    "En savoir plus",
                    style: TextStyle(
                      color: Colors.teal,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

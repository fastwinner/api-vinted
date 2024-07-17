import 'package:flutter/material.dart';
import '../home_page.dart';
import '../consomation/consomation.dart';

class ConnexionCompte extends StatefulWidget {
  @override
  _ConnexionCompteState createState() => _ConnexionCompteState();
}

class _ConnexionCompteState extends State<ConnexionCompte> {
  bool _secureText = true;
  bool _userExists = false;
  bool _isLoading = false;
  int user_id = 0;

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void _checkUser() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() {
        _isLoading = true;
      });

      try {
        user_id = await AuthService.checkUserExists(
            userNameController.text, passwordController.text);
        setState(() {
          if (user_id == 0)
            _userExists = false;
          else
            _userExists = true;
          _isLoading = false;
        });
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        // Gérez l'erreur comme requis
      }
      if (_userExists == true && _isLoading == false) {
        _userExists = false;
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => MyHomePage(user_id: user_id)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Email ou mot de passe incorrect',
                style: TextStyle(color: Colors.white),
              )),
        );
        FocusScope.of(context).requestFocus(FocusNode());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();

    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      cursorColor: Colors.teal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Le champ ne peut pas être vide';
                        }
                      },
                      controller: userNameController,
                    ),
                    TextFormField(
                      obscureText: _secureText,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_secureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        ),
                      ),
                      cursorColor: Colors.teal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Le champ ne peut pas être vide';
                        }
                      },
                      controller: passwordController,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: _checkUser,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                          child: Text(
                            'Se connecter',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.zero, // Supprime le padding par défaut
                        minimumSize: Size(
                            0, 0), // Supprime la taille minimale par défaut
                      ),
                      child: const Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          color: Colors.teal, // Couleur du texte cliquable
                          decoration: TextDecoration
                              .underline, // Soulignement du texte cliquable
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Text(
                "Un problème ?",
                style: TextStyle(
                  color: Colors.teal, // Couleur du texte cliquable
                  decoration: TextDecoration
                      .underline, // Soulignement du texte cliquable
                ),
              ),
            ],
          )),
    );
  }
}

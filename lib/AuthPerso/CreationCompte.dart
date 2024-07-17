import 'package:flutter/material.dart';
import '../home_page.dart';
import '../consomation/consomation.dart';

class Creation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreationCompte();
  }
}

class CreationCompte extends StatefulWidget {
  @override
  _CreationCompteState createState() => _CreationCompteState();
}

class _CreationCompteState extends State<CreationCompte> {
  bool _secureText = true;
  bool _isChecked = false;
  bool _isCondition = false;
  bool _isLoading = false;
  bool _isCheckboxErrorVisible = false;
  bool _isCheckboxErrorVisible2 = false;

  final _formKey = GlobalKey<FormState>();

  final newUserNameController = TextEditingController();
  final newEmailController = TextEditingController();
  final newPasswordController = TextEditingController();

  void _createUser() async {
    if(!_isChecked){
      setState(() {
        _isCheckboxErrorVisible = true;
      });
    }
    else {
      setState(() {
      _isCheckboxErrorVisible = false;
    });
    }
    if(!_isCondition){
      setState(() {
        _isCheckboxErrorVisible2 = true;
      });
    }
    else{
      setState(() {
      _isCheckboxErrorVisible2 = false;
    });
    }
    if (_formKey.currentState!.validate() && _isCondition && _isChecked) {
      FocusScope.of(context).requestFocus(FocusNode());

      setState(() {
        _isLoading = true;
      });

      try {
        await AuthService.createUser(newUserNameController.text,
            newEmailController.text, newPasswordController.text);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        print('Error checking user: $error');
        setState(() {
          _isLoading = false;
        });
        // Gérez l'erreur comme requis
      }
      if (_isLoading == false) {
        Navigator.push(context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => MyHomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Une erreur est survenue, veuillez réessayer !',
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
    newUserNameController.dispose();
    newPasswordController.dispose();
    newEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S\'inscrire'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                        labelText: "Nom d'utilisateur",
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
                      controller: newUserNameController,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Adresse email",
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
                      controller: newEmailController,
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
                      controller: newPasswordController,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.teal,
                          focusColor: Colors.teal,
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                        Text(
                          "Je souhaite recevoir par e-mail des offres \n personnalisées et les dernières mises à jour de\n vinted.",
                        )
                      ],
                    ),
                    if (_isCheckboxErrorVisible)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Cette case est obligatoire !',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.teal,
                          focusColor: Colors.teal,
                          value: _isCondition,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCondition = value ?? false;
                            });
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                'En t\'inscrivant, tu confirmes que tu acceptes les ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\nTermes & Conditions de Vinted,',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.teal,
                                ),
                              ),
                              TextSpan(
                                text: ' avoir lu la',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '\nPolitique de confidentialité',
                                style: TextStyle(
                                  color: Colors.teal,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: ' et avoir au moins\n 18 ans.')
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (_isCheckboxErrorVisible2)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Cette case est obligatoire !',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: _createUser,
                          /**
                          () 
                          {
                            if(!_isChecked){
                              setState(() {
                                _isCheckboxErrorVisible = true;
                              });
                            }
                            else {
                              setState(() {
                              _isCheckboxErrorVisible = false;
                            });
                            }
                            if(!_isCondition){
                              setState(() {
                                _isCheckboxErrorVisible2 = true;
                              });
                            }
                            else{
                              setState(() {
                              _isCheckboxErrorVisible2 = false;
                            });
                            }
                              
                             * 
                            if (_formKey.currentState!.validate() && _isCondition && _isChecked ) {
                              // Si le formulaire est valide, affiche une snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Creation du compte...')),
                              );
                              FocusScope.of(context)
                                  .requestFocus(FocusNode());
                              Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) => MyHomePage()));
                              }
                            },
                             */
                            
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
                            'S\'inscrire',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Supprime le padding par défaut
                  minimumSize:
                      Size(0, 0), // Supprime la taille minimale par défaut
                ),
                child: Text(
                  "Un problème ?",
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
      ),
    );
  }
}

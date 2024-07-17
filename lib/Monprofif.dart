import 'package:flutter/material.dart';
import 'consomation/consomation.dart';
import 'Model/userModel.dart';


class TestUser extends StatelessWidget {

  var instance = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Authentifier l'utilisateur
              await AuthService.checkUserExists('test@example.com', 'password123');

              // Récupérer les informations de l'utilisateur connecté
              User user = await AuthService.getConnectedUser();
              print('Connected user: ${user.name}');
            } catch (error) {
              print('Error: $error');
            }
          },
          child: Text('Get User Info'),
        ),
      ),
    );
  }
}

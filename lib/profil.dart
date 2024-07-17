import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Action to go back
          },
        ),
        title: Text('Paramètres'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Mon profil'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to profile settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('Paramètres du compte'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to account settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('Paiements'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to payment settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('Envoi'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to shipping settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sécurité'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to security settings
            },
          ),
          //Divider(),
          Container(
            color: Colors.grey[200],
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 25),
            child: Text(
              "Noctifications",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            title: Text('Notifications Push'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to push notifications settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notifications e-mail'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to email notifications settings
            },
          ),
          Container(
            color: Colors.grey[200],
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 25),
            child: Text(
              "Langue de l'appli",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            title: Text('Langue'),
            subtitle: Text('French (FR)'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,),
            onTap: () {
              // Action to navigate to language settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('Mode sombre'),
            subtitle: Text('Désactivé'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action to navigate to dark mode settings
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

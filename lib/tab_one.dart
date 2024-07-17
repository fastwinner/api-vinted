import 'package:flutter/material.dart';

class TabOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Hides the AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                hintText: 'Rechercher un article ou un membre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.woman,
                    color: Colors.teal,),
                  title: Text(
                    'Femmes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    ),

                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.man),
                  title: Text('Hommes'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.child_care),
                  title: Text('Enfants'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Maison'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Divertissement'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.pets),
                  title: Text('Animaux'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

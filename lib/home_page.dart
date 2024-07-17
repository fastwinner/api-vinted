import 'package:flutter/material.dart';
import 'tab_one.dart';
import 'tab_two.dart';
import 'profil.dart';
import 'message.dart';
import 'articles/items.dart';

class MyHomePage extends StatefulWidget {
  final int? user_id;

  MyHomePage({this.user_id});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<Widget> _pages = [
      HomePageContent(),
      TabOnePage(),
      TabTwoPage(user_id:widget.user_id),
      messagePage(),
      profilPage(),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Vendre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher un article ou un membre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.teal,
          indicatorColor: Colors.teal,
          controller: _tabController,
          tabs: [
            Tab(text: 'Accueil'),
            Tab(text: 'Articles de créateurs'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              HomePage(),
              Container(child: ArticlesPage()),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListView(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Exemple de données que vous pourriez vouloir gérer dynamiquement
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.teal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Façonne Vinted à ton image !',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Trouve les articles qui te correspondent le mieux. '
                      'Ajoute ta taille et ta pointure, ainsi que tes marques préférées.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      width: 1000,
                      child: ElevatedButton(
                        onPressed: () {
                          // Gérer l'action du bouton personnalisé ici
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                        child: Text(
                          'Personnaliser',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/accueil.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.verified, color: Colors.teal),
                        SizedBox(width: 8.0),
                        Text(
                          'Vérification de l\'article',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text("Achète des pièces vérifiées \n par nos experts"),
                    SizedBox(height: 30.0),
                    Container(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          // Gérer l'action du bouton "Explorez les articles des créateurs" ici
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                        child: Text(
                          'Explorez les articles des créateurs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
        /*
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Fil d\'actu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        */
      ],
    );
  }
}

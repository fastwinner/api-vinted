import 'package:flutter/material.dart';
import 'package:vinted/Model/userModel.dart';
import 'package:vinted/articles/achatArticle.dart';
import '../Model/Article.dart';
import '../consomation/consomation.dart';


class ArticleDetailPage extends StatefulWidget {
  final Article article;

  ArticleDetailPage({required this.article});

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  // Exemple d'état pour une offre
  bool isOffering = false;
  late Future<User> user;

  void initState() {
    super.initState();
    var instance = AuthService(); // Créer une instance
    //user = instance.getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du produit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              child: Image.asset(
                widget.article.photo,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/user.jpg',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "tiekford",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                            Text(
                              '(1898)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Actions à effectuer lors du clic sur le bouton "Message"
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.teal),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      "Message",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article.titre,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.article.taille}',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.article.etat}',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.article.marque}',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.teal,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.article.prix.toStringAsFixed(2)} €',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.article.prix + 20} € Inclut la protection des acheteurs ',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                      ),
                      Icon(
                        Icons.security,
                        color: Colors.teal,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 30,
                color: Colors.grey[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description de l'article",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(widget.article.description),
                ],
              ),
            ),

            // Exemple d'affichage conditionnel basé sur l'état (offre en cours)
            /*
            if (isOffering)
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Widget d\'offre en cours ici...',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              */
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 175,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isOffering = true;
                  });
                  // Actions à effectuer lors du clic sur le bouton "Faire une offre"
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.teal),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  "Faire une offre",
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 175,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              achatArticle(article: widget.article)));

                  // Actions à effectuer lors du clic sur le bouton "Acheter"
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.teal),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
                child: Text(
                  "Acheter",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

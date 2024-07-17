import 'package:flutter/material.dart';
import '../consomation/consomation.dart';
import '../Model/Article.dart';
import '../articles/detail.dart';

void main() {
  runApp(filactu());
}

class filactu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArticlesPage(),
    );
  }
}

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    var instance = AuthService(); // Créer une instance
    futureArticles = instance.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No articles found'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final article = snapshot.data![index];
              return ArticleCard(article: article);
            },

          );
        }
      },
    );
  }
}

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child:ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                        ArticleDetailPage(article: article)));
          },
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    article
                        .photo, // Remplacez par le chemin de votre image locale
                    //fit: BoxFit.cover,
                    width: 200,
                    height: 100,
                  ),
                  //SizedBox(height: 8.0),
                  Text(
                    article.titre,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '${article.taille}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${article.prix.toStringAsFixed(2)} €',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        '${article.prix + 20} € Incl ',
                        style: TextStyle(color: Colors.teal),
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
            ],
          ),
        ),
    );
  }
}

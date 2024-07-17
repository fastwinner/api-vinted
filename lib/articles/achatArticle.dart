import 'package:flutter/material.dart';
import '../Model/Article.dart';
import '../consomation/consomation.dart';
import '../home_page.dart';

class achatArticle extends StatefulWidget {
  final Article article;

  achatArticle({required this.article});

  @override
  _achatArticleState createState() => _achatArticleState();
}

class _achatArticleState extends State<achatArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paiement"),
      ),
      body: ListView(
        children: [
          Image.asset(
            widget.article.photo,
            width: 100,
            height: 100,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Commande",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      '${widget.article.prix} €',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Frais de protection acheteurs",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.info_outline,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                    Text(
                      '20 €',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Envoi",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      '5 €',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '${widget.article.prix + 25} €',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                Text(
                  "Ce paiement est crypté et sécurisé",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AuthService.deleteArticle(widget.article.id);
                  print("article achete");
                  Navigator.push(context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => MyHomePage()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "article Acheté avec succes",
                            style: TextStyle(color: Colors.white),
                          )),
                    );
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
                  "Payer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

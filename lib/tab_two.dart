import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'consomation/consomation.dart';
import 'dart:io';
import 'home_page.dart';

class TabTwoPage extends StatefulWidget {
  final int? user_id;

  TabTwoPage({this.user_id});

  @override
  _TabTwoPageState createState() => _TabTwoPageState();
}

class _TabTwoPageState extends State<TabTwoPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _etatController = TextEditingController();
  TextEditingController _categorieController = TextEditingController();
  TextEditingController _marqueController = TextEditingController();
  TextEditingController _tailleController = TextEditingController();

  bool _isSuccess = false;

  List<XFile> _imageFiles =
      []; // Liste pour stocker les fichiers d'images sélectionnés

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        _imageFiles.addAll(pickedImages);
      });
    }
  }
  // Fonction pour sélectionner des images à partir de la galerie

  void _createArticle() async {
    if (_formKey.currentState!.validate()) {
      _isSuccess = await AuthService.addArticleWithPhoto(
          _titleController.text,
          _descriptionController.text,
          _etatController.text,
          _prixController.text,
          _categorieController.text,
          _tailleController.text,
          _marqueController.text,
          widget.user_id ?? 1,
          _imageFiles.first);

      if (_isSuccess) {
        Navigator.push(context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => MyHomePage()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "article ajouté avec succes",
                style: TextStyle(color: Colors.white),
              )),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Echec de l'ajout de l'article",
                style: TextStyle(color: Colors.white),
              )),
        );
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // Action to close the page
          },
        ),
        title: Text('Vends un article'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Jusqu\'à 20 photos.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Action to view tips
                        },
                        child: Text(
                          'Voir astuces',
                          style: TextStyle(
                            color: Colors.teal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _pickImages,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.teal, width: 2),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                  ),
                  label: Text(
                    'Ajouter photos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Colors.teal,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: _imageFiles.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Image.file(
                          File(_imageFiles[index].path),
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                _imageFiles.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            /*
            if (_isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Ajoutez Au moins une photo !',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              */
            SizedBox(height: 50),
            Container(
              color: Colors.grey[200],
              height: 30,
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ ne peut pas être vide';
                }
              },
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Titre',
                hintText: 'ex : Chemise Sézane verte',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ ne peut pas être vide';
                }
              },
              controller: _prixController,
              decoration: InputDecoration(
                labelText: 'Prix',
                hintText: 'ex : 300 €',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ ne peut pas être vide';
                }
              },
              controller: _etatController,
              decoration: InputDecoration(
                labelText: 'Etat',
                hintText: 'ex : Neuf ou Occasion',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ ne peut pas être vide';
                }
              },
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Décris ton article',
                hintText: 'ex : porté quelques fois, taille correctement',
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ ne peut pas être vide';
                }
              },
              controller: _categorieController,
              decoration: InputDecoration(
                labelText: 'Categorie',
                hintText: 'ex : Femme',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ ne peut pas être vide';
                }
              },
              controller: _tailleController,
              decoration: InputDecoration(
                labelText: 'Taille',
                hintText: 'ex : XXL',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ ne peut pas être vide';
                }
              },
              controller: _marqueController,
              decoration: InputDecoration(
                labelText: 'marque',
                hintText: 'ex : Gucci',
              ),
            ),
            SizedBox(height: 16),
            Container(
              color: Colors.grey[200],
              height: 20,
            ),
            SizedBox(height: 16),

            /*
           
            ),
            Divider(),
            ListTile(
              title: Text('Marque'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Action to select brand
              },
            ),
            Divider(),
            ListTile(
              title: Text('État'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Action to select state
              },
            ),
            Divider(),
            ListTile(
              title: Text('Prix sans les frais de port'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Action to set price
              },
            ),
            Divider(),
            */
            Container(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _createArticle,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                  child: Text(
                    'Ajouter',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

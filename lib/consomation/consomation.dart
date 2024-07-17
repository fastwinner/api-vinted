import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:vinted/Model/Article.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/userModel.dart';

class AuthService {
  static const String baseUrl =
      'http://192.168.252.168:8000/api'; // Remplacez par votre URL d'API Laravel

  static Future<int> checkUserExists(String email, String password) async {
    try {
      var url = Uri.parse('$baseUrl/login');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        int id = data['id'];
        return id;
      } else {
        throw Exception('Failed to check user existence');
      }
    } catch (error) {
      print('Error checking user existence: $error');
      throw error;
    }
  }

  static Future<User> getConnectedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    if (token == null) {
      throw Exception('No token found');
    }

    try {
      var url = Uri.parse('$baseUrl/user');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        User user = User.fromJson(data);
        return user;
      } else {
        throw Exception('Failed to get user');
      }
    } catch (error) {
      print('Error getting user: $error');
      throw error;
    }
  }

  static Future<bool> createUser(
      String userName, String email, String password) async {
    try {
      var url = Uri.parse('$baseUrl/register');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
            {'name': userName, 'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        //var data = jsonDecode(response.body);
        return true;
      } else {
        throw Exception('Failed to create user');
      }
    } catch (error) {
      print('Error creating user: $error');
      throw error;
    }
  }

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/articles'));

    if (response.statusCode == 200) {
      List<dynamic> articlesJson = jsonDecode(response.body);
      List<Article> articles =
          articlesJson.map((json) => Article.fromJson(json)).toList();
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }

  static Future<bool> addArticleWithPhoto(
      String title,
      String description,
      String etat,
      String prix,
      String categorie,
      String taille,
      String marque,
      int user_id,
      XFile imageFile) async {
    try {
      var url = Uri.parse('$baseUrl/articles');

      var request = http.MultipartRequest('POST', url);

      // Ajout des champs de formulaire (titre, description)
      request.fields['titre'] = title;
      request.fields['description'] = description;
      request.fields['prix'] = prix;
      request.fields['taille'] = taille;
      request.fields['marque'] = marque;
      request.fields['categorie'] = categorie;
      request.fields['etat'] = etat;
      request.fields['user_id'] = user_id.toString();

      // Ajout du fichier image comme MultipartFile
      request.files.add(await http.MultipartFile.fromPath(
        'photo', // Nom du champ dans le formulaire HTTP
        imageFile.path,
        contentType: MediaType(
            'image', 'jpg'), // Spécifie le type de contenu du fichier image
      ));

      var response = await request.send();

      if (response.statusCode == 201) {
        print('Article ajouté avec succès');
        return true;
      } else {
        print('Échec de l\'ajout de l\'article: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('Erreur lors de l\'ajout de l\'article: $e');
      return false;
    }
  }

  static Future<void> deleteArticle(int articleId) async {
    final url = Uri.parse('$baseUrl/article/$articleId');

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // La suppression a réussi
      print('Article supprimé avec succès');
    } else {
      // La suppression a échoué
      throw Exception('Échec de la suppression de l\'article');
    }
  }

  Future<User> getUserById(int userId) async {
    try {
      var url =
          Uri.parse('$baseUrl/users/$userId'); // Remplacez par votre endpoint
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      print('Error retrieving user: $error');
      throw error;
    }
  }
}

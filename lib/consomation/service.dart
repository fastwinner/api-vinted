import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://your-api-url.com/api';

  // Méthode pour récupérer la liste des utilisateurs depuis l'API Laravel
  static Future<List<dynamic>> getUsers() async {
    try {
      var url = Uri.parse('$baseUrl/users');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // Convertir la réponse JSON en une liste d'objets dynamiques (dans ce cas, des utilisateurs)
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error fetching users: $error');
      throw error; // Renvoie l'erreur pour être gérée par l'appelant
    }
  }
}

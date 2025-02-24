import 'package:http/http.dart' as http;
import 'dart:convert';

final endpoint = "recipes";

Future <List<Map<String, dynamic>>> fetchRecipes() async{
  final response = await http.get(Uri.parse("https://cookboard-api.onrender.com/recipes"));

  if(response.statusCode == 200){
    final List<dynamic> data = json.decode(response.body);
    final List <Map<String, dynamic>> recipes = data.map((json) => json as Map<String, dynamic>).toList();

    return recipes;
  }
  else{
    throw Exception('Failed to fetch recipes');
  }
}

Future<List<Map<String, dynamic>>> fetchMostLikedRecipes() async {
  final response = await http.get(Uri.parse('https://cookboard-api.onrender.com/recipes'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    print(data); // Add this line to see the content of the response data
    final List<Map<String, dynamic>> recipes =
    data.map((json) => json as Map<String, dynamic>).toList();
    return recipes;
  } else {
    throw Exception('Failed to fetch most liked recipes');
  }
}


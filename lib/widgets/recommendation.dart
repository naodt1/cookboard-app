import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/backend/recipe_service.dart';

class RecommendationList extends StatefulWidget {
  const RecommendationList({Key? key}) : super(key: key);

  @override
  State<RecommendationList> createState() => _RecommendationListState();
}

class _RecommendationListState extends State<RecommendationList> {
  Future<List<Map<String, dynamic>>> _fetchMostLikedRecipes() async {
    // Call the function to fetch most liked recipes from the backend
    return fetchMostLikedRecipes();
  }

  Future<Map<String, dynamic>> fetchUserById(String userId) async {
    final response = await http.get(Uri.parse('https://cookboard-api.onrender.com/users/$userId'));

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch user by ID');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchMostLikedRecipes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the data to be fetched, you can show a loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors if the API call fails
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Map<String, dynamic>> recipes = snapshot.data!;
          return Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipes.map((recipe) {
                  final String foodImg = recipe['imageUrl'];
                  final String recipeTitle = recipe['title'];
                  final String userId = recipe['createdBy']; // Assuming 'createdBy' is the user ID as a String

                  return FutureBuilder<Map<String, dynamic>>(
                    future: fetchUserById(userId),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.connectionState == ConnectionState.waiting) {
                        // While waiting for the user data to be fetched, you can show a loading indicator
                        return CircularProgressIndicator();
                      } else if (userSnapshot.hasError) {
                        // Handle errors if the API call fails
                        return Text('Error: ${userSnapshot.error}');
                      } else if (userSnapshot.hasData && userSnapshot.data!['username'] != null) {
                        // Ensure that user data is available and the 'name' field is not null
                        final String userName = userSnapshot.data!['username'];
                        return RecommendationButton(
                          foodImg: foodImg,
                          recipeTitle: recipeTitle,
                          userName: userName,
                        );
                      } else {
                        // Handle the case when user data is null or 'name' field is null
                        return Text('User not found');
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}


class RecommendationButton extends StatelessWidget {
  final String foodImg;
  final String recipeTitle;
  final String userName;

  RecommendationButton({
    required this.foodImg,
    required this.recipeTitle,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 235,
      // ... Your existing widget code
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(foodImg, scale: 1.0, fit: BoxFit.fitHeight),
              ),
            ),
            SizedBox(height: 10.0),
            Text(recipeTitle, style: TextStyle(fontWeight: FontWeight.w700)),
            SizedBox(height: 2.0),
            Text('By $userName', style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}

// Your fetchMostLikedRecipes function and other code here

import 'package:cookboard/widgets/food_collection.dart';
import 'package:cookboard/widgets/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../view-model/recipes_model.dart';

class SavedRecipesPage extends StatefulWidget {
  const SavedRecipesPage({Key? key}) : super(key: key);

  @override
  State<SavedRecipesPage> createState() => _SavedRecipesPageState();
}

class _SavedRecipesPageState extends State<SavedRecipesPage> {

 List<Recipes> recipes = [
   Recipes(title: 'Pancake', description: 'Description Here',
       ingredients: 'Ingredients Here', instructions: 'Instruction Here', timestamp: DateTime.now(),
       imageUrl: 'https://source.unsplash.com/random/900%C3%97700/?pancake'),
   Recipes(title: 'Oatmeal', description: 'Description Here',
       ingredients: 'Ingredients Here', instructions: 'Instruction Here', timestamp: DateTime.now(),
       imageUrl: 'https://source.unsplash.com/random/900%C3%97700/?oatmeal'),
   Recipes(title: 'Spicy Noodles', description: 'Description Here',
       ingredients: 'Ingredients Here', instructions: 'Instruction Here', timestamp: DateTime.now(),
       imageUrl: 'https://source.unsplash.com/random/900%C3%97700/?noodles'),
   Recipes(title: 'Pancake', description: 'Description Here',
       ingredients: 'Ingredients Here', instructions: 'Instruction Here', timestamp: DateTime.now(),
       imageUrl: 'https://source.unsplash.com/random/900%C3%97700/?pancake'),
   Recipes(title: 'Pancake', description: 'Description Here',
       ingredients: 'Ingredients Here', instructions: 'Instruction Here', timestamp: DateTime.now(),
       imageUrl: 'https://source.unsplash.com/random/900%C3%97700/?pancake'),
 ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SafeArea(
          minimum: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bookmark', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 26.0
              ),),
              SizedBox(
                height: 20,
              ),
              SearchField(),
              Food_Collection(recipes: recipes, title: 'Recently Viewed'),
              Food_Collection(recipes: recipes, title: 'Made It'),
              Food_Collection(recipes: recipes, title: 'Breakfast')
            ],
          ),
        ),
      ),
    );
  }
}


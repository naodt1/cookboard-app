import 'package:flutter/material.dart';

import '../view-model/recipes_model.dart';

class Food_Collection extends StatelessWidget {
  final List<Recipes> recipes;
  final String title;

  Food_Collection({required this.recipes, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(recipes[0].imageUrl,
                        fit: BoxFit.cover, height: 150, width: 200,),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(recipes[1].imageUrl,
                              fit: BoxFit.cover, height: 70, width: 120,),
                        ),
                        SizedBox(height: 8,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(recipes[2].imageUrl,
                              fit: BoxFit.cover, height: 70, width: 120, color: Colors.black45,
                              colorBlendMode: BlendMode.darken),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

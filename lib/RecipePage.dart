import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {



  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['Food'],
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['Type'],
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ],
      ),
      onTap: (){
        print(document['Recipe']);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // body: StreamBuilder(
      //     stream: Firestore.instance.collection('Recipes').snapshots(),
      //     builder: (context,snapshot){
      //       if (!snapshot.hasData) return const Text("Loading...");
      //       return ListView.builder(
      //           itemExtent: 100.0,
      //           itemCount: snapshot.data.documents.lenght,
      //           itemBuilder: (context,index) =>
      //               _buildListItem(context,snapshot.data.documents[index])
      //       );
      //     }),
    );
  }
}

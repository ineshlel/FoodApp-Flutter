import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import './recipe.dart';

class RecipesPage extends StatefulWidget {
  /* List data;
  RecipesPage(this.data);
  List  get allRecipes{
     return List.from(data);
   }*/

  @override
  State<StatefulWidget> createState() {
    return RecipesPageState();
  }
}

class RecipesPageState extends State<RecipesPage> {
  List data;

  final String url =
      'https://api.spoonacular.com/recipes/search?apiKey=3dbbf96defd0485783e0b4b7ec861876';

  @override
  void initState() {
    super.initState();

    this.fetchData();
  }

  Future<String> fetchData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Content-Type": "application/json"},
    );

    setState(() {
      var responseData = json.decode(response.body);
      print(response.body);
      data = responseData["results"];
    });

    return "success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://spoonacular.com/recipeImages/${data[index]["id"].toString()}-240x150.jpg'),
                        SizedBox(height: 10.0),
                        Text(
                          data[index]["title"],
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        IconButton(
                          icon: Icon(Icons.info),
                          color: Colors.blue,
                          // color:Theme.of(context).accentColor,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Recipe(data[index]["id"]),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


class IngredientsPage extends StatefulWidget{
  int id;
  IngredientsPage(this.id);
  @override
  State<StatefulWidget> createState() {
    
    return IngredientsPageState();
  }
}
class IngredientsPageState extends State<IngredientsPage>{
List data;
 @override
  void initState() {
    super.initState();

    this.fetchData(widget.id);
  }

  Future<String> fetchData(int id) async {
    var response = await http.get(
      Uri.encodeFull('https://api.spoonacular.com/recipes/${widget.id.toString()}/ingredientWidget.json?apiKey=a7afe59b1d4a492bbf2adac6c5ea8a7b'),
      headers: {"Content-Type": "application/json"},
    );

    setState(() {
      var responseData = json.decode(response.body);
      print(response.body);
      data = responseData["ingredients"];
    });

    return "success!";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child:
                    new SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                     child: Row(
                      children: <Widget>[
                        Image.network(
                            'https://spoonacular.com/cdn/ingredients_100x100/${data[index]["name"]}.jpg'),
                     
                        Text(
                          data[index]["name"],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.normal),
                        ),
                        
                      ],
                    ),),
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
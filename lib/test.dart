
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'overview_page.dart';

class Test extends StatefulWidget {
  Test();
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<Test> {


 String cuisineChoice='american';
  String dietChoice='ketogenic';
  String intolerancesChoice='grain free';
 List datachoice;
  String pas='pasta';
  /*int max=25;
  int numb=2;*/
  
  

 Future<String> fetchDataChoix(String cuisineChoice,String dietChoice,String intolerancesChoice,String pas) async {
 // Future<String> fetchDataChoix(String pas,int max ,int numb) async {
  
    
    var response = await http.get(
Uri.encodeFull('https://api.spoonacular.com/recipes/search?query=$pas&cuisine=$cuisineChoice&diet=$dietChoice&intolerances=$intolerancesChoice?apiKey=3dbbf96defd0485783e0b4b7ec861876'),
 // Uri.encodeFull('https://api.spoonacular.com/recipes/complexSearch?query=$pas&maxFat=$max&number=$numb?apiKey=3dbbf96defd0485783e0b4b7ec861876'),  
 
      
      headers: {"Content-Type": "application/json"},
    );

    setState(() {
      var responseDataChoice = json.decode(response.body);
      print(response.body);
      datachoice = responseDataChoice["results"];
    });

    return "success!";
  }
  void initState() {
    super.initState();

    this.fetchDataChoix(cuisineChoice,dietChoice,intolerancesChoice,pas);
  }
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: datachoice == null ? 0 : datachoice.length,
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
                            'https://spoonacular.com/recipeImages/${datachoice[index]["id"].toString()}-240x150.jpg'),
                        SizedBox(height: 10.0),
                        Text(
                          datachoice[index]["title"],
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                       
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
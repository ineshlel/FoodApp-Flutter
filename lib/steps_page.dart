import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


class StepsPage extends StatefulWidget{
  int id;
  StepsPage(this.id);
  @override
  State<StatefulWidget> createState() {
    
    return StepsPageState();
  }
}
class StepsPageState extends State<StepsPage>{
 List data;
 @override
  void initState() {
    super.initState();

    this.fetchData(widget.id);
  }

  Future<String> fetchData(int id) async {
    var response = await http.get(
      Uri.encodeFull('https://api.spoonacular.com/recipes/${widget.id.toString()}/analyzedInstructions?apiKey=3dbbf96defd0485783e0b4b7ec861876'),
      headers: {"Content-Type": "application/json"},
    );

    setState(() {
      var responseData = json.decode(response.body);
      print(response.body);
      data = responseData["steps"];
    });

    return "success!";
  
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: ListView.builder(
        itemCount: data == null ? 0 :(data.length) ,
         itemBuilder: (BuildContext context,int index  ) {
         return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                       // Text('hello'),
                        
                       // SizedBox(height: 10.0),
                       // Row(
                         //children: <Widget>[ 
                           // Text(index.toString()+')'),
                           Text( data[index]["number"],style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.normal),),
                        Text( data[index]["step"],style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.normal),
                        ),
                      //] ),
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
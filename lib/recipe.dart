import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Recipe extends StatefulWidget{
int id;
Recipe(this.id);

  
    @override
State<StatefulWidget> createState() {
    
    return RecipeState();
  }
}              
class RecipeState extends State<Recipe>{
  
  Map<String,dynamic> dataSum;
   @override
  void initState(){
    
    super.initState();
    this.fetchDataSummary(widget.id);
  }
 Future<String> fetchDataSummary(int id) async{
   final String url='https://api.spoonacular.com/recipes/${widget.id.toString()}/summary?apiKey=3dbbf96defd0485783e0b4b7ec861876';

    var response= await http.get(
      Uri.encodeFull(url),
      headers: {"Content-Type": "application/json"},
    );
     setState(() {
      var responseData =json.decode(response.body) ;
      print(response.body);
      dataSum=responseData;

    });

     return "success";
 }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold (
       appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Container(
      child:Center(child: 
         new SingleChildScrollView(
                scrollDirection: Axis.vertical,
             
        child:Column(
        
          children: <Widget>[
            Image.network('https://spoonacular.com/recipeImages/${widget.id.toString()}-312x150.jpg'),
            SizedBox(height:10.0),
           Text(dataSum["title"],style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold ),),
           //SizedBox(height:10.0),
           Container(
             padding: EdgeInsets.all(30.0),
             child: Text(dataSum["summary"]),

           ) ,

          ],
        ),


      )
      ,)
    ),
    );
  }
}
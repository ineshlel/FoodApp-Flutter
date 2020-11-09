import 'package:flutter/material.dart';


class OverviewPage extends StatefulWidget{
int id;
String title;
  OverviewPage(this.id,this.title);
  @override
  State<StatefulWidget> createState() {
    
    return OverviewPageState();
  }
  
}

class OverviewPageState extends State<OverviewPage>{
  @override
  Widget build(BuildContext context) { 
    
    return Scaffold(
     
      body: 
        Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://spoonacular.com/recipeImages/${widget.id.toString()}-312x231.jpg'),
                        SizedBox(height: 10.0),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                       
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
     
      
    );
  }

}
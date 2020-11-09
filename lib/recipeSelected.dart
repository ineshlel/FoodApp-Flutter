import'package:flutter/material.dart';

class RecipeSelected extends StatefulWidget{
  List data;
  RecipeSelected(this.data);
  @override
  State<StatefulWidget> createState() {
    
    return RecipeSelectedState();
  }
}
class RecipeSelectedState extends State<RecipeSelected>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Selected'),
      ),
      body: ListView.builder(
        itemCount: widget.data == null ? 0 : widget.data.length,
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
                            'https://spoonacular.com/recipeImages/${widget.data[index]["id"].toString()}-240x150.jpg'),
                        SizedBox(height: 10.0),
                        Text(
                          widget.data[index]["title"],
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
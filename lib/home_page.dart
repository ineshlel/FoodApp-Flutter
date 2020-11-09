import 'package:flutter/material.dart';
import 'recipes.dart';
import 'chooseRecipe.dart';
import'test.dart';
import 'searchRecipe.dart';


class HomePage extends StatelessWidget{
  HomePage();



  Widget _buildSideDrawer(BuildContext context){
   return   Drawer(child: Column(children: <Widget>[
        AppBar( 
          automaticallyImplyLeading:false,
          title:Text('Choose'),),
        ListTile(
          leading:Icon(Icons.list),
          title:Text('Recipes'),
          onTap:(){
         Navigator.push( context,MaterialPageRoute(builder: (BuildContext context) =>RecipesPage()),  );
          },
          ),
          ListTile(
          leading:Icon(Icons.search),
          title:Text('Search Recipe'),
          onTap:(){
         Navigator.push( context,MaterialPageRoute(builder: (BuildContext context) =>ExamplePage()),  );
          },

          ),
           ListTile(
          leading:Icon(Icons.edit),
          title:Text('Choose youe own recipe'),
          onTap:(){
         Navigator.push( context,MaterialPageRoute(builder: (BuildContext context) =>ChooseRecipe()),  );
          },

          ),
      ],),);
 }
 DecorationImage _buildBackgroundImage(){

    return  DecorationImage(
              fit:BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),BlendMode.dstATop),
            image:AssetImage('assets/backgrnd3.jpg'),
              );}
   @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:_buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Home Page'),),
           body: Container(
             decoration: BoxDecoration(
            image:_buildBackgroundImage(),
              ),
           ),
     
        );



}
}
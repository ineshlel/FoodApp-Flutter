import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'chooseRecipe.dart';
import'recipeDetails.dart';
/*import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';*/


class ExamplePage extends StatefulWidget {
  ExamplePage();
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
 // final formKey = new GlobalKey<FormState>();
 // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Recipe' );

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }
   DecorationImage _buildBackgroundImage(){

    return  DecorationImage(
              fit:BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),BlendMode.dstATop),
            image:AssetImage('assets/backgrnd3.jpg'),
              );}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        decoration: BoxDecoration(
            image:_buildBackgroundImage(),
              ),
        child: _buildList(),
        
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,

      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]["title"].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]["title"],style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold ),),
          onTap: () {
            print(filteredNames[index]["title"]);
            Navigator.push(context, MaterialPageRoute( builder:(BuildContext context) =>RecipeDetails(filteredNames[index]["title"],filteredNames[index]["id"])),);


          } 
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Recipe' );
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _getNames() async {
  final response = await dio.get('https://api.spoonacular.com/recipes/search?apiKey=3dbbf96defd0485783e0b4b7ec861876');
  // final response = await dio.get('https://api.spoonacular.com/recipes/autocomplete?apiKey=a7afe59b1d4a492bbf2adac6c5ea8a7b');
    print('*************');
    print(response);
    print('*************');
    
    List tempList = new List();
    for (int i = 0; i < response.data["results"].length; i++) {
      tempList.add(response.data["results"][i]);
    }
   /* for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }*/
    print('################');
   // print(response.data["results"][1]);
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }


} 
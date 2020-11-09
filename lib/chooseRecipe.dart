
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'recipeSelected.dart';

class ChooseRecipe extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    return ChooseRecipeState();
  }
}

class ChooseRecipeState extends State<ChooseRecipe> {
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;

  String cuisineChoice;
  String dietChoice;
  String intolerancesChoice;
  List datachoice;
void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
      switch (_radioValue1) {
        case 0:
        cuisineChoice='African';
        break;
        case 1:
        cuisineChoice='American';
        break;
        case 2:
        cuisineChoice='European';
        break;
    }});
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
      switch (_radioValue1) {
        case 0:
        dietChoice='Gluten Free';
        break;
        case 1:
        dietChoice='Ketogenic';
        break;
        case 2:
        dietChoice='Vegetarian';
        break;
    }
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;
       switch (_radioValue1) {
        case 0:
        intolerancesChoice='Dairy Free';
        break;
        case 1:
        intolerancesChoice='Grain Free';
        break;
        case 2:
        intolerancesChoice='Sesame Free';
        break;
    }
    });
  
  }
 Future<String> fetchDataChoix(String cuisineChoice,String dietChoice,String intolerancesChoice) async {
  
    
    var response = await http.get(
   Uri.encodeFull(
'https://api.spoonacular.com/recipes/complexSearch?cuisine=$cuisineChoice&diet=$dietChoice&intolerances=$intolerancesChoice?3dbbf96defd0485783e0b4b7ec861876'),
    
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

    this.fetchDataChoix(cuisineChoice,dietChoice,intolerancesChoice);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Specefic Recipe'),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: Container(
          // padding: EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Select your own recipe:',
                style:
                    new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
              ),
              Divider(height: 5.0, color: Colors.black),
              Padding(
                padding: new EdgeInsets.all(8.0),
              ),
              Text(
                'Cuisine :',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
              child:new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  new Text(
                    'African',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  new Text(
                    'American',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  new Radio(
                    value: 2,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  new Text(
                    'European',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                ],
              )),
              Divider(height: 5.0, color: Colors.black),
              Padding(
                padding: new EdgeInsets.all(8.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Diet :',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                     child:  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue2,
                        onChanged: _handleRadioValueChange2,
                      ),
                      new Text(
                        'Gluten Free',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue2,
                        onChanged: _handleRadioValueChange2,
                      ),
                      new Text(
                        'Ketogenic',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: _radioValue2,
                        onChanged: _handleRadioValueChange2,
                      ),
                      new Text(
                        'Vegetarian',
                        style: new TextStyle(fontSize: 16.0), 
                              ),
                ],
              )),
         Divider(height: 5.0, color: Colors.black),
              Padding(
                padding: new EdgeInsets.all(8.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Intolerances :',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                   new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
              child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue3,
                        onChanged: _handleRadioValueChange3,
                      ),
                      new Text(
                        'Dairy Free',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue3,
                        onChanged: _handleRadioValueChange3,
                      ),
                      new Text(
                        'Grain Free',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: _radioValue3,
                        onChanged: _handleRadioValueChange3,
                      ),
                      new Text(
                        'Sesame Free',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                
                    ], 
                  ),),
                ],
              ),
              new RaisedButton(
                child: Text(
                  'Done',
                  style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                color: Theme.of(context).accentColor,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                    onPressed: ()  => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RecipeSelected(datachoice),
                              )),
              ),
            ],
          ),
              ]
              ),
                ));
  }
}

import 'package:flutter/material.dart';
import 'overview_page.dart';
import 'ingredients_page.dart';
import 'steps_page.dart';


class RecipeDetails extends StatefulWidget{
 int id ;
 String title;
  RecipeDetails(this.title,this.id);
  @override
  State<StatefulWidget> createState() {
    
    return RecipeDetailsState() ;
  }
}


class RecipeDetailsState extends State<RecipeDetails> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
        return new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
              bottom: new TabBar(
                tabs: <Tab>[
                  new Tab(
                    text: "OVERVIEW",
                    icon: new Icon(Icons.image),
                  ),
                  new Tab(
                    text: "INGREDIENTS",
                    icon: new Icon(Icons.card_giftcard),
                  ),
                   new Tab(
                    text: "STEPS",
                    icon: new Icon(Icons.list),
                  ),
                ],
                controller: _tabController,
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
               new OverviewPage(widget.id,widget.title),
               new IngredientsPage(widget.id),
               new StepsPage(widget.id),
               
              ],
              controller: _tabController,
            ),
    
  );
            
       
      
    
  }
}

import 'package:flutter/material.dart';

void main() {

  runApp
  (LongList(items: List<String>.generate(100, (index) => "Item $index"),));
//   runApp(ItemList(
//   items: List<ListItem>.generate(100, (index) => index% 6==0?
//   HeadingItem("Heading $index"):PersonItem("First name $index","last name $index")
//  //PersonItem("First name $index","last name $index"): HeadingItem("Heading $index")
//   ),
//   ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple List'),

      ),
      body:Container(child: ListView(
        //scrollDirection: Axis.horizontal,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),

          ),
          ListTile(leading: Icon(Icons.photo_album),
          title: Text('Album'),
          ),
          ListTile(leading: Icon(Icons.alarm),
          title: Text('Alarm'),
          )
        ],),)
 
      ),

    );
  }
}

class HorizontalList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal List'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
           // scrollDirection: Axis.horizontal,
            children: <Widget>[
          Container(height: 50,width: 50,color: Colors.blueGrey,),
          Container(height: 50,width: 50,color: Colors.brown,),
          Container(height: 50,width: 50,color: Colors.amber,),
          Container(height: 50,width: 50,color: Colors.deepOrangeAccent,)

        ],
        ),
        ),
        )
        );
  
  }

}

class ItemList extends StatelessWidget{
  final List<ListItem> items;
  //constructor
  ItemList({Key key,@required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lists'),
    ),
    
    body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context,index){
        final item=items[index];
        return ListTile(
          title: item.builtTitle(context),
          subtitle: item.buildSubTitle(context),
          onTap: (){},
          
          );
      },
      ),
    ),
    );
    

  }
  
}


abstract class ListItem{
  //fun declatation only
  Widget builtTitle(BuildContext contex);
  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem{
  final String heading;
  HeadingItem(this.heading);//one argument constructor

  @override
  Widget buildSubTitle(BuildContext context) {
    return null;
   
   
    }
  
    @override
    Widget builtTitle(BuildContext context) {
       return Text(
      heading,
    style: Theme.of(context).textTheme.headline3,);
  
  }

}

class PersonItem implements ListItem{


  final String firstName;
  final String lastName;

  PersonItem(this.firstName,this.lastName);

  @override
  //=> no need to return
  Widget buildSubTitle(BuildContext context)=>Text(lastName);

  
  
    @override
    Widget builtTitle(BuildContext conteontex)=>Text(firstName);
}

class LongList extends StatelessWidget{
  final List<String> items;

  LongList({Key key,@required this.items}):super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Long List'),
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return ListTile(title: Text('Item$index'),);
            }),
          )
          );
    
  }

}
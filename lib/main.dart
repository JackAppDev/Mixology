import 'package:flutter/material.dart';
import 'dart:math';
import 'Mixer.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mixology',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  TextEditingController controller;
  Map<Ingredient, bool> selectedIngredients = {};

  @override
  initState() {
    super.initState();
    controller = new TextEditingController();
    for (Ingredient ingredient in Mixer.ingredients) {
      selectedIngredients[ingredient] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var localSelectedIngredients = [];
    selectedIngredients.forEach((Ingredient ingredient, bool selected) {
      if (selected) {
        localSelectedIngredients.add(ingredient);
      }
    });
    var possibleDrinks = Mixer.findDrinks(localSelectedIngredients);
    print(possibleDrinks.map((d) {
      return d.toString()
        .substring(d.toString().indexOf('.') + 1)
        .toString();
    }).toList());
    var randomDrink = possibleDrinks.isNotEmpty
        ? possibleDrinks.first 
        : new Drink(name: "name");
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
      ),
      body: new ListView.builder(
        itemCount: Mixer.ingredients.length,
        itemBuilder: (BuildContext context, int index) {
          return new CheckboxListTile(
            value: selectedIngredients[Mixer.ingredients[index]],
            onChanged: (bool selected) {
              setState(() {
                selectedIngredients[Mixer.ingredients[index]] = selected;
              });
            },
            title: new Text(Mixer.ingredients[index]
                .toString()
                .substring(Mixer.ingredients[index].toString().indexOf('.') + 1)
                .toString()),
          );
        },
      ),
      floatingActionButton: new Builder(
        builder: (BuildContext context) {
          return new FloatingActionButton(
            child: new ImageIcon(new AssetImage("assets/manhattan.png")),
            onPressed: () {
              setState(() {});
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                return new ConstrainedBox(
                  constraints: new BoxConstraints(maxHeight: 130.0),
                  child: new AppBar(
                    automaticallyImplyLeading: false,
                    title: new Text(randomDrink.name),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}

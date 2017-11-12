class Mixer {
  static List<Ingredient> search(String query) {
    var localIngredients = ingredients;
    localIngredients.retainWhere((Ingredient ingredient) {
      return ingredient
          .toString()
          .substring(ingredient.toString().indexOf('.') + 1)
          .toString()
          .toUpperCase()
          .startsWith(query.toUpperCase());
    });
    return localIngredients;
  }

  static final List<Ingredient> ingredients = Ingredient.values;
  static final List<Drink> drinks = [
    new Drink(
      name: "Long island iced tea",
      ingredients: [
        Ingredient.Vodka,
        Ingredient.Coke,
        Ingredient.SweetAndSourMix,
      ],
    ),
    new Drink(name: "Vodka redbull", ingredients: [
      Ingredient.Vodka,
      Ingredient.RedBull,
    ]),
    new Drink(
      name: "Vodka cranberry",
      ingredients: [
        Ingredient.Vodka,
        Ingredient.CranberryJuice,
      ],
    ),
    new Drink(
      name: "Jack Daniels and coke",
      ingredients: [
        Ingredient.JackDaniels,
        Ingredient.Coke,
      ],
    ),
    new Drink(
      name: "Jungle juice",
      ingredients: [
        Ingredient.OrangeJuice,
        Ingredient.Vodka,
        Ingredient.HawianPunch,
      ],
    ),
    new Drink(
      name: "Screwdriver",
      ingredients: [
        Ingredient.Vodka,
        Ingredient.OrangeJuice,
      ],
    ),
    new Drink(
      name: "Vodka lemonade",
      ingredients: [
        Ingredient.Vodka,
        Ingredient.Lemonade,
      ],
    ),
    new Drink(
      name: "Captain Morgan and coke",
      ingredients: [
        Ingredient.CapitanMorgan,
        Ingredient.Coke,
      ],
    ),
    new Drink(
      name: "Jack Daniels and sprite",
      ingredients: [
        Ingredient.JackDaniels,
        Ingredient.Sprite,
      ],
    ),
    new Drink(
      name: "Vodka and sprite",
      ingredients: [
        Ingredient.Vodka,
        Ingredient.Sprite,
      ],
    ),
  ];

  static List<Drink> findDrinks(List<Ingredient> selectedIngredients) {
    var results = [];
    if (selectedIngredients.contains(Ingredient.Vodka) &&
        selectedIngredients.contains(Ingredient.Sprite)) {
      results.add(
        new Drink(
          name: "Vodka and sprite",
          ingredients: [
            Ingredient.Vodka,
            Ingredient.Sprite,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.JackDaniels) &&
        selectedIngredients.contains(Ingredient.Sprite)) {
      results.add(
        new Drink(
          name: "Jack Daniels and sprite",
          ingredients: [
            Ingredient.JackDaniels,
            Ingredient.Sprite,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.CapitanMorgan) &&
        selectedIngredients.contains(Ingredient.Coke)) {
      results.add(
        new Drink(
          name: "Captain Morgan and coke",
          ingredients: [
            Ingredient.CapitanMorgan,
            Ingredient.Coke,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.Vodka) &&
        selectedIngredients.contains(Ingredient.Lemonade)) {
      results.add(
        new Drink(
          name: "Vodka and lemonade",
          ingredients: [
            Ingredient.Vodka,
            Ingredient.Lemonade,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.Vodka) &&
        selectedIngredients.contains(Ingredient.OrangeJuice)) {
      results.add(
        new Drink(
          name: "Screwdriver",
          ingredients: [
            Ingredient.Vodka,
            Ingredient.OrangeJuice,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.Vodka) &&
        selectedIngredients.contains(Ingredient.OrangeJuice) &&
        selectedIngredients.contains(Ingredient.HawianPunch)) {
      results.add(
        new Drink(
          name: "Jungle juice",
          ingredients: [
            Ingredient.Vodka,
            Ingredient.OrangeJuice,
            Ingredient.HawianPunch,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.JackDaniels) &&
        selectedIngredients.contains(Ingredient.Coke)) {
      results.add(
        new Drink(
          name: "Jack Daniels and coke",
          ingredients: [
            Ingredient.JackDaniels,
            Ingredient.Coke,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.Vodka) &&
        selectedIngredients.contains(Ingredient.CranberryJuice)) {
      results.add(
        new Drink(
          name: "Vodka cranberry",
          ingredients: [
            Ingredient.Vodka,
            Ingredient.CranberryJuice,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.Vodka) &&
        selectedIngredients.contains(Ingredient.Coke) &&
        selectedIngredients.contains(Ingredient.SweetAndSourMix)) {
      results.add(
        new Drink(
          name: "Long island iced tea",
          ingredients: [
            Ingredient.Vodka,
            Ingredient.Coke,
            Ingredient.SweetAndSourMix,
          ],
        ),
      );
    }

    if (selectedIngredients.contains(Ingredient.Vodka) &&
        selectedIngredients.contains(Ingredient.RedBull)) {
      results.add(
        new Drink(
          name: "Vodka redbull",
          ingredients: [
            Ingredient.Vodka,
            Ingredient.RedBull,
          ],
        ),
      );
    }
    results.shuffle();
    return results;
    // var localDrinks = drinks;
    // localDrinks.retainWhere((Drink drink) {
    //   var localIngredients = drink.ingredients;
    //   localIngredients.removeWhere((Ingredient ingredient) {
    //     return selectedIngredients.contains(ingredient);
    //   });
    //   return localIngredients.isEmpty;
    // });
    // return localDrinks;
  }
}

enum Ingredient {
  Vodka,
  RedBull,
  Coke,
  SweetAndSourMix,
  CranberryJuice,
  JackDaniels,
  OrangeJuice,
  HawianPunch,
  CapitanMorgan,
  Lemonade,
  Sprite
}

class Drink {
  final String name;
  final List<Ingredient> ingredients;

  Drink({this.name, this.ingredients});
}

// https://github.com/scottt2/design-patterns-in-dart/tree/master/builder

void main() {
  // Create a handy PizzaBuilder with an 8" diameter.
  var pizzaBuilder = PizzaBuilder(8);
  pizzaBuilder.crust = "deep dish";

  var plainPizza = Pizza(pizzaBuilder);
  print(plainPizza);
}

class PizzaBuilder {
  int _diameter;
  String _crust = 'default';

  PizzaBuilder(this._diameter);

  int get diameter => _diameter;
  set diameter(int newDiameter) {
    _diameter = newDiameter;
  }

  String get crust => _crust;
  set crust(String newCrust) {
    _crust = newCrust;
  }
}

class Pizza {
  String _crust = 'default';
  int _diameter = 0;

  Pizza(PizzaBuilder builder) {
    _crust = builder.crust;
    _diameter = builder.diameter;
  }

  String get crust => _crust;
  int get diameter => _diameter;

  @override
  String toString() {
    return "A delicous $_diameter\" pizza with $_crust crust";
  }
}

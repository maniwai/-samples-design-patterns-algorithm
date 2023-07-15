void main() {
  var typicalMorning = MorningFacade();
  typicalMorning.prepareCoffee();
}

class MorningFacade {
  final _coffeeGrinder = Grinder("coffee beans");
  final _coffeeMaker = Maker("coffee");

  prepareCoffee() {
    _coffeeGrinder.grind();
    _coffeeMaker
      ..fill()
      ..start();
    print("Coffee is brewing!");
  }
}

class Grinder {
  String _type;
  Grinder(this._type);
  void grind() => print("Grinding $_type!");
}

class Maker {
  String _type;
  Maker(this._type);
  void fill() => print("Filling the $_type maker!");
  void start() => print("Starting the $_type maker!");
}

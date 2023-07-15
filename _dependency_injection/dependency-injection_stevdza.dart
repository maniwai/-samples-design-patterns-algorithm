// https://www.youtube.com/watch?v=ZJJx8tLX89A&ab_channel=Stevdza-San

// Note: This exemple use Constructor Injection
// a better way is to use field injection by using libraries
void main() {
  var asusMotherboard = new Asus();
  var personalComputer = new PC(asusMotherboard);
  personalComputer.start();
}

class Asus implements IMotherboard {
  @override
  powerOn() => print('ASUS');
}

abstract class IMotherboard {
  powerOn();
}

class PC {
  IMotherboard motherboard;
  PC(this.motherboard);
  start() => motherboard.powerOn();
}

void main() {
  var pb = EmployeeBuilder();
  var person = pb.withName('Mani').workAt('Auchan').build();
  print(person);
}

class Person {
  String? name;
  String? position;

  @override
  String toString() {
    return 'Person(name: $name, position: $position)';
  }
}

abstract class PersonBuilder<T> {
  Person person = Person();

  T withName(String name) {
    person.name = name;
    return this as T;
  }

  Person build() {
    return person;
  }
}

class EmployeeBuilder extends PersonBuilder<EmployeeBuilder> {
  EmployeeBuilder workAt(String position) {
    person.position = position;
    return this;
  }
}

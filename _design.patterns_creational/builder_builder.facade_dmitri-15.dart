void main() {
  var pb = new PersonBuilder();
  pb.lives().city('Toulouse').works().company('Auchan').build();
}

class Person {
  // address
  String? city;
  // employment
  String? companyName;

  @override
  String toString() {
    return 'Person(city: $city, companyName: $companyName)';
  }
}

class PersonBuilder {
  Person person = new Person();

  PersonAddressBuilder lives() => new PersonAddressBuilder(person);
  PersonJobBuilder works() => new PersonJobBuilder(person);

  build() => print(person);
}

class PersonAddressBuilder extends PersonBuilder {
  Person person;
  PersonAddressBuilder(this.person);

  PersonBuilder city(value) {
    person.city = value;
    return this;
  }
}

class PersonJobBuilder extends PersonBuilder {
  Person person;

  PersonJobBuilder(this.person);

  PersonBuilder company(value) {
    person.companyName = value;
    return this;
  }
}

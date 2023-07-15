void main() {
  var apple = new Product('Apple', Color.GREEN, Size.SMALL);
  var tree = new Product('Tree', Color.GREEN, Size.LARGE);
  var house = new Product('House', Color.BLUE, Size.LARGE);

  var products = [apple, tree, house];

  var productFilter = ProductFilter();
  productFilter.filter(products, new ProductSizeSpecification(Size.LARGE)).forEach(print);
  productFilter.filter(products, new ProductColorSpecification(Color.GREEN)).forEach(print);

  productFilter.filter(products, new CombinatorSpecification(
    new ProductColorSpecification(Color.GREEN),
    new ProductSizeSpecification(Size.LARGE)
  )).forEach(print);
}

enum Color { BLUE, GREEN, RED }

enum Size { LARGE, MEDIUM, SMALL }

class Product {
  Product(this.name, this.color, this.size);
  var name, color, size;
  @override
  String toString() {
    return 'Name: $name, Color: $color, Size: $size';
  }
}

class ProductFilter implements Filter<Product> {
  @override
  Iterable<Product> filter(Iterable<Product> items, Specification<Product> spec) {
    return items.where((element) => spec.isSatisfied(element));
  }
}

class ProductSizeSpecification implements Specification<Product> {
  ProductSizeSpecification(this.size);

  Size size;

  @override
  bool isSatisfied(Product item) {
    return this.size == item.size;
  }
}

class ProductColorSpecification implements Specification<Product> {
  ProductColorSpecification(this.color);

  Color color;

  @override
  bool isSatisfied(Product item) {
    return this.color == item.color;
  }
}

class CombinatorSpecification<T> implements Specification<T> {
  CombinatorSpecification(this.first, this.second);

  Specification<T> first;
  Specification<T> second;

  @override
  bool isSatisfied(T item) {
    return first.isSatisfied(item) && second.isSatisfied(item);
  }
}

abstract class Filter<T> {
  Iterable<T> filter(Iterable<T> items, Specification<T> spec);
}

abstract class Specification<T> {
  bool isSatisfied(T item);
}

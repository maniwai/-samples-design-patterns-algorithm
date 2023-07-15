void main() {}

class LinkedList<E> {
  Node<E>? _head;
  Node<E>? _tail;
  int _length = 0;

  bool get isEmpty => _head == null;

  addFirst(E value) {
    var node = Node(value);
    if (isEmpty)
      _head = _tail = node;
    else {
      node._next = _head;
      _head = node;
    }
    return _head;
  }

  addLast(E value) {}
  removeFirst() {
    if (isEmpty || _head?._next == null) return _head = _tail = null;
  }

  getPrevious(Node? node) {}
  removeLast() {}

  @override
  String toString() {
    if (isEmpty) return 'List is empty, head: $_head, tail: $_tail, length: $_length';
    return '''
    --------------------------------
    Head   | value = ${_head?._value}, next = ${_head?._next?._value}
    Nodes  | ${_head.toString()}
    Length | $_length
    Tail   | value = ${_tail?._value}, next = ${_tail?._next?._value}
    --------------------------------
    ''';
  }
}

class Node<T> {
  Node(T value) : _value = value;

  T _value;
  Node? _next;

  @override
  String toString() {
    if (_next == null) return '$_value';
    return '$_value -> ${_next.toString()}';
  }
}

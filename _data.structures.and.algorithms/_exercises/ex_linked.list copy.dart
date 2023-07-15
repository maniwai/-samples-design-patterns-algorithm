void main() {
  var list = LinkedList();
  list.addLast(1);
  list.addLast(2);
  list.addLast(3);
  list.removeLast();
  print(list);
}

class LinkedList<E> {
  Node<E>? _head;
  Node<E>? _tail;
  int _length = 0;

  bool get isEmpty => _head == null;

  Node addFirst(E value) {
    var node = Node(value);
    if (isEmpty)
      _head = _tail = node;
    else {
      node._next = _head;
      _head = node;
    }
    _length++;
    return node;
  }

  Node addLast(E value) {
    var node = Node(value);
    if (isEmpty)
      _head = _tail = node;
    else {
      _tail?._next = node;
      _tail = node;
    }
    _length++;
    return node;
  }

  Node? removeFirst() {
    if (isEmpty || _head?._next == null) {
      _length = 0;
      _head = _tail = null;
    } else {
      var second = _head!._next as Node<E>;
      _head?._next = null;
      _head = second;
      _length--;
    }
    return _head;
  }

  getPrevious(Node? node) {
    var current = _head;
    while (current?._next != null) {
      if (current!._next == node) return current;
      current = current._next as Node<E>;
    }
    return null;
  }

  removeLast() {
    if (isEmpty || _head?._next == null) {
      _length = 0;
      return _head = _tail = null;
    } else {
      var previous = getPrevious(_tail);
      previous._next = null;
      _tail = previous as Node<E>;
      _length--;
      return previous;
    }
  }

  getAtIndex(int index) {}
  setAtIndex(int index, E value) {}
  insertAtIndex(int index, E value) {}
  removeAtIndex(int index) {}
  indexOf(E item) {}
  toArray() {}
  reverse() {}
  getKthFromTheEnd(k) {}

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

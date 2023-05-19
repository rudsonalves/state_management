class Counter {
  int _value = 0;

  Counter();

  int get value => _value;

  set value(int value) => _value = value;

  void increment() => _value++;

  void decrement() => _value--;

  void reset() => _value = 0;
}

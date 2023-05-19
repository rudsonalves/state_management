class LimitedCounter {
  int _value = 0;

  LimitedCounter();

  int get value => _value;

  set value(int value) => _value = value;

  void increment() {
    _value = _value < 5 ? _value + 1 : -5;
  }

  void decrement() {
    _value = _value > -5 ? _value - 1 : 5;
  }

  void reset() => _value = 0;
}

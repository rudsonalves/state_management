import 'package:mobx/mobx.dart';

part 'limited_counter.g.dart';

class LimitedCounter = _LimitedCounter with _$LimitedCounter;

abstract class _LimitedCounter with Store {
  @observable
  int _value = 0;

  @computed
  int get value => _value;

  @action
  void setValue(int value) => _value = value;

  @action
  void increment() {
    _value = _value < 5 ? _value + 1 : -5;
  }

  @action
  void decrement() {
    _value = _value > -5 ? _value - 1 : 5;
  }

  @action
  void reset() => _value = 0;
}

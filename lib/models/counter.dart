import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int _value = 0;

  @computed
  int get value => _value;

  @action
  void setValue(int value) => _value = value;

  @action
  void increment() => _value++;

  @action
  void decrement() => _value--;

  @action
  void reset() => _value = 0;
}

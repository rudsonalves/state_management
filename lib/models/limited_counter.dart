import 'package:flutter/material.dart';

class LimitedCounter {
  ValueNotifier<int> $value = ValueNotifier(0);

  LimitedCounter();

  int get value => $value.value;

  set value(int value) => $value.value = value;

  void increment() {
    value = $value.value;
    $value.value = value < 5 ? value + 1 : -5;
  }

  void decrement() {
    value = $value.value;
    $value.value = value > -5 ? value - 1 : 5;
  }

  void reset() => $value.value = 0;
}

import 'package:flutter/material.dart';

class Counter {
  ValueNotifier<int> $value = ValueNotifier(0);

  Counter();

  int get value => $value.value;

  set value(int value) => $value.value = value;

  void increment() => $value.value++;

  void decrement() => $value.value--;

  void reset() => $value.value = 0;
}

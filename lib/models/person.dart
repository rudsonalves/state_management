import 'package:flutter/material.dart';

class Person {
  ValueNotifier<String> $name = ValueNotifier('');
  ValueNotifier<String> $surname = ValueNotifier('');

  String get name => $name.value;
  String get surname => $surname.value;

  set name(String newName) => $name.value = newName;
  set surname(String newSurname) => $surname.value = newSurname;

  String get fullName => '$name $surname';
}

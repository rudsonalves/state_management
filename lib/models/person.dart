import 'package:mobx/mobx.dart';

part 'person.g.dart';

class Person = _Person with _$Person;

abstract class _Person with Store {
  @observable
  String _name = '';

  @observable
  String _surname = '';

  @computed
  String get name => _name;

  @computed
  String get surname => _surname;

  @action
  void setName(String newName) => _name = newName;

  @action
  void setSurname(String newSurname) => _surname = newSurname;

  @computed
  String get fullName => '$_name $_surname';
}

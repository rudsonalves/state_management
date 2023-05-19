class Person {
  String _name = '';
  String _surname = '';

  String get name => _name;
  String get surname => _surname;

  set name(String newName) => _name = newName;
  set surname(String newSurname) => _surname = newSurname;

  String get fullName => '$_name $_surname';
}

class User {
  int _idUser;
  int _idPerson;
  String _name;
  String _firstSurname;
  String _secondSurName;
  String _phone;
  String _email;
  User();

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get secondSurName => _secondSurName;

  set secondSurName(String value) {
    _secondSurName = value;
  }

  String get firstSurname => _firstSurname;

  set firstSurname(String value) {
    _firstSurname = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get idPerson => _idPerson;

  set idPerson(int value) {
    _idPerson = value;
  }

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }

  Map toJson()=>{
  'idUser': idUser,
  'idPerson': idPerson,
  'name': name,
  'firstSurname': firstSurname,
  'secondSurname': secondSurName,
  'phone': phone,
  };

}
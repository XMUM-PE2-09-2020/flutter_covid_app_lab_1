//Author: Ting Sen
class User {
  String _username;
  String _password;
  String _email;
  int _phoneNumber;

  User(this._username, this._password, this._email, this._phoneNumber);

  User.map(dynamic obj) {
    this._username = obj['username'];
    this._password = obj['password'];
    this._email = obj['email'];
    this._phoneNumber = obj['phone_number'];
  }

  String get username => _username;
  String get password => _password;
  String get email => _email;
  int get phoneNumber => _phoneNumber;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['username'] = _username;
    map['password'] = _password;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    return map;
  }
}

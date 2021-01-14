class TravelHistory {
  String _username;
  String _place;
  String _dateTime;

  TravelHistory(this._username, this._place, this._dateTime);

  TravelHistory.map(dynamic obj) {
    this._username = obj['username'];
    this._place = obj['place'];
    this._dateTime = obj['time'];
  }

  String get username => _username;
  String get place => _place;
  String get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map['username'] = _username;
    map['place'] = _place;
    map['time'] = _dateTime;
    return map;
  }
}

import 'package:flutter_covid_app_lab_1/Data/rest_data.dart';
import 'package:flutter_covid_app_lab_1/model/travel_history.dart';

abstract class AddTravelRecord {
  void onAddSuccess(bool res);
  void onAddError(Error error);
}

class AddTravelRecordPresenter {
  AddTravelRecord _view;
  RestData api = RestData();
  AddTravelRecordPresenter(this._view);

  addNewLog(TravelHistory travelHistory) {
    api
        .logTravelHistory(travelHistory)
        .then((res) => _view.onAddSuccess(res))
        .catchError((onError) => _view.onAddError(onError));
  }
}
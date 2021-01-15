import 'package:flutter_covid_app_lab_1/Data/rest_data.dart';
import 'package:flutter_covid_app_lab_1/model/travel_history.dart';

//author: ting sen
abstract class GetTravelRecord {
  void onGetSuccess(List<TravelHistory> res);
  void onGetError(Error error);
}

class GetTravelRecordPresenter {
  GetTravelRecord _view;
  RestData api = RestData();
  GetTravelRecordPresenter(this._view);

  getTravelHistory(String username) {
    api
        .getTravelHistory(username)
        .then((res) => _view.onGetSuccess(res))
        .catchError((onError) => _view.onGetError(onError));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/travelhistory_screen/get_travel_history.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';
import 'package:flutter_covid_app_lab_1/model/travel_history.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';
import 'package:flutter_session/flutter_session.dart';

//author: ting sen
class TravelHistoryScreen extends StatefulWidget {
  TravelHistoryScreen({Key key}) : super(key: key);

  @override
  _TravelHistoryScreenState createState() => _TravelHistoryScreenState();
}

class _TravelHistoryScreenState extends State<TravelHistoryScreen>
    implements GetTravelRecord {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetTravelRecordPresenter _presenter;
  User user;
  List<TravelHistory> history = [];

  @override
  void initState() {
    super.initState();
    _presenter = GetTravelRecordPresenter(this);
    _getTravelHistory();
  }

  Future<void> _getTravelHistory() async {
    dynamic token = await FlutterSession().get("token");
    user = User.map(token);
    _presenter.getTravelHistory(user.username);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Travel History'),
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: _getTravelHistory(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (history.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Place: ${history[index].place}",
                                      style: TextStyle(color: textBlack),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date & Time: ${history[index].dateTime}",
                                      style: TextStyle(color: textBlack),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: history.length,
                  );
                } else {
                  return Container(
                    child: Center(
                      child: Text("Loading history. Please Wait ... ..."),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }

  @override
  void onGetError(Error error) {
    print(error.toString());
  }

  @override
  void onGetSuccess(List<TravelHistory> res) {
    setState(() {
      history = res;
    });
  }
}

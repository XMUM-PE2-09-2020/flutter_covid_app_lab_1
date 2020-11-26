import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/travelhistory_screen/travelhistory_screen.dart';

//Author:Zehao
class QRScreen extends StatelessWidget {
  const QRScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          title: Text('Health Satus'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Health Status Code",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10, bottom: 5)),
                        Text(
                          "Name: Chris Paul",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5, bottom: 10)),
                        Text(
                          "Status: Normal",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: new BoxDecoration(
                  color: Colors.white
              ),
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Text("2020-10-20 20:20:05"),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        Image.network('http://gadgetultra.com/wp-content/uploads/2013/03/QR-CODE.png'),
                        Padding(padding: EdgeInsets.only(bottom:20)),
                        Text("Share my code"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 0,left: 30,right: 30),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TravelHistory()));},
                      child: Text("My Travel History",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.red,
                      highlightColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}

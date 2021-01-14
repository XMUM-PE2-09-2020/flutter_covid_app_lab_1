import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/Screens/home_screen/components/item_card.dart';
import 'package:flutter_covid_app_lab_1/Screens/news/webview_container.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Covid19VM.of(context).covid19NewsGet();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff0b3152),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(''),
        ),
        body: SafeArea(
            child: Container(child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left:20),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: Color(0xff0b3152),
                  child: Text("News & media", style: TextStyle(fontSize:40, color: Colors.white))
                ),
                Expanded(child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(child: view(index), onTap:(){
                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WebViewContainer(Covid19VM.of(context, true).news[index].covid19SiteSecondary);
                              },
                            ),
                          );
            });
          },
          itemCount: Covid19VM.of(context, true).news.length > 30? 30: Covid19VM.of(context, true).news.length,
        ))
              ],
            ))));
  }
  Widget  view(index) => Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Container(
                width: 100,
                height: 80,
                color: Colors.green,
                child: Image.asset("assets/images/news_image.jpg", fit: BoxFit.fill)
              ),
              Expanded(child: Padding(
                padding:EdgeInsets.only(left: 10, top : 0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(Covid19VM.of(context, false).news[index].notes, 
                  maxLines: 3, 
                  overflow: TextOverflow.ellipsis, 
                  style:TextStyle(fontSize: 15, color:Colors.black, fontWeight: FontWeight.w500))
                ],
              )
              ))],),
            );
}

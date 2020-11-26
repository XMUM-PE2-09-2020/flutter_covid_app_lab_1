import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Body> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("My Travel History"),
        bottom: TabBar(
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 1,
                      ),
                      child: Text(
                        "Sun",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "10.04",
                        style: TextStyle(fontSize: 7.5),
                      ),
                    )
                  ]),
            ),
            Tab(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 1,
                      ),
                      child: Text(
                        "Mon",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "10.05",
                        style: TextStyle(fontSize: 7.5),
                      ),
                    )
                  ]),
            ),
            Tab(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 1,
                      ),
                      child: Text(
                        "Tue",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "10.06",
                        style: TextStyle(fontSize: 7.5),
                      ),
                    )
                  ]),
            ),
            Tab(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 1,
                      ),
                      child: Text(
                        "Wed",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "10.07",
                        style: TextStyle(fontSize: 7.5),
                      ),
                    )
                  ]),
            ),
            Tab(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 1,
                      ),
                      child: Text(
                        "Thur",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "10.08",
                        style: TextStyle(fontSize: 7.5),
                      ),
                    )
                  ]),
            ),
            Tab(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 1,
                      ),
                      child: Text(
                        "Fri",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "10.09",
                        style: TextStyle(fontSize: 7.5),
                      ),
                    )
                  ]),
            ),
          ],
          controller: _tabController, // 记得要带上tabController
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
              child: Image.asset(
            'assets/images/1.png',
            width: 1000.0,
            height: 1500.0,
          )),
          Center(child: Text("图片")),
          Center(child: Text("图片")),
          Center(child: Text("图片")),
          Center(child: Text("图片")),
          Center(child: Text("图片"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.near_me),
        onPressed: () {},
      ),
    );
  }
}

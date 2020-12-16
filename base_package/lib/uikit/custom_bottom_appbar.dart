import 'package:flutter/material.dart';
import 'package:base_package/constant/color_value.dart';
import 'package:base_package/constant/style.dart';
import 'package:base_package/extensions/extension_hup.dart';

typedef void TabClick(int index);

typedef Future<bool> TabWillClick(int index);

class CustomBottomAppBar extends StatefulWidget {
  final TabClick tabClick;
  final TabWillClick tabWillClick;

  final int currentIndex;
  final Key key;
  CustomBottomAppBar(
      {this.tabClick, this.tabWillClick, this.currentIndex = 0, this.key})
      : super(key: key);
  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  MediaQueryData get _media => MediaQuery.of(context);
  int _pickIndex;

  final items = [
    {
      'title': '要闻',
      'image': 'assest/images/bar_home.png',
      'image_h': 'assest/images/bar_home_h.png'
    },
    {
      'title': '三行课堂',
      'image': 'assest/images/bar_sort.png',
      'image_h': 'assest/images/bar_sort_h.png'
    },
    {
      'title': '工作台',
      'image': 'assest/images/workbench.png',
      'image_h': 'assest/images/workbench.png'
    },
    {
      'title': '通讯录',
      'image': 'assest/images/bar_message.png',
      'image_h': 'assest/images/bar_message_h.png'
    },
    {
      'title': '我的',
      'image': 'assest/images/bar_personal.png',
      'image_h': 'assest/images/bar_personal_h.png'
    }
  ];

  @override
  void initState() {
    super.initState();
    _pickIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(bottom: _media.viewPadding.bottom),
        width: _media.size.width,
        height: 60 + _media.viewPadding.bottom,
        decoration: BoxDecoration(
            border: topBS(color: Colors.grey.withOpacity(0.1), width: 1.0)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items
                .map((e) => Expanded(
                      child: HXBarItem(
                          index: items.indexOf(e),
                          pick: _pickIndex == items.indexOf(e),
                          imageH: Image.asset(
                            e['image_h'],
                            scale: 3,
                            gaplessPlayback: true,
                          ),
                          imageN: Image.asset(
                            e['image'],
                            scale: 3,
                            gaplessPlayback: true,
                          ),
                          title: e['title'],
                          colorN: ZColors.textGreyColor,
                          tabClick: tabBarClick),
                    ))
                .toList()),
      ),
    );
  }

  void tabBarClick(int index) async {
    if (widget.tabClick != null) {
      widget.tabClick(index);
    }
    setState(() {
      _pickIndex = index;
    });
  }
}

class HXBarItem extends StatefulWidget {
  final int index;

  final TabClick tabClick;

  ///选中
  final Image imageH;

  ///未选中
  final Image imageN;

  ///选中
  final Color colorH;

  ///未选中
  final Color colorN;
  final String title;
  final bool pick;

  HXBarItem(
      {@required this.index,
      this.tabClick,
      this.imageH,
      this.imageN,
      this.colorH = ZColors.tabColorH,
      this.title = '',
      this.colorN = ZColors.tabColorN,
      this.pick = false});
  @override
  _HXBarItemState createState() => _HXBarItemState();
}

class _HXBarItemState extends State<HXBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.tabClick(widget.index);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 20.h,
                child: widget.pick == true ? widget.imageH : widget.imageN),
            Container(
                child: Text(
              widget.title,
              style: TextStyle(
                  color: widget.pick == true ? widget.colorH : widget.colorN),
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_package/uikit/common_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommonRefresh extends StatelessWidget {
  final VoidCallback onRefresh;

  final VoidCallback onLoading;

  final Widget child;
  final RefreshController refreshController;
  CommonRefresh(
      {@required this.child,
      this.onLoading,
      this.onRefresh,
      this.refreshController});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: onRefresh != null,
        enablePullUp: onLoading != null,
        header: WaterDropHeader(
          complete: Text(
            "已刷新",
            style: TextStyle(color: ZColors.textGreyColor),
          ),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body = Container();
            if (mode == LoadStatus.idle) {
            } else if (mode == LoadStatus.loading) {
              body = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation(ZColors.textGreyColor),
                      )),
                  SizedBox(width: 15),
                  Text("加载中",
                      style: pingFangM(13, color: ZColors.textGreyColor))
                ],
              );
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！",
                  style: TextStyle(color: ZColors.textGreyColor));
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!",
                  style: TextStyle(color: ZColors.textGreyColor));
            } else {
              body = Text("没有更多数据了!",
                  style: TextStyle(color: ZColors.textGreyColor));
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: child);
  }
}
